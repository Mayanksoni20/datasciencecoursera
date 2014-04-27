basedirectory=getwd()
featuresdirectory=paste0(basedirectory,'/UCI HAR Dataset')
trainingdirectory=paste0(basedirectory,'/UCI HAR Dataset/train')  
testingdirectory=paste0(basedirectory,'/UCI HAR Dataset/test')


setwd(featuresdirectory)
features=array(read.table('features.txt')[,2])

meanindex=vector()
stdindex=vector()
for(x in seq(1,length(features))){
  if(any(grep('mean()',features[x],fixed=T))){
    meanindex=c(meanindex,x)
  }else if (any(grep('std()',features[x],fixed=T))){
    stdindex=c(stdindex,x)}}

allcombinedstdmean=numeric(length(c(meanindex,stdindex)))
allcombinedstdmean[seq(1,length(allcombinedstdmean),2)]=meanindex
allcombinedstdmean[which(allcombinedstdmean==0)]=stdindex

get_desired_features=function(file_x,columns){
   
    which_cols=rep('NULL',length(features));    which_cols[columns]='numeric'
    new_table=read.table(file_x,colClasses=which_cols)      
    colnames(new_table)=features[columns]  
    new_table
}

setwd(featuresdirectory)
activity=read.table('activity_labels.txt')

activity_labeling=function(activity_list,activity_dictionary){
    for(x in seq(nrow(activity_dictionary))){
        activity_list[activity_list %in% activity_dictionary[x,1]]=as.character(activity_dictionary[x,2])
    }
    activity_list
}

setwd(trainingdirectory)
train_subject=read.table('subject_train.txt') 
train_activity=activity_labeling(read.table('y_train.txt')[,1],activity)   train_activity_index=read.table('y_train.txt')[,1]   train_data=get_desired_features('X_train.txt',allcombinedstdmeantrain_all=cbind(train_subject,train_activity,train_activity_index,train_data)   colnames(train_all)=c(c('SubjectID','Activity','ActivityID'),colnames(train_data))  
setwd(testingdirectory)
test_subject=read.table('subject_test.txt') test_activity=activity_labeling(read.table('y_test.txt')[,1],activity)   test_activity_index=read.table('y_test.txt')[,1]   
test_data=get_desired_features('X_test.txt',allcombinedstdmean)  
test_all=cbind(test_subject,test_activity,test_activity_index,test_data)   
colnames(test_all)=c(c('SubjectID','Activity','ActivityID'),colnames(test_data))  
all_data=rbind(test_all,train_all)

tidydataset=vector()
for(sb in sort(unique(all_data$SubjectID))){  
    for(ac in sort(unique(activity[,1]))){  
        select_data=all_data[all_data$SubjectID==sb&all_data$ActivityID==ac,]
        names(select_data)=NULL  
        tidydataset=rbind(tidydataset,unlist(c(select_data[1,c(1:3)], apply(select_data[,c(-3:-1)],2,function(x){mean(x,na.rm=T)}))))
        
    }
}
tidydataset=data.frame(tidydataset)
names(tidydataset)=names(all_data)
tidydataset$Activity=activity_labeling(tidydataset$ActivityID,activity)  
setwd(basedirectory)
write.table(tidydataset,'CleanData.txt')


