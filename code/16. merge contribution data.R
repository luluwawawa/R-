# # #
library(data.table)

# # # 1.merge data
data201805=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2018.05(0,11800).csv")
colnames(data201805)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201805", "totalCommitContributions_201805",
                       "totalRepositoryContributions_201805",
                       "totalPullRequestContributions_201805", "totalPullRequestReviewContributions_201805", "restrictedContributionsCount_201805")
data201805[,user_id:=NULL]
data201805[,is_user_or_not:=NULL]

data201806=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2018.06(0,11880).csv")
colnames(data201806)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201806", "totalCommitContributions_201806",
                       "totalRepositoryContributions_201806",
                       "totalPullRequestContributions_201806", "totalPullRequestReviewContributions_201806", "restrictedContributionsCount_201806")
data201806[,user_id:=NULL]
data201806[,is_user_or_not:=NULL]

data201807=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2018.07(0,11880).csv")
colnames(data201807)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201807", "totalCommitContributions_201807",
                       "totalRepositoryContributions_201807",
                       "totalPullRequestContributions_201807", "totalPullRequestReviewContributions_201807", "restrictedContributionsCount_201807")
data201807[,user_id:=NULL]
data201807[,is_user_or_not:=NULL]

data201808=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2018.08(0,11880).csv")
colnames(data201808)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201808", "totalCommitContributions_201808",
                       "totalRepositoryContributions_201808",
                       "totalPullRequestContributions_201808", "totalPullRequestReviewContributions_201808", "restrictedContributionsCount_201808")
data201808[,user_id:=NULL]
data201808[,is_user_or_not:=NULL]

data201809=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2018.09(0,11880).csv")
colnames(data201809)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201809", "totalCommitContributions_201809",
                       "totalRepositoryContributions_201809",
                       "totalPullRequestContributions_201809", "totalPullRequestReviewContributions_201809", "restrictedContributionsCount_201809")
data201809[,user_id:=NULL]
data201809[,is_user_or_not:=NULL]

data201810=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2018.10(0,11880).csv")
colnames(data201810)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201810", "totalCommitContributions_201810",
                       "totalRepositoryContributions_201810",
                       "totalPullRequestContributions_201810", "totalPullRequestReviewContributions_201810", "restrictedContributionsCount_201810")
data201810[,user_id:=NULL]
data201810[,is_user_or_not:=NULL]

data201811=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2018.11(0,11880).csv")
colnames(data201811)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201811", "totalCommitContributions_201811",
                       "totalRepositoryContributions_201811",
                       "totalPullRequestContributions_201811", "totalPullRequestReviewContributions_201811", "restrictedContributionsCount_201811")
data201811[,user_id:=NULL]
data201811[,is_user_or_not:=NULL]

data201812=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2018.12(0,11880).csv")
colnames(data201812)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201812", "totalCommitContributions_201812",
                       "totalRepositoryContributions_201812",
                       "totalPullRequestContributions_201812", "totalPullRequestReviewContributions_201812", "restrictedContributionsCount_201812")
data201812[,user_id:=NULL]
data201812[,is_user_or_not:=NULL]

data201901=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.01(0,11880).csv")
colnames(data201901)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201901", "totalCommitContributions_201901",
                       "totalRepositoryContributions_201901",
                       "totalPullRequestContributions_201901", "totalPullRequestReviewContributions_201901", "restrictedContributionsCount_201901")
data201901[,user_id:=NULL]
data201901[,is_user_or_not:=NULL]

data201902=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.02(0,11880).csv")
colnames(data201902)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201902", "totalCommitContributions_201902",
                       "totalRepositoryContributions_201902",
                       "totalPullRequestContributions_201902", "totalPullRequestReviewContributions_201902", "restrictedContributionsCount_201902")
data201902[,user_id:=NULL]
data201902[,is_user_or_not:=NULL]

data201903=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.03(0,11880).csv")
colnames(data201903)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201903", "totalCommitContributions_201903",
                       "totalRepositoryContributions_201903",
                       "totalPullRequestContributions_201903", "totalPullRequestReviewContributions_201903", "restrictedContributionsCount_201903")
data201903[,user_id:=NULL]
data201903[,is_user_or_not:=NULL]

data201904=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.04(0,11880).csv")
colnames(data201904)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201904", "totalCommitContributions_201904",
                       "totalRepositoryContributions_201904",
                       "totalPullRequestContributions_201904", "totalPullRequestReviewContributions_201904", "restrictedContributionsCount_201904")
