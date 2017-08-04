library(dplyr)
# read data
trainset <- read.table("train/X_train.txt")
testset <- read.table("test/X_test.txt")

features <- read.table("features.txt")
activity_train <- read.table("train/y_train.txt")
activity_test <- read.table("test/y_test.txt")
levels <- read.table("activity_labels.txt")

subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

# merge training and test set
trainset_tbl <- tbl_df(trainset)
testset_tbl <- tbl_df(testset)
mergeddata <- bind_rows(trainset_tbl, testset_tbl)

# extract only mean and standard deviation measurements
list_features <- features[,2]
cols <- grep("mean\\(\\)|std\\(\\)", list_features)
extract <- mergeddata[,cols]

# label the columns
labels <- list_features[cols]
labels <- gsub("-","_", labels)
labels <- gsub("\\()", "", labels)
colnames(extract) <- labels

# add a column for activity
activity <- rbind(activity_train, activity_test)
activity <- tbl_df(activity)
extract <- bind_cols(activity, extract)
extract <- rename(extract, activity = V1)

# rename activities
extract$activity <- as.factor(extract$activity)
levels <- levels[,2]
levels(extract$activity) <- levels

# add a column for subject
subject <- rbind(subject_train, subject_test)
subject <- tbl_df(subject)
extract <- bind_cols(subject, extract)
extract <- rename(extract, subject = V1)

# write data
extract_group <- group_by(extract, subject, activity)
my_data <- summarize_all(extract_group, mean)
# or my_data <- summarize_at(extract_group, vars(tBodyAcc_mean_X:fBodyBodyGyroJerkMag_std), mean)
write.csv(my_data, "my_data.csv")

write.table(my_data, file = "my_data.txt", row.names = FALSE)

