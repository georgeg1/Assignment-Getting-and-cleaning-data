setwd('C:/Git/assignment3')

testx  <-  read.table('C:/Git/assignment3/UCI HAR Dataset/test/x_test.txt')
testy  <-  read.table('C:/Git/assignment3/UCI HAR Dataset/test/y_test.txt')
testsubject  <-  read.table('C:/Git/assignment3/UCI HAR Dataset/test/subject_test.txt')

trainx  <-  read.table('C:/Git/assignment3/UCI HAR Dataset/train/x_train.txt')
trainy  <-  read.table('C:/Git/assignment3/UCI HAR Dataset/train/y_train.txt')
trainsubject  <-  read.table('C:/Git/assignment3/UCI HAR Dataset/train/subject_train.txt')

variabls<- read.table('C:/Git/assignment3/UCI HAR Dataset/features.txt')

library(dplyr)
testsubject2 <- rename(testsubject, Subject_number= V1)
trainsubject2 <- rename(trainsubject, Subject_number= V1)
testy2 <- rename(testy, Activity_label = V1)
trainy2 <- rename(trainy, Activity_label = V1)

library(reshape2)
variabls2 <-dcast(variabls,id. ='V1', V1 ~ V2)
variabls3 <-select(variabls2, -V1)

testsubject3 <- tbl_df(testsubject2)
testy3 <- tbl_df(testy2)
testx2 <- tbl_df(testx)
variabls4 <- tbl_df(variabls3)
rm(testsubject, testsubject2, testy, testy2, testx,variabls2, variabls3)

testsubject4 <-mutate(testsubject3, code = 1:2947)
testy4 <-mutate(testy3, code = 1:2947)
testx3 <- mutate(testx2, code = 1:2947)
rm(testsubject3,testy3,testx2)

testfinal <-merge(testsubject4,testy4, by = 'code')
testfinal2 <-merge(testfinal,testx3, by = 'code')
rm(testfinal,testsubject4,testy4, testx3)

trainsubject3 <- tbl_df(trainsubject2)
trainy3 <- tbl_df(trainy2)
trainx2 <- tbl_df(trainx)
rm(trainsubject, trainsubject2, trainy, trainy2, trainx)

trainsubject4 <-mutate(trainsubject3, code = 1:7352)
trainy4 <-mutate(trainy3, code = 1:7352)
trainx3 <- mutate(trainx2, code = 1:7352)
rm(trainsubject3,trainy3,trainx2)

trainfinal <-merge(trainsubject4,trainy4, by = 'code')
trainfinal2 <-merge(trainfinal,trainx3, by = 'code')
rm(trainfinal,trainsubject4,trainy4, trainx3)

trainfinal3 <- select(trainfinal2, -code)
trainfinal4 <-mutate(trainfinal3, code = 2948:10299)
rm(trainfinal2,trainfinal3)

totalfinal <- merge(testfinal2,trainfinal4, all=TRUE)
columnames <-colnames(variabls4)

totalfinalfinal <- select(totalfinal, -(481:564))
totalfinalfinal2 <-totalfinalfinal
names(totalfinalfinal2)[4:480] <- columnames
totalfinalfinal3 <- tbl_df(totalfinalfinal2)

nextstep <- select(totalfinalfinal3, Subject_number, Activity_label, contains('mean'), contains('std'))
nextstep2 <-tbl_df(nextstep)
nextstep3 <-select(nextstep2, -(69:88))
nextstep4 <-tbl_df(nextstep3)
rm(nextstep,nextstep2,nextstep3)

nextstepgrouped  <- group_by(nextstep4, Subject_number, Activity_label)
tablegrouped <-tbl_df(nextstepgrouped)
tablegrouped2  <- group_by(tablegrouped, Subject_number, Activity_label)
rm(tablegrouped)

groupedfinal<- summarize_each(tablegrouped2, 'mean')

write.table(groupedfinal,file='finaltable.txt', row.names= FALSE)
