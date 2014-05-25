Course Project Code Book
========================================================

Variables in TidyData.txt:
* Subject: Subject number (1 through 30)
* Activity: Activity done (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)

The following variables come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix 'Time') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals ('BodyAcceleration' and 'GravityAcceleration') using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals ('BodyAccelerationJerk' and 'BodyGyroscopeJerk'). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm ('Magnitude'). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals indicated by Frequency (for frequency domain signals). 

The AVERAGE of these signals were listed under variables:  
* TimeBodyAccelerationMeanX
* TimeBodyAccelerationMeanY
* TimeBodyAccelerationMeanZ
* TimeBodyAccelerationStdX
* TimeBodyAccelerationStdY
* TimeBodyAccelerationStdZ
* TimeGravityAccelerationMeanX
* TimeGravityAccelerationMeanY
* TimeGravityAccelerationMeanZ
* TimeGravityAccelerationStdX
* TimeGravityAccelerationStdY
* TimeGravityAccelerationStdZ
* TimeBodyAccelerationJerkMeanX
* TimeBodyAccelerationJerkMeanY
* TimeBodyAccelerationJerkMeanZ
* TimeBodyAccelerationJerkStdX
* TimeBodyAccelerationJerkStdY
* TimeBodyAccelerationJerkStdZ
* TimeBodyGyroscopeMeanX
* TimeBodyGyroscopeMeanY
* TimeBodyGyroscopeMeanZ
* TimeBodyGyroscopeStdX
* TimeBodyGyroscopeStdY
* TimeBodyGyroscopeStdZ
* TimeBodyGyroscopeJerkMeanX
* TimeBodyGyroscopeJerkMeanY
* TimeBodyGyroscopeJerkMeanZ
* TimeBodyGyroscopeJerkStdX
* TimeBodyGyroscopeJerkStdY
* TimeBodyGyroscopeJerkStdZ
* TimeBodyAccelerationMagnitudeMean
* TimeBodyAccelerationMagnitudeStd
* TimeGravityAccelerationMagnitudeMean
* TimeGravityAccelerationMagnitudeStd
* TimeBodyAccelerationJerkMagnitudeMean
* TimeBodyAccelerationJerkMagnitudeStd
* TimeBodyGyroscopeMagnitudeMean
* TimeBodyGyroscopeMagnitudeStd
* TimeBodyGyroscopeJerkMagnitudeMean
* TimeBodyGyroscopeJerkMagnitudeStd
* FrequencyBodyAccelerationMeanX
* FrequencyBodyAccelerationMeanY
* FrequencyBodyAccelerationMeanZ
* FrequencyBodyAccelerationStdX
* FrequencyBodyAccelerationStdY
* FrequencyBodyAccelerationStdZ
* FrequencyBodyAccelerationJerkMeanX
* FrequencyBodyAccelerationJerkMeanY
* FrequencyBodyAccelerationJerkMeanZ
* FrequencyBodyAccelerationJerkStdX
* FrequencyBodyAccelerationJerkStdY
* FrequencyBodyAccelerationJerkStdZ
* FrequencyBodyGyroscopeMeanX
* FrequencyBodyGyroscopeMeanY
* FrequencyBodyGyroscopeMeanZ
* FrequencyBodyGyroscopeStdX
* FrequencyBodyGyroscopeStdY
* FrequencyBodyGyroscopeStdZ
* FrequencyBodyAccelerationMagnitudeMean
* FrequencyBodyAccelerationMagnitudeStd
* FrequencyBodyAccelerationJerkMagnitudeMean
* FrequencyBodyAccelerationJerkMagnitudeStd
* FrequencyBodyGyroscopeMagnitudeMean
* FrequencyBodyGyroscopeMagnitudeStd
* FrequencyBodyGyroscopeJerkMagnitudeMean
* FrequencyBodyGyroscopeJerkMagnitudeStd