data201904[,user_id:=NULL]
data201904[,is_user_or_not:=NULL]

data201905=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.05(0,11880).csv")
colnames(data201905)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201905", "totalCommitContributions_201905",
                       "totalRepositoryContributions_201905",
                       "totalPullRequestContributions_201905", "totalPullRequestReviewContributions_201905", "restrictedContributionsCount_201905")
data201905[,user_id:=NULL]
data201905[,is_user_or_not:=NULL]

data201906=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.06(0,11880).csv")
colnames(data201906)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201906", "totalCommitContributions_201906",
                       "totalRepositoryContributions_201906",
                       "totalPullRequestContributions_201906", "totalPullRequestReviewContributions_201906", "restrictedContributionsCount_201906")
data201906[,user_id:=NULL]
data201906[,is_user_or_not:=NULL]

data201907=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.07(0,11880).csv")
colnames(data201907)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201907", "totalCommitContributions_201907",
                       "totalRepositoryContributions_201907",
                       "totalPullRequestContributions_201907", "totalPullRequestReviewContributions_201907", "restrictedContributionsCount_201907")
data201907[,user_id:=NULL]
data201907[,is_user_or_not:=NULL]

data201908=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.08(0,11880).csv")
colnames(data201908)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201908", "totalCommitContributions_201908",
                       "totalRepositoryContributions_201908",
                       "totalPullRequestContributions_201908", "totalPullRequestReviewContributions_201908", "restrictedContributionsCount_201908")
data201908[,user_id:=NULL]
data201908[,is_user_or_not:=NULL]

data201909=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.09(0,11880).csv")
colnames(data201909)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201909", "totalCommitContributions_201909",
                       "totalRepositoryContributions_201909",
                       "totalPullRequestContributions_201909", "totalPullRequestReviewContributions_201909", "restrictedContributionsCount_201909")
data201909[,user_id:=NULL]
data201909[,is_user_or_not:=NULL]

data201910=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.10(0,11880).csv")
colnames(data201910)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201910", "totalCommitContributions_201910",
                       "totalRepositoryContributions_201910",
                       "totalPullRequestContributions_201910", "totalPullRequestReviewContributions_201910", "restrictedContributionsCount_201910")
data201910[,user_id:=NULL]
data201910[,is_user_or_not:=NULL]

data201911=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.11(0,11880).csv")
colnames(data201911)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201911", "totalCommitContributions_201911",
                       "totalRepositoryContributions_201911",
                       "totalPullRequestContributions_201911", "totalPullRequestReviewContributions_201911", "restrictedContributionsCount_201911")
data201911[,user_id:=NULL]
data201911[,is_user_or_not:=NULL]

data201912=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2019.12(0,11880).csv")
colnames(data201912)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_201912", "totalCommitContributions_201912",
                       "totalRepositoryContributions_201912",
                       "totalPullRequestContributions_201912", "totalPullRequestReviewContributions_201912", "restrictedContributionsCount_201912")
data201912[,user_id:=NULL]
data201912[,is_user_or_not:=NULL]

data202001=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2020.01(0,11880).csv")
colnames(data202001)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_202001", "totalCommitContributions_202001",
                       "totalRepositoryContributions_202001",
                       "totalPullRequestContributions_202001", "totalPullRequestReviewContributions_202001", "restrictedContributionsCount_202001")
data202001[,user_id:=NULL]
data202001[,is_user_or_not:=NULL]

data202002=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2020.02(0,11880).csv")
colnames(data202002)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_202002", "totalCommitContributions_202002",
                       "totalRepositoryContributions_202002",
                       "totalPullRequestContributions_202002", "totalPullRequestReviewContributions_202002", "restrictedContributionsCount_202002")
data202002[,user_id:=NULL]
data202002[,is_user_or_not:=NULL]

data202003=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2020.03(0,11880).csv")
colnames(data202003)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_202003", "totalCommitContributions_202003",
                       "totalRepositoryContributions_202003",
                       "totalPullRequestContributions_202003", "totalPullRequestReviewContributions_202003", "restrictedContributionsCount_202003")
data202003[,user_id:=NULL]
data202003[,is_user_or_not:=NULL]

data202004=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2020.04(0,11880).csv")
colnames(data202004)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_202004", "totalCommitContributions_202004",
                       "totalRepositoryContributions_202004",
                       "totalPullRequestContributions_202004", "totalPullRequestReviewContributions_202004", "restrictedContributionsCount_202004")
