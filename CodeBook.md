---
title: "Getting and Cleaning Data - Programming assignment"
output: html_document
---

### Data set
The original dataset includes the following files:

 * 'README.txt'
 
 * 'features_info.txt': Shows information about the variables used on the feature vector.
 
 * 'features.txt': List of all features.
 
 * 'activity_labels.txt': Links the class labels with their activity name.
 
 * 'train/X_train.txt': Training set containing a 561-feature vector with time and frequency domain variables.
 
 * 'train/y_train.txt': Training labels (activity labels).
 
 * 'test/X_test.txt': Test set containing a 561-feature vector with time and frequency domain variables.
 
 * 'test/y_test.txt': Test labels (activity labels)

The following files are available for the train and test data. Their descriptions are equivalent.

 * 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

 * 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

 * 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


### Transformations
The required transformations are achieved by the script called run_analysis.R, which:

* loads all the files needed for the analysis
* merges training and test set
* extract only mean and standard deviation measurements
* labels the columns: the feature names have been amended to adhere to naming standards of the R language. That allowed for an elegant use of R language features, such as column name filtering, and an increased code readability. Feature name adjustment example: `tBodyAcc-mean()-X` has been changed to `tBodyAcc_mean_X`, etc.
* add a column for activity
* rename activities
* add a column for subject
* write data into `my_data.txt`


