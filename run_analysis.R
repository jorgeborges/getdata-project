if (!require("reshape2")) {
    install.packages("reshape2")
}

require("reshape2")

getdata.run_analysis <- function(working.path) {
    print("Please wait, preparing tidy dataset...")
    setwd(working.path)
    
    # Gets the data sets for training and testing
    training.set <- getdata.load_dataset('train')
    test.set <- getdata.load_dataset('test')
    
    # Merges the training and the test sets to create one data set.
    full.set <- rbind(training.set, test.set)
    
    # Creates a second, independent tidy data
    # set with the average of each variable for each activity and each subject.
    # melting the measurements and casting back using mean function
    id.labels <- c("subject", "activity")
    measure.labels <- setdiff(colnames(full.set), id.labels)
    full.set.melted <- melt(full.set, id = id.labels, measure.vars = measure.labels)
    full.set.tidy <- dcast(full.set.melted, subject + activity ~ variable, mean)
    
    write.table(full.set.tidy, file = "./getdata_tidy_set.txt", row.names = F)
    msg <- paste0("Tidy dataset generated at: ", working.path, "/getdata_tidy_set.txt")
    print(msg)
}

getdata.load_dataset <- function(set.type) {
    # First load the subject data
    set.subject.path <- paste0('./dataset/', set.type, '/subject_', set.type, '.txt')
    my.set <- read.table(set.subject.path, col.names = c("subject"))
    my.activities.path <- paste0('./dataset/', set.type, '/y_', set.type, '.txt')
    
    # Uses descriptive activity names to name the activities in the data set
    my.activities <- read.table(my.activities.path)
    activities.labels <- read.table('./dataset/activity_labels.txt')
    activities.vec <- factor(
        my.activities$V1,
        labels = tolower(activities.labels$V2)
    )
    my.set$activity <- activities.vec
    
    # Extracts only the measurements on the mean and standard deviation
    # for each measurement. 
    set.measures.path <- paste0('./dataset/', set.type, '/X_', set.type, '.txt')
    my.measures <- read.table(set.measures.path)
    my.feature.names <- read.table('./dataset/features.txt', sep = " ")
    my.feature.filtered <- grepl("mean\\(|std\\(", my.feature.names$V2)
    my.measures <- my.measures[, my.feature.filtered]
    
    # Appropriately labels the data set with descriptive variable names. 
    my.feature.names.raw <- my.feature.names$V2[my.feature.filtered]
    my.feature.names.raw <- gsub("\\(\\)", "", my.feature.names.raw)
    my.feature.names.clean <- gsub("-", "_", my.feature.names.raw)
    colnames(my.measures) <- my.feature.names.clean
    
    my.set <- cbind(my.set, my.measures)
    my.set
}