# Assignment-Getting-and-cleaning-data

When executing the R script in this Repo, you should end up with a table that presents the average values of all means and all standard deviations for each subject and for each activity.

Before executing this script you should initially unzip the Zipped folder that was given as part of this assignment and place the folder that is created (UCI HAR Dataset) in a folder named 'assignment3' (without the quotation marks), which will in turn be in a folder named 'Git' in your 'C' drive. Therefore the path should be 'C:/Git/assignment3/UCI HAR Dataset'. You should also have already installed the packages 'dplyr' and 'reshape2'

Initially the script will set your working directory to the 'assignment3' folder.

It will then read the tables into R objects.

Then it will open the 'dplyr' package and rename the subject and activity variables, giving them the descriptive names 'Subject_number" and "Activity label".

It will then open the 'reshape2' package and it will 'dcast' the 'features' data file so that the names of the variables which are as 'rows', will become 'columns'.

It will then do some 'in interim' housekeeping, like removing objects that are not longer needed or transforming objects.

It will then 'mutate' a common variable in the data sets ('code'), and will use it to merge them.

It will then create an object via 'colnames' that will be used to rename all the variables in the data file from 'V1,V2...' to the descriptive names given in the 'Features' file.

It will then use 'select' to create a new dataframe containing only the variables 'Subject_number', 'Activity_label' and those variables that contain 'mean' and 'std' (not 'meanFreq).

It will then use 'group_by' to group by 'Subject_number' and 'Activity_label'.

It will then use 'summarize_each' to summarize all variables per subject number and per activity label.

It will then 'write.table' the resulting data frame in your working directory.
