## Dataset Description

The dataset contains measurements of 561 features collected from the accelerometers and gyroscopes of the Samsung Galaxy S smartphone. The data represents various activities performed by 30 subjects.

## Variables

1. **subject**: The ID of the subject who performed the activity (values range from 1 to 30).
2. **activity**: The activity performed by the subject. Possible values:
   - Walking
   - Walking Upstairs
   - Walking Downstairs
   - Sitting
   - Standing
   - Laying
3. **TimeBodyAccelerometer-mean-X**: Mean of the X-axis acceleration signal from the body accelerometer (Time domain).
4. **TimeBodyAccelerometer-mean-Y**: Mean of the Y-axis acceleration signal from the body accelerometer (Time domain).
5. **TimeBodyAccelerometer-std-X**: Standard deviation of the X-axis acceleration signal from the body accelerometer (Time domain).
6. **FrequencyBodyAccelerometer-mean-X**: Mean of the X-axis acceleration signal from the body accelerometer (Frequency domain).
7. **FrequencyBodyAccelerometer-std-X**: Standard deviation of the X-axis acceleration signal from the body accelerometer (Frequency domain).

(Continue listing other variables...)

## Data Transformation Steps

1. **Merge Training and Test Datasets**:
   The training and test data were combined into one dataset.
2. **Extract Mean and Standard Deviation**:
   Only features with "mean" and "std" in their names were selected.
3. **Descriptive Activity Names**:
   The activity names were replaced by descriptive labels such as "Walking" and "Sitting".
4. **Variable Naming**:
   The variables were renamed to be more descriptive (e.g., `TimeBodyAccelerometer-mean-X` for the time-domain mean of the accelerometer on the body).
5. **Tidy Dataset**:
   A final tidy dataset was created by calculating the average of each variable for each activity and each subject.

## Final Tidy Dataset

The final dataset contains the average of each measurement for each activity and each subject.
