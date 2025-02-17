# Load required packages
library(dplyr)

# Define file paths
train_subject <- "train/subject_train.txt"
test_subject <- "test/subject_test.txt"
train_x <- "train/X_train.txt"
test_x <- "test/X_test.txt"
features_file <- "features.txt"

# Read subject data
subject_train <- read.table(train_subject, col.names = "Subject")
subject_test <- read.table(test_subject, col.names = "Subject")

# Read feature data (processed sensor readings, NOT raw signals)
x_train <- read.table(train_x)
x_test <- read.table(test_x)

# Read features
features <- read.table(features_file, stringsAsFactors = FALSE)
# Check dimension of feature
dim(features)

# Merge the training and test datasets
merged_subjects <- rbind(subject_train, subject_test)
merged_train_test <- rbind(x_train, x_test)
#check dimension of merged_train_text data 
dim(merged_train_test)

# merged_train_test and features have same number of column now assign column names to merged_train_test data 
colnames(merged_train_test) <- features$V2

# Extract only columns containing mean() and std()
selected_data <- merged_train_test %>% select(matches("mean\\(\\)|std\\(\\)"))

# Combine subject data with filtered measurements
final_data <- cbind(merged_subjects, selected_data)

# Print the first few rows
head(final_data)
# Define file paths to read lables for test, train and activity_lables 
train_activity <- "train/y_train.txt"
test_activity <- "test/y_test.txt"
activity_labels_file <- "activity_labels.txt"
View(activity_labels_file)

# Read activity data labels 
activity_train <- read.table(train_activity, col.names = "Activity")
activity_test <- read.table(test_activity, col.names = "Activity")
# Read activity labels
activity_labels <- read.table(activity_labels_file, col.names = c("Activity", "ActivityName"))
# Merge train and test activity data
merged_activities <- rbind(activity_train, activity_test)
# Replace activity numbers with descriptive names
merged_activities <- merge(merged_activities, activity_labels, by = "Activity", all.x = TRUE)
# Ensure activities are ordered correctly
merged_activities <- merged_activities %>% arrange(Activity)
# Load subject and feature data 
final_data <- cbind(merged_subjects, merged_activities$ActivityName, selected_data)
View(final_data)
# Rename activity column
colnames(final_data)[2] <- "Activity"
# Make column names more descriptive
colnames(final_data) <- gsub("^t", "Time", colnames(final_data))
colnames(final_data) <- gsub("^f", "Frequency", colnames(final_data))
colnames(final_data) <- gsub("Acc", "Accelerometer", colnames(final_data))
colnames(final_data) <- gsub("Gyro", "Gyroscope", colnames(final_data))
colnames(final_data) <- gsub("Mag", "Magnitude", colnames(final_data))
colnames(final_data) <- gsub("BodyBody", "Body", colnames(final_data))
# Print first few rows of the cleaned dataset
head(final_data)
## Step 4 from above final_data I have created another data sest namely tidy_data set and calculated the average of each variable for each activity and each subject.
# Compute the mean of each variable grouped by Subject and Activity
tidy_data <- final_data %>%
  group_by(Subject, Activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

# write newly created tidy_data file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

# Print first few rows to verify
head(tidy_data)
