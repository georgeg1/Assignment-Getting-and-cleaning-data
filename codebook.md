The data file submitted for this assignment contains the averages (means) of certain variables grouped per subject number, per activity labels.

Specifically, the data file presents data from tri-axial movement mesurements (x-y-z) from 30 volunteers, using a samsung galaxy s device. The data file contains variables that only deal with the mean values and the standard deviation of these measurements. The intitial untidy data provided contained several variables more, which were removed during the process via  the 'select' function of the dplyr package. Therefore the variables in this data set have the following structure: 

tBodyGyro-mean()-Z

where t=time,  body=body movement, gyro=gyroscope measurement, -Z= z axis

or

tBodyAcc-mean()-Y 

where t=time,  body=body movement, acc=accuracy, -Y= y axis.

and so on. They are all means or standard deviations .

The results were grouped by the "group_by' function of the dplyr package according to subject number and activity label. The activities are 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING.

The final data file was created by merging the initial data files with the 'merge' function and renaming the initially non- descriptive variables (V1,V2...) to the current descriptive ones by the dcast and colnames function.

