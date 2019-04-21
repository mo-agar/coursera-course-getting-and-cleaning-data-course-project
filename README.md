1. For the first part of the analysis I installed the necessary packages, such as data.table, and dplyr.
2. I read all the required files to R studio.
3. I edited the first variable of the subject_train and subject_test dataframes to subjectID, as I saw this more meaningful.
4. Next I read and added the feature names from features.txt to the X_train and X_test datasets. 
5. I added the activity names to the Y_train and test dataframes. 
6. I merged the train and test sets to a final dataframe called "merged"
7. I extracted the mean and std, and added them to a new dataframe called merged2, as I was afraid I would mess up merged, so I kept it a a backup.
8. I gave the activites the labels from the text file. 
9. I edited the names of the variables; Acc, Mag, Gyro, ^t and ^f, to respecfully: Accelerator, Magnitude, Gyroscope, time and frequency. 
10. I made it all nice and tidy, and created the Tidydata.txt file.