data202004[,user_id:=NULL]
data202004[,is_user_or_not:=NULL]

data202005=fread("C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data2020.05(0,11880).csv")
colnames(data202005)=c("user_id", "login", "is_user_or_not", "totalIssueContributions_202005", "totalCommitContributions_202005",
                       "totalRepositoryContributions_202005",
                       "totalPullRequestContributions_202005", "totalPullRequestReviewContributions_202005", "restrictedContributionsCount_202005")
data202005[,user_id:=NULL]
data202005[,is_user_or_not:=NULL]


B1 = merge(data201805,data201806,by="login",all=TRUE) 
B2 = merge(B1,data201807,by="login",all=TRUE) 
B3 = merge(B2,data201808,by="login",all=TRUE)  
B4 = merge(B3,data201809,by="login",all=TRUE) 
B5 = merge(B4,data201810,by="login",all=TRUE) 
B6 = merge(B5,data201811,by="login",all=TRUE) 
B7 = merge(B6,data201812,by="login",all=TRUE) 
B8 = merge(B7,data201901,by="login",all=TRUE) 
B9 = merge(B8,data201902,by="login",all=TRUE) 
B10 = merge(B9,data201903,by="login",all=TRUE) 
B11 = merge(B10,data201904,by="login",all=TRUE) 
B12 = merge(B11,data201905,by="login",all=TRUE) 
B13 = merge(B12,data201906,by="login",all=TRUE) 
B14 = merge(B13,data201907,by="login",all=TRUE) 
B15 = merge(B14,data201908,by="login",all=TRUE) 
B16 = merge(B15,data201909,by="login",all=TRUE) 
B17 = merge(B16,data201910,by="login",all=TRUE) 
B18 = merge(B17,data201911,by="login",all=TRUE) 
B19 = merge(B18,data201912,by="login",all=TRUE) 
B20 = merge(B19,data202001,by="login",all=TRUE) 
B21 = merge(B20,data202002,by="login",all=TRUE) 
B22 = merge(B21,data202003,by="login",all=TRUE) 
B23 = merge(B22,data202004,by="login",all=TRUE) 
B24 = merge(B23,data202005,by="login",all=TRUE) 
B24[is.na(B24)]=0

fwrite(B24,"C:\\Users\\Administrator\\Desktop\\lucy\\contribution\\combi_data_all.csv")

