#Variables

#Path of the file and directory

basedirectory: path for base directory
featuresdirectory: path for folder containing the features
trainingdirectory: path for training data
testingdirectory: path for test data

#Feature Variables

features - Full list of features
meanindex - column numbers for features with mean()
stdindex: column numbers for features with std()
allcombinedstdmean: column numbers for all of the desired features (a vector combining mean_ind and std_ind)

#activity variables

activity: a two column list consisting of the activity index and the corresponding label e.g. 1,Sitting

variables - training and testing data


train_subject: vector with subject IDs (from the training (testing) set)
train_activity: vector with activity labels (e.g., WALKING)
train_activity_index: vector with activity IDs (e.g.,1)
train_data: a data.frame whose columns are the desired features
train_all: a data.frame with a column for subject IDs, a column for activity labels, a column for activity IDs, and columns for the features in train(test)_data

all_data: the result of combining train_all and test_all

#averaging features

select_data: the portion of all_data corresponding to a certain subject engaged in a certain activity
tidy_data_set: final cleaned and processed dataset, saved to disk


# Functions

activity_labeling=function(activity_list,activity_dictionary): This is a function to convert activity numbers (1 through 6) into activity labels ('WALKING', 'SITTING', etc)

get_desired_features=function(file_x,columns): This function pulls out desired columns from a given table (e.g., 'X_train.txt'), and builds a new data.frame with those columns

'CleanData.txt' -  Name of the file on which the data must be stored




