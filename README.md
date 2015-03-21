Peer Project - Getting and Cleaning Data
===========

This repository is my submission to the Coursera course on [Getting and Cleaning Data](https://www.coursera.org/course/getdata). The purpose of this project is to demonstrate the student’s ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

For the detailed description of the data set please see the Code Book: https://github.com/jorgeborges/getdata-project/blob/master/CodeBook.md

### Running the Script
1. Clone this repository
2. In R Studio, install the R package **reshape2**
3. Set the working directory to the directory where the repo was cloned
4. Source the ```run_analysis.R``` file
5. Run the analysis to generate the tidy dataset by running in R Studio: ```getdata.run_analysis('/path/to/project')``` where /path/to/project is your working directory

After waiting a couple of minutes, the script will let you know when its done. The Tidy Data Set should have been saved to **getdata_tidy_set.txt**