# # # 2.analysis
temp1=mean(B24$totalIssueContributions_201805)
for (col in colnames(B24[,3:7])) {
  temp=mean(B24[[col]])
  temp1=rbind(temp1,temp)
}
temp2=mean(B24$totalIssueContributions_201806)
for (col in colnames(B24[,9:13])) {
  temp=mean(B24[[col]])
  temp2=rbind(temp2,temp)
}
temp3=mean(B24$totalIssueContributions_201807)
for (col in colnames(B24[,15:19])) {
  temp=mean(B24[[col]])
  temp3=rbind(temp3,temp)
}
temp4=mean(B24$totalIssueContributions_201808)
for (col in colnames(B24[,21:25])) {
  temp=mean(B24[[col]])
  temp4=rbind(temp4,temp)
}
temp5=mean(B24$totalIssueContributions_201809)
for (col in colnames(B24[,27:31])) {
  temp=mean(B24[[col]])
  temp5=rbind(temp5,temp)
}
temp6=mean(B24$totalIssueContributions_201810)
for (col in colnames(B24[,33:37])) {
  temp=mean(B24[[col]])
  temp6=rbind(temp6,temp)
}
temp7=mean(B24$totalIssueContributions_201811)
for (col in colnames(B24[,39:43])) {
  temp=mean(B24[[col]])
  temp7=rbind(temp7,temp)
}
temp8=mean(B24$totalIssueContributions_201812)
for (col in colnames(B24[,45:49])) {
  temp=mean(B24[[col]])
  temp8=rbind(temp8,temp)
}
temp9=mean(B24$totalIssueContributions_201901)
for (col in colnames(B24[,51:55])) {
  temp=mean(B24[[col]])
  temp9=rbind(temp9,temp)
}
temp10=mean(B24$totalIssueContributions_201902)
for (col in colnames(B24[,57:61])) {
  temp=mean(B24[[col]])
  temp10=rbind(temp10,temp)
}
temp11=mean(B24$totalIssueContributions_201903)
for (col in colnames(B24[,63:67])) {
  temp=mean(B24[[col]])
  temp11=rbind(temp11,temp)
}
temp12=mean(B24$totalIssueContributions_201904)
for (col in colnames(B24[,69:73])) {
  temp=mean(B24[[col]])
  temp12=rbind(temp12,temp)
}
temp13=mean(B24$totalIssueContributions_201905)
for (col in colnames(B24[,75:79])) {
  temp=mean(B24[[col]])
  temp13=rbind(temp13,temp)
}
temp14=mean(B24$totalIssueContributions_201906)
for (col in colnames(B24[,81:85])) {
  temp=mean(B24[[col]])
  temp14=rbind(temp14,temp)
}
temp15=mean(B24$totalIssueContributions_201907)
for (col in colnames(B24[,87:91])) {
  temp=mean(B24[[col]])
  temp15=rbind(temp15,temp)
}
temp16=mean(B24$totalIssueContributions_201908)
for (col in colnames(B24[,93:97])) {
  temp=mean(B24[[col]])
  temp16=rbind(temp16,temp)
}
temp17=mean(B24$totalIssueContributions_201909)
for (col in colnames(B24[,99:103])) {
  temp=mean(B24[[col]])
  temp17=rbind(temp17,temp)
}
temp18=mean(B24$totalIssueContributions_201910)
for (col in colnames(B24[,105:109])) {
  temp=mean(B24[[col]])
  temp18=rbind(temp18,temp)
}
temp19=mean(B24$totalIssueContributions_201911)
for (col in colnames(B24[,111:115])) {
  temp=mean(B24[[col]])
  temp19=rbind(temp19,temp)
}
temp20=mean(B24$totalIssueContributions_201912)
for (col in colnames(B24[,117:121])) {
  temp=mean(B24[[col]])
  temp20=rbind(temp20,temp)
}
temp21=mean(B24$totalIssueContributions_202001)
for (col in colnames(B24[,123:127])) {
  temp=mean(B24[[col])
  temp21=rbind(temp21,temp)
}
temp22=mean(B24$totalIssueContributions_202002)
for (col in colnames(B24[,129:133])) {
  temp=mean(B24[[col]])
  temp22=rbind(temp22,temp)
}
temp23=mean(B24$totalIssueContributions_202003)
for (col in colnames(B24[,135:139])) {
  temp=mean(B24[[col]])
  temp23=rbind(temp23,temp)
}
temp24=mean(B24$totalIssueContributions_202004)
for (col in colnames(B24[,141:145])) {
  temp=mean(B24[[col]])
  temp24=rbind(temp24,temp)
}
temp25=mean(B24$totalIssueContributions_202005)
for (col in colnames(B24[,147:151])) {
  temp=mean(B24[[col]])
  temp25=rbind(temp25,temp)
}

is_maintainer_1=cbind(temp1[,1],temp2[,1],temp3[,1],temp4[,1],temp5[,1],temp6[,1],temp7[,1],temp8[,1],temp9[,1],
                      temp10[,1],temp11[,1],temp12[,1],temp13[,1],temp14[,1],temp15[,1],temp16[,1],temp17[,1],temp18[,1],
                      temp19[,1],temp20[,1],temp21[,1],temp22[,1],temp23[,1],temp24[,1],temp25[,1])

is_maintainer_1=t(is_maintainer_1)
is_maintainer_1=as.data.table(is_maintainer_1)
m=as.data.table(list(c(1:25,1)))
m=m[-26,]
is_maintainer_1=cbind(m,is_maintainer_1)
colnames(is_maintainer_1)=c("id","totalIssueContributions","totalCommitContributions","totalRepositoryContributions","totalPullRequestContributions",
                            "totalPullRequestReviewContributions","restrictedContributionsCount")


fwrite(is_maintainer_1,"C:/Users/Administrator/Desktop/lucy/contribution/is_maintainer_1.csv")

# # 3.ggplot
is_maintainer_1[,total:=totalIssueContributions+totalCommitContributions+totalRepositoryContributions+totalPullRequestContributions+
                  totalPullRequestReviewContributions+restrictedContributionsCount]

ggplot(is_maintainer_1,aes(x=id,y=total))+
  geom_point(size=1.08)+
  geom_line(size=1.08)+
  geom_vline(xintercept =13,linetype = "solid") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total Contributions")+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))+
  geom_vline(xintercept =18,linetype = "dashed") 

# # 4.staggered 
A_all_temp=fread("C:/Users/Administrator/Desktop/lucy/合成/A_all_temp.csv")
B24 = merge(B24,A_all_temp,by="login",all=TRUE)

#3.1 for two groups(did not filter out any develpoers,only consider is maintainer=0/1)
# 2019-05(25)
length(unique(B24[creat_sponsorlist_time >"2019-05-01" & creat_sponsorlist_time<="2019-06-01",]$login)) #25
B24_temp1=B24[creat_sponsorlist_time >"2019-05-01" & creat_sponsorlist_time<="2019-06-01",]
# 2019-06(14)
length(unique(B24[creat_sponsorlist_time >"2019-06-01" & creat_sponsorlist_time<="2019-07-01",]$login)) 
B24_temp2=B24[creat_sponsorlist_time >"2019-06-01" & creat_sponsorlist_time<="2019-07-01",]
# 2019-07(15)
length(unique(B24[creat_sponsorlist_time >"2019-07-01" & creat_sponsorlist_time<="2019-08-01"&is_maintainer==1,]$login)) 
B24_temp3=B24[creat_sponsorlist_time >"2019-07-01" & creat_sponsorlist_time<="2019-08-01"&is_maintainer==1,]
# 2019-08(19)
length(unique(B24[creat_sponsorlist_time >"2019-08-01" & creat_sponsorlist_time<="2019-09-01"&is_maintainer==1,]$login)) 
B24_temp4=B24[creat_sponsorlist_time >"2019-08-01" & creat_sponsorlist_time<="2019-09-01"&is_maintainer==1,]
# 2019-09(96)
length(unique(B24[creat_sponsorlist_time >"2019-09-01" & creat_sponsorlist_time<="2019-10-01"&is_maintainer==1,]$login)) 
B24_temp5=B24[creat_sponsorlist_time >"2019-09-01" & creat_sponsorlist_time<="2019-10-01"&is_maintainer==1,]
# 2019-10(2415)
length(unique(B24[creat_sponsorlist_time >"2019-10-01" & creat_sponsorlist_time<="2019-11-01"&is_maintainer==1,]$login)) 
B24_temp6=B24[creat_sponsorlist_time >"2019-10-01" & creat_sponsorlist_time<="2019-11-01"&is_maintainer==1,]
# 2019-11(907)
length(unique(B24[creat_sponsorlist_time >"2019-11-01" & creat_sponsorlist_time<="2019-12-01"&is_maintainer==1,]$login)) 
B24_temp7=B24[creat_sponsorlist_time >"2019-11-01" & creat_sponsorlist_time<="2019-12-01"&is_maintainer==1,]
# 2019-12(336)
length(unique(B24[creat_sponsorlist_time >"2019-12-01" & creat_sponsorlist_time<="2020-01-01"&is_maintainer==1,]$login)) 
B24_temp8=B24[creat_sponsorlist_time >"2019-12-01" & creat_sponsorlist_time<="2020-01-01"&is_maintainer==1,]
# 2020-01(378)
length(unique(B24[creat_sponsorlist_time >"2020-01-01" & creat_sponsorlist_time<="2020-02-01"&is_maintainer==1,]$login)) 
B24_temp9=B24[creat_sponsorlist_time >"2020-01-01" & creat_sponsorlist_time<="2020-02-01"&is_maintainer==1,]
# 2020-02(352)
length(unique(B24[creat_sponsorlist_time >"2020-02-01" & creat_sponsorlist_time<="2020-03-01"&is_maintainer==1,]$login)) 
B24_temp10=B24[creat_sponsorlist_time >"2020-02-01" & creat_sponsorlist_time<="2020-03-01"&is_maintainer==1,]
# 2020-03(311)
length(unique(B24[creat_sponsorlist_time >"2020-03-01" & creat_sponsorlist_time<="2020-04-01"&is_maintainer==1,]$login)) 
B24_temp11=B24[creat_sponsorlist_time >"2020-03-01" & creat_sponsorlist_time<="2020-04-01"&is_maintainer==1,]
# 2020-04(452)
length(unique(B24[creat_sponsorlist_time >"2020-04-01" & creat_sponsorlist_time<="2020-05-01"&is_maintainer==1,]$login)) 
B24_temp12=B24[creat_sponsorlist_time >"2020-04-01" & creat_sponsorlist_time<="2020-05-01"&is_maintainer==1,]
# 2020-05(599)
length(unique(B24[creat_sponsorlist_time >"2020-05-01" & creat_sponsorlist_time<="2020-06-01"&is_maintainer==1,]$login)) 
B24_temp13=B24[creat_sponsorlist_time >"2020-05-01" & creat_sponsorlist_time<="2020-06-01"&is_maintainer==1,]



