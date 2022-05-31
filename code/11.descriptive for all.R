# # description of data
library(data.table) ### clean data
library(zoo) ### generate date variable
library(ggplot2) ### parallel trend figure
library(stargazer) ## output regression results to Word
library(pastecs)  # # descriptive analysis

#1.for long panel data
A_all_panel=fread("C:/Users/Administrator/Desktop/lucy/合成/A_all_panel.csv")
A_all_panel=A_all_panel[is_user_or_organization!=2,1:52]
# treat variable
A_all_panel[,table(is_maintainer)]
A_all_panel[,treat:=ifelse(is_maintainer==1,1,0)]
#the shock happened on 2019-05=13
A_all_panel[,table(date)]
A_all_panel[,after:=ifelse(date>"2019-05",1,0)]
#contribution variable
A_all_panel[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
               IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
               PushEvent+PullRequestReviewEvent]
#free-ride variable
A_all_panel[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]


# # basic descriptive
A=stat.desc(A_all_panel,basic=TRUE, desc=TRUE, norm=F, p=0.95)
# basic statistics,descriptive statistics,normal distribution statistics,confidence interval on the mean (CI.mean)=0.95

median1=median(A_all_panel$totalnumber)
median2=median(A_all_panel$PullRequestEvent)
median3=median(A_all_panel$CommitCommentEvent)
median4=median(A_all_panel$GollumEvent)
median5=median(A_all_panel$ForkEvent)
median6=median(A_all_panel$PublicEvent)
median7=median(A_all_panel$CreateEven)
median8=median(A_all_panel$MemberEvent)
median9=median(A_all_panel$IssuesEvent)
median10=median(A_all_panel$ReleaseEvent)
median11=median(A_all_panel$DeleteEvent)
median12=median(A_all_panel$WatchEvent)
median13=median(A_all_panel$IssueCommentEvent)
median14=median(A_all_panel$PullRequestReviewCommentEvent)
median15=median(A_all_panel$PushEvent)
median16=median(A_all_panel$PullRequestReviewEvent)
median17=median(A_all_panel$contribution)
median18=median(A_all_panel$free_ride)
t1=rbind(mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10,mean11,mean12,mean13,mean14,mean15,mean16,mean17,mean18)
t2=rbind(min1,min2,min3,min4,min5,min6,min7,min8,min9,min10,min11,min12,min13,min14,min15,min16,min17,min18)
t3=rbind(min1,min2,min3,min4,min5,min6,min7,min8,min9,min10,min11,min12,min13,min14,min15,min16,min17,min18)
t4=rbind(median1,median2,median3,median4,median5,median6,median7,median8,median9,median10,median11,median12,median13,median14,median15,median16,median17,median18)
t5=rbind(max1,max2,max3,max4,max5,max6,max7,max8,max9,max10,max11,max12,max13,max14,max15,max16,max17,max18)

S=cbind(t1,t2)
S=cbind(S,t3)
S=as.data.table(S)
fwrite(S,"C:/Users/Administrator/Desktop/lucy/合成/S.csv")

# # descriptive statistics by groups
# is_maintainer or not
median1=tapply(A_all_panel$totalnumber,A_all_panel$is_maintainer,median)
median2=tapply(A_all_panel$PullRequestEvent,A_all_panel$is_maintainer,median)
median3=tapply(A_all_panel$CommitCommentEvent,A_all_panel$is_maintainer,median)
median4=tapply(A_all_panel$GollumEvent,A_all_panel$is_maintainer,median)
median5=tapply(A_all_panel$ForkEvent,A_all_panel$is_maintainer,median)
median6=tapply(A_all_panel$PublicEvent,A_all_panel$is_maintainer,median)
median7=tapply(A_all_panel$CreateEvent,A_all_panel$is_maintainer,median)
median8=tapply(A_all_panel$MemberEvent,A_all_panel$is_maintainer,median)
median9=tapply(A_all_panel$IssuesEvent,A_all_panel$is_maintainer,median)
median10=tapply(A_all_panel$ReleaseEvent,A_all_panel$is_maintainer,median)
median11=tapply(A_all_panel$DeleteEvent,A_all_panel$is_maintainer,median)
median12=tapply(A_all_panel$WatchEvent,A_all_panel$is_maintainer,median)
median13=tapply(A_all_panel$IssueCommentEvent,A_all_panel$is_maintainer,median)
median14=tapply(A_all_panel$PullRequestReviewCommentEvent,A_all_panel$is_maintainer,median)
median15=tapply(A_all_panel$PushEvent,A_all_panel$is_maintainer,median)
median16=tapply(A_all_panel$PullRequestReviewEvent,A_all_panel$is_maintainer,median)
median17=tapply(A_all_panel$contribution,A_all_panel$is_maintainer,median)
median18=tapply(A_all_panel$free_ride,A_all_panel$is_maintainer,median)

t1=rbind(mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10,mean11,mean12,mean13,mean14,mean15,mean16,mean17,mean18)
t2=rbind(min1,min2,min3,min4,min5,min6,min7,min8,min9,min10,min11,min12,min13,min14,min15,min16,min17,min18)
t3=rbind(min1,min2,min3,min4,min5,min6,min7,min8,min9,min10,min11,min12,min13,min14,min15,min16,min17,min18)
t4=rbind(median1,median2,median3,median4,median5,median6,median7,median8,median9,median10,median11,median12,median13,median14,median15,median16,median17,median18)
t5=rbind(max1,max2,max3,max4,max5,max6,max7,max8,max9,max10,max11,max12,max13,max14,max15,max16,max17,max18)

summary_long=cbind(t1,t2)
summary_long=cbind(summary_long,t5)
summary_long=as.data.table(summary_long)
fwrite(summary_long,"C:/Users/Administrator/Desktop/lucy/合成/summary_long.csv")
  
# is_sponosr or not 


#histograms
library(car)

#data[sales < 50, hist(sales, breaks = 30)]
par(mfrow=c(3,2))
A_all_panel[totalnumber<50,hist(totalnumber,breaks=30,col="green",main=)]
box()
A_all_panel[0<totalnumber&totalnumber<50,hist(totalnumber,breaks=30,col="green",main="totalnumber(remove 0)")]
box()
A_all_panel[contribution<50,hist(contribution,breaks=30,col="green")]
box()
A_all_panel[0<contribution&contribution<50,hist(contribution,breaks=30,col="green",main="contribution(remove 0)")]
box()
A_all_panel[free_ride<50,hist(free_ride,breaks=30,col="green")]
box()
A_all_panel[0<free_ride&free_ride<50,hist(free_ride,breaks=30,col="green",main="free_ride(remove 0)")]
box()
# # conditional histograms
par(mfrow=c(3,2))
A_all_panel[is_maintainer==0&totalnumber<50,hist(totalnumber,breaks=30,main="totalnumber(is_miantainer=0)",xlab="totalnumber",col="green")]
box()
A_all_panel[is_maintainer==1&totalnumber<50,hist(totalnumber,breaks=30,main="totalnumber(is_miantainer=1)",xlab="totalnumber",col="green")]
box()
A_all_panel[is_maintainer==0&contribution<50,hist(contribution,breaks=30,main="contribution(is_miantainer=0)",xlab="contribution",col="green")]
box()
A_all_panel[is_maintainer==1&contribution<50,hist(contribution,breaks=30,main="contribution(is_miantainer=1)",xlab="contribution",col="green")]
box()
A_all_panel[is_maintainer==0&free_ride<50,hist(free_ride,breaks=30,main="free_ride(is_miantainer=0)",xlab="free_ride",col="green")]
box()
A_all_panel[is_maintainer==1&free_ride<50,hist(free_ride,breaks=30,main="free_ride(is_miantainer=1)",xlab="free_ride",col="green")]
box()


#(2) for wide panel data
A_all=fread("C:/Users/Administrator/Desktop/lucy/合成/A_all.csv")
A_all=A_all[is_user_or_organization!=2,1:435]
A_all[,table(is_maintainer)] #0:7618334  #1:12336
# # basic descriptive
B=stat.desc(A_all,basic=TRUE, desc=TRUE, norm=F, p=0.95)
# basic statistics,descriptive statistics,normal distribution statistics,confidence interval on the mean (CI.mean)=0.95

##1.divide into miantainer or not
mean1=tapply(A_all$totalnumber_202005,A_all$is_maintainer,mean)
mean2=tapply(A_all$PullRequestEvent_202005,A_all$is_maintainer,mean)
mean3=tapply(A_all$CommitCommentEvent_202005,A_all$is_maintainer,mean)
mean4=tapply(A_all$GollumEvent_202005,A_all$is_maintainer,mean)
mean5=tapply(A_all$ForkEvent_202005,A_all$is_maintainer,mean)
mean6=tapply(A_all$PublicEvent_202005,A_all$is_maintainer,mean)
mean7=tapply(A_all$CreateEvent_202005,A_all$is_maintainer,mean)
mean8=tapply(A_all$MemberEvent_202005,A_all$is_maintainer,mean)
mean9=tapply(A_all$IssuesEvent_202005,A_all$is_maintainer,mean)
mean10=tapply(A_all$ReleaseEvent_202005,A_all$is_maintainer,mean)
mean11=tapply(A_all$DeleteEvent_202005,A_all$is_maintainer,mean)
mean12=tapply(A_all$WatchEvent_202005,A_all$is_maintainer,mean)
mean13=tapply(A_all$IssueCommentEvent_202005,A_all$is_maintainer,mean)
mean14=tapply(A_all$PullRequestReviewCommentEvent_202005,A_all$is_maintainer,mean)
mean15=tapply(A_all$PushEvent_202005,A_all$is_maintainer,mean)
mean16=tapply(A_all$PullRequestReviewEvent_202005,A_all$is_maintainer,mean)
t25=rbind(mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10,mean11,mean12,mean13,mean14,mean15,mean16)

#t6=round(t6,digits = 3)

S_miantainer=cbind(t1,t2)
S_miantainer=cbind(S_miantainer,t25)
S_miantainer=as.data.table(S_miantainer)
fwrite(S_miantainer,"C:/Users/Administrator/Desktop/lucy/合成/S_miantainer.csv")

mean1=mean(A_all$totalnumber_202005)
mean2=mean(A_all$PullRequestEvent_202005)
mean3=mean(A_all$CommitCommentEvent_202005)
mean4=mean(A_all$GollumEvent_202005)
mean5=mean(A_all$ForkEvent_202005)
mean6=mean(A_all$PublicEvent_202005)
mean7=mean(A_all$CreateEvent_202005)
mean8=mean(A_all$MemberEvent_202005)
mean9=mean(A_all$IssuesEvent_202005)
mean10=mean(A_all$ReleaseEvent_202005)
mean11=mean(A_all$DeleteEvent_202005)
mean12=mean(A_all$WatchEvent_202005)
mean13=mean(A_all$IssueCommentEvent_202005)
mean14=mean(A_all$PullRequestReviewCommentEvent_202005)
mean15=mean(A_all$PushEvent_202005)
mean16=mean(A_all$PullRequestReviewEvent_202005)
t25=rbind(mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10,mean11,mean12,mean13,mean14,mean15,mean16)

S_all=cbind(t1,t2)
S_all=cbind(S_all,t3)
S_all=as.data.table(S_all,keep.rownames=T)
fwrite(S_all,"C:/Users/Administrator/Desktop/lucy/合成/S_all.csv")

# #2. moderator's mean
#(1)generate moderator
# moderator2:divide maintainer into reveived money/not received before research period(2020-5-31)
A_all[is_maintainer==1,received_not:=ifelse(first_sponsor_time<="2020-05-31",1,0)] #214375 
A_all[is_maintainer==0,received_not:= 0]
length(A_all[is_maintainer==1,]$user_id) #297000
A_all[,table(received_not)]

mean1=mean(A_all[received_not==1,]$totalnumber_202005)
mean2=mean(A_all[received_not==1,]$PullRequestEvent_202005)
mean3=mean(A_all[received_not==1,]$CommitCommentEvent_202005)
mean4=mean(A_all[received_not==1,]$GollumEvent_202005)
mean5=mean(A_all[received_not==1,]$ForkEvent_202005)
mean6=mean(A_all[received_not==1,]$PublicEvent_202005)
mean7=mean(A_all[received_not==1,]$CreateEvent_202005)
mean8=mean(A_all[received_not==1,]$MemberEvent_202005)
mean9=mean(A_all[received_not==1,]$IssuesEvent_202005)
mean10=mean(A_all[received_not==1,]$ReleaseEvent_202005)
mean11=mean(A_all[received_not==1,]$DeleteEvent_202005)
mean12=mean(A_all[received_not==1,]$WatchEvent_202005)
mean13=mean(A_all[received_not==1,]$IssueCommentEvent_202005)
mean14=mean(A_all[received_not==1,]$PullRequestReviewCommentEvent_202005)
mean15=mean(A_all[received_not==1,]$PushEvent_202005)
mean16=mean(A_all[received_not==1,]$PullRequestReviewEvent_202005)

t1=rbind(mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10,mean11,mean12,mean13,mean14,mean15,mean16)

M_all=cbind(t1,t2)
M_all=cbind(S_all,t25)
M_all=as.data.table(S_all,keep.rownames=T)
fwrite(S_all,"C:/Users/Administrator/Desktop/lucy/合成/S_all.csv")

# # time series plots
M_all=fread("C:/Users/Administrator/Desktop/lucy/合成/M_all.csv")  #group means

M_all[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
               IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
               PushEvent+PullRequestReviewEvent]
#free-ride variable
M_all[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]

fwrite(M_all,"C:/Users/Administrator/Desktop/lucy/合成/M_all.csv")
mean=fread("C:/Users/Administrator/Desktop/lucy/合成/M_all.csv")

ggplot(M_all[received_not==1&is_maintainer==1,])  + 
  geom_line(aes(x = id, y = totalnumber),color = "blue", size = 1) +
  geom_line(aes(x = id, y = contribution),color = "red", size = 1) +
  geom_line(aes(x = id, y = free_ride),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(is_maintainer==1)")+
  labs(title = "received_not=1")
ggplot(M_all[received_not==0&is_maintainer==0,])  + 
  geom_line(aes(x = id, y = totalnumber),color = "blue", size = 1) +
  geom_line(aes(x = id, y = contribution),color = "red", size = 1) +
  geom_line(aes(x = id, y = free_ride),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(is_maintainer==0)")+
  labs(title = "received_not=0")
ggplot(M_all[received_not==0&is_maintainer==1,])  + 
  geom_line(aes(x = id, y = totalnumber),color = "blue", size = 1) +
  geom_line(aes(x = id, y = contribution),color = "red", size = 1) +
  geom_line(aes(x = id, y = free_ride),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(is_maintainer=1)")+
  labs(title = "received_not=0")
ggplot(M_all[received_not==0&is_maintainer==2,])  + 
  geom_line(aes(x = id, y = totalnumber),color = "blue", size = 1) +
  geom_line(aes(x = id, y = contribution),color = "red", size = 1) +
  geom_line(aes(x = id, y = free_ride),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(All)")+
  labs(title = "received_not=0")


mean_1=fread("C:/Users/Administrator/Desktop/lucy/合成/figure(received_not).csv")
par(mfrow=c(1,3))
ggplot(mean_1)  + 
  geom_line(aes(x = id, y = totalnumber10),color = "blue", size =1) +
  geom_line(aes(x = id, y = totalnumber11),color = "red", size = 1) +
  geom_line(aes(x = id, y = totalnumber12),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(totalnumber)")+
  labs(title = "received_not=1")
ggplot(mean_1)  + 
  geom_line(aes(x = id, y = contribution10),color = "blue", size = 1) +
  geom_line(aes(x = id, y = contribution11),color = "red", size = 1) +
  geom_line(aes(x = id, y = contribution12),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(contribution))")+
  labs(title = "received_not=1")
ggplot(mean_1)  + 
  geom_line(aes(x = id, y = free_ride10),color = "blue", size = 1) +
  geom_line(aes(x = id, y = free_ride11),color = "red", size = 1) +
  geom_line(aes(x = id, y = free_ride12),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(free_ride)")+
  labs(title = "received_not=1")

ggplot(mean_1)  + 
  geom_line(aes(x = id, y = totalnumber00),color = "blue", size =1) +
  geom_line(aes(x = id, y = totalnumber01),color = "red", size = 1) +
  geom_line(aes(x = id, y = totalnumber02),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(totalnumber)")+
  labs(title = "received_not=0")
ggplot(mean_1)  + 
  geom_line(aes(x = id, y = contribution00),color = "blue", size = 1) +
  geom_line(aes(x = id, y = contribution01),color = "red", size = 1) +
  geom_line(aes(x = id, y = contribution02),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(contribution)")+
  labs(title = "received_not=0")
ggplot(mean_1)  + 
  geom_line(aes(x = id, y = free_ride00),color = "blue", size = 1) +
  geom_line(aes(x = id, y = free_ride01),color = "red", size = 1) +
  geom_line(aes(x = id, y = free_ride02),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(free_ride)")+
  labs(title = "received_not=0")

a=M_all[]
ggplot(M_all[received_not==0,],mapping = aes(x=id,y = totalnumber,colour=is_maintainer,group=is_maintainer))  + 
  geom_line()+
  scale_color_manual("",c("blue","red","green"))
  geom_line(aes(x = id, y = totalnumber),color = "blue", size = 1) +
  geom_line(aes(x = id, y = contribution),color = "red", size = 1) +
  geom_line(aes(x = id, y = free_ride),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(is_maintainer==1)")+
  labs(title = "received_not=1")
  
  
A_all[,T:=is_sponsor+is_maintainer]
A_all[,table(T)]
A_all[,group:=T+is_sponsor]
A_all[,table(group)]  #3:both,2:sponsor,1:miantainer,0:none

A_all_group=A_all[group!=3,]
A_all_group[,table(group)] #2:sponsor,1:miantainer,0:none


temp1=tapply(A_all_group$totalnumber_201805,A_all_group$group,mean)
for (col in colnames(A_all_group[,3:17])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp1=rbind(temp1,temp)
}
temp2=tapply(A_all_group$totalnumber_201806,A_all_group$group,mean)
for (col in colnames(A_all_group[,19:33])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp2=rbind(temp2,temp)
}
temp3=tapply(A_all_group$totalnumber_201807,A_all_group$group,mean)
for (col in colnames(A_all_group[,35:49])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp3=rbind(temp3,temp)
}
temp4=tapply(A_all_group$totalnumber_201808,A_all_group$group,mean)
for (col in colnames(A_all_group[,51:65])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp4=rbind(temp4,temp)
}
temp5=tapply(A_all_group$totalnumber_201809,A_all_group$group,mean)
for (col in colnames(A_all_group[,67:81])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp5=rbind(temp5,temp)
}
temp6=tapply(A_all_group$totalnumber_201810,A_all_group$group,mean)
for (col in colnames(A_all_group[,83:97])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp6=rbind(temp6,temp)
}
temp7=tapply(A_all_group$totalnumber_201811,A_all_group$group,mean)
for (col in colnames(A_all_group[,99:113])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp7=rbind(temp7,temp)
}
temp8=tapply(A_all_group$totalnumber_201812,A_all_group$group,mean)
for (col in colnames(A_all_group[,115:129])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp8=rbind(temp8,temp)
}
temp9=tapply(A_all_group$totalnumber_201901,A_all_group$group,mean)
for (col in colnames(A_all_group[,131:145])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp9=rbind(temp9,temp)
}
temp10=tapply(A_all_group$totalnumber_201902,A_all_group$group,mean)
for (col in colnames(A_all_group[,147:161])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp10=rbind(temp10,temp)
}
temp11=tapply(A_all_group$totalnumber_201903,A_all_group$group,mean)
for (col in colnames(A_all_group[,163:177])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp11=rbind(temp11,temp)
}
temp12=tapply(A_all_group$totalnumber_201904,A_all_group$group,mean)
for (col in colnames(A_all_group[,179:193])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp12=rbind(temp12,temp)
}
temp13=tapply(A_all_group$totalnumber_201905,A_all_group$group,mean)
for (col in colnames(A_all_group[,195:209])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp13=rbind(temp13,temp)
}
temp14=tapply(A_all_group$totalnumber_201906,A_all_group$group,mean)
for (col in colnames(A_all_group[,211:225])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp14=rbind(temp14,temp)
}
temp15=tapply(A_all_group$totalnumber_201907,A_all_group$group,mean)
for (col in colnames(A_all_group[,227:241])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp15=rbind(temp15,temp)
}
temp16=tapply(A_all_group$totalnumber_201908,A_all_group$group,mean)
for (col in colnames(A_all_group[,243:257])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp16=rbind(temp16,temp)
}
temp17=tapply(A_all_group$totalnumber_201909,A_all_group$group,mean)
for (col in colnames(A_all_group[,259:273])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp17=rbind(temp17,temp)
}
temp18=tapply(A_all_group$totalnumber_201910,A_all_group$group,mean)
for (col in colnames(A_all_group[,275:289])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp18=rbind(temp18,temp)
}
temp19=tapply(A_all_group$totalnumber_201911,A_all_group$group,mean)
for (col in colnames(A_all_group[,291:305])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp19=rbind(temp19,temp)
}
temp20=tapply(A_all_group$totalnumber_201912,A_all_group$group,mean)
for (col in colnames(A_all_group[,307:321])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp20=rbind(temp20,temp)
}
temp21=tapply(A_all_group$totalnumber_202001,A_all_group$group,mean)
for (col in colnames(A_all_group[,323:337])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp21=rbind(temp21,temp)
}
temp22=tapply(A_all_group$totalnumber_202002,A_all_group$group,mean)
for (col in colnames(A_all_group[,339:353])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp22=rbind(temp22,temp)
}
temp23=tapply(A_all_group$totalnumber_202003,A_all_group$group,mean)
for (col in colnames(A_all_group[,355:369])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp23=rbind(temp23,temp)
}
temp24=tapply(A_all_group$totalnumber_202004,A_all_group$group,mean)
for (col in colnames(A_all_group[,371:385])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp24=rbind(temp24,temp)
}
temp25=tapply(A_all_group$totalnumber_202005,A_all_group$group,mean)
for (col in colnames(A_all_group[,387:401])) {
  temp=tapply(A_all_group[[col]],A_all_group$group,mean)
  temp25=rbind(temp25,temp)
}

group_0=cbind(temp1[,1],temp2[,1],temp3[,1],temp4[,1],temp5[,1],temp6[,1],temp7[,1],temp8[,1],temp9[,1],
      temp10[,1],temp11[,1],temp12[,1],temp13[,1],temp14[,1],temp15[,1],temp16[,1],temp17[,1],temp18[,1],
      temp19[,1],temp20[,1],temp21[,1],temp22[,1],temp23[,1],temp24[,1],temp25[,1])
group_1=cbind(temp1[,2],temp2[,2],temp3[,2],temp4[,2],temp5[,2],temp6[,2],temp7[,2],temp8[,2],temp9[,2],
              temp10[,2],temp11[,2],temp12[,2],temp13[,2],temp14[,2],temp15[,2],temp16[,2],temp17[,2],temp18[,2],
              temp19[,2],temp20[,2],temp21[,2],temp22[,2],temp23[,2],temp24[,2],temp25[,2])
group_2=cbind(temp1[,3],temp2[,3],temp3[,3],temp4[,3],temp5[,3],temp6[,3],temp7[,3],temp8[,3],temp9[,3],
              temp10[,3],temp11[,3],temp12[,3],temp13[,3],temp14[,3],temp15[,3],temp16[,3],temp17[,3],temp18[,3],
              temp19[,3],temp20[,3],temp21[,3],temp22[,3],temp23[,3],temp24[,3],temp25[,3])

group_0=t(group_0)
group_1=t(group_1)
group_2=t(group_2)
group_0=as.data.table(group_0)
group_1=as.data.table(group_1)
group_2=as.data.table(group_2)
fwrite(group_0,"C:/Users/Administrator/Desktop/lucy/合成/group_0.csv")
fwrite(group_1,"C:/Users/Administrator/Desktop/lucy/合成/group_1.csv")
fwrite(group_2,"C:/Users/Administrator/Desktop/lucy/合成/group_2.csv")

# # #moderator
A_all_group[is_maintainer==1,received_not:=ifelse(first_sponsor_time<="2020-05-31",1,0)] 
A_all_group[is_maintainer==0,received_not:= 0]

A_all_isuser1= A_all[is_user_or_organization==1,]
A_all_isuser1= A_all[is_user_or_organization==0,]

temp1=tapply(A_all_isuser1$totalnumber_201805,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,3:17])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp1=rbind(temp1,temp)
}
temp2=tapply(A_all_isuser1$totalnumber_201806,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,19:33])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp2=rbind(temp2,temp)
}
temp3=tapply(A_all_isuser1$totalnumber_201807,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,35:49])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp3=rbind(temp3,temp)
}
temp4=tapply(A_all_isuser1$totalnumber_201808,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,51:65])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp4=rbind(temp4,temp)
}
temp5=tapply(A_all_isuser1$totalnumber_201809,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,67:81])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp5=rbind(temp5,temp)
}
temp6=tapply(A_all_isuser1$totalnumber_201810,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,83:97])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp6=rbind(temp6,temp)
}
temp7=tapply(A_all_isuser1$totalnumber_201811,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,99:113])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp7=rbind(temp7,temp)
}
temp8=tapply(A_all_isuser1$totalnumber_201812,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,115:129])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp8=rbind(temp8,temp)
}
temp9=tapply(A_all_isuser1$totalnumber_201901,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,131:145])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp9=rbind(temp9,temp)
}
temp10=tapply(A_all_isuser1$totalnumber_201902,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,147:161])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp10=rbind(temp10,temp)
}
temp11=tapply(A_all_isuser1$totalnumber_201903,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,163:177])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp11=rbind(temp11,temp)
}
temp12=tapply(A_all_isuser1$totalnumber_201904,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,179:193])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp12=rbind(temp12,temp)
}
temp13=tapply(A_all_isuser1$totalnumber_201905,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,195:209])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp13=rbind(temp13,temp)
}
temp14=tapply(A_all_isuser1$totalnumber_201906,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,211:225])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp14=rbind(temp14,temp)
}
temp15=tapply(A_all_isuser1$totalnumber_201907,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,227:241])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp15=rbind(temp15,temp)
}
temp16=tapply(A_all_isuser1$totalnumber_201908,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,243:257])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp16=rbind(temp16,temp)
}
temp17=tapply(A_all_isuser1$totalnumber_201909,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,259:273])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp17=rbind(temp17,temp)
}
temp18=tapply(A_all_isuser1$totalnumber_201910,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,275:289])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp18=rbind(temp18,temp)
}
temp19=tapply(A_all_isuser1$totalnumber_201911,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,291:305])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp19=rbind(temp19,temp)
}
temp20=tapply(A_all_isuser1$totalnumber_201912,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,307:321])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp20=rbind(temp20,temp)
}
temp21=tapply(A_all_isuser1$totalnumber_202001,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,323:337])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp21=rbind(temp21,temp)
}
temp22=tapply(A_all_isuser1$totalnumber_202002,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,339:353])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp22=rbind(temp22,temp)
}
temp23=tapply(A_all_isuser1$totalnumber_202003,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,355:369])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp23=rbind(temp23,temp)
}
temp24=tapply(A_all_isuser1$totalnumber_202004,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,371:385])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp24=rbind(temp24,temp)
}
temp25=tapply(A_all_isuser1$totalnumber_202005,A_all_isuser1$is_maintainer,mean)
for (col in colnames(A_all_isuser1[,387:401])) {
  temp=tapply(A_all_isuser1[[col]],A_all_isuser1$is_maintainer,mean)
  temp25=rbind(temp25,temp)
}

is_maintainer_0=cbind(temp1[,1],temp2[,1],temp3[,1],temp4[,1],temp5[,1],temp6[,1],temp7[,1],temp8[,1],temp9[,1],
              temp10[,1],temp11[,1],temp12[,1],temp13[,1],temp14[,1],temp15[,1],temp16[,1],temp17[,1],temp18[,1],
              temp19[,1],temp20[,1],temp21[,1],temp22[,1],temp23[,1],temp24[,1],temp25[,1])
is_maintainer_1=cbind(temp1[,2],temp2[,2],temp3[,2],temp4[,2],temp5[,2],temp6[,2],temp7[,2],temp8[,2],temp9[,2],
              temp10[,2],temp11[,2],temp12[,2],temp13[,2],temp14[,2],temp15[,2],temp16[,2],temp17[,2],temp18[,2],
              temp19[,2],temp20[,2],temp21[,2],temp22[,2],temp23[,2],temp24[,2],temp25[,2])
is_maintainer_2=cbind(temp1[,3],temp2[,3],temp3[,3],temp4[,3],temp5[,3],temp6[,3],temp7[,3],temp8[,3],temp9[,3],
              temp10[,3],temp11[,3],temp12[,3],temp13[,3],temp14[,3],temp15[,3],temp16[,3],temp17[,3],temp18[,3],
              temp19[,3],temp20[,3],temp21[,3],temp22[,3],temp23[,3],temp24[,3],temp25[,3])

is_maintainer_0=t(is_maintainer_0)
is_maintainer_1=t(is_maintainer_1)
is_maintainer_2=t(is_maintainer_2)
is_maintainer_0=as.data.table(is_maintainer_0)
is_maintainer_1=as.data.table(is_maintainer_1)
is_maintainer_2=as.data.table(is_maintainer_2)
fwrite(is_maintainer_0,"C:/Users/Administrator/Desktop/lucy/合成/is_maintainer_0.csv")
fwrite(is_maintainer_1,"C:/Users/Administrator/Desktop/lucy/合成/is_maintainer_1.csv")
fwrite(is_maintainer_2,"C:/Users/Administrator/Desktop/lucy/合成/is_maintainer_2.csv")


#### for three group
group3_receive_all=fread("C:/Users/Administrator/Desktop/lucy/mean/group3_receive_all.csv")
group3_isuser_all=fread("C:/Users/Administrator/Desktop/lucy/mean/group3_isuser_all.csv")

colnames(group3_receive_all)
group3_receive_all[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
               IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
               PushEvent+PullRequestReviewEvent]
#free-ride variable
group3_receive_all[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]

##ggplot tiem seriers
group3_receive_all$received[is.na(group3_receive_all$received)]=2
group3_receive_all[,Type:=ifelse(group==0,"non-participate",ifelse(group==1,"Maintainer","Sponsor"))]
group3_receive_all[,receive_money:=ifelse(received==0,"didn't receive money",ifelse(received==1,"received monney","All"))]

group3_receive_all[is.na(group3_receive_all$totalnumber)]=0
group3_receive_all[is.na(group3_receive_all$contribution)]=0
group3_receive_all[is.na(group3_receive_all$free_ride)]=0


group3_receive_all$date[group3_receive_all$id==1]="2018-05"
group3_receive_all$date[group3_receive_all$id==2]="2018-06"
group3_receive_all$date[group3_receive_all$id==3]="2018-07"
group3_receive_all$date[group3_receive_all$id==4]="2018-08"
group3_receive_all$date[group3_receive_all$id==5]="2018-09"
group3_receive_all$date[group3_receive_all$id==6]="2018-10"
group3_receive_all$date[group3_receive_all$id==7]="2018-11"
group3_receive_all$date[group3_receive_all$id==8]="2018-12"
group3_receive_all$date[group3_receive_all$id==9]="2019-01"
group3_receive_all$date[group3_receive_all$id==10]="2019-02"
group3_receive_all$date[group3_receive_all$id==11]="2019-03"
group3_receive_all$date[group3_receive_all$id==12]="2019-04"
group3_receive_all$date[group3_receive_all$id==13]="2019-05"
group3_receive_all$date[group3_receive_all$id==14]="2019-06"
group3_receive_all$date[group3_receive_all$id==15]="2019-07"
group3_receive_all$date[group3_receive_all$id==16]="2019-08"
group3_receive_all$date[group3_receive_all$id==17]="2019-09"
group3_receive_all$date[group3_receive_all$id==18]="2019-10"
group3_receive_all$date[group3_receive_all$id==19]="2019-11"
group3_receive_all$date[group3_receive_all$id==20]="2019-12"
group3_receive_all$date[group3_receive_all$id==21]="2020-01"
group3_receive_all$date[group3_receive_all$id==22]="2020-02"
group3_receive_all$date[group3_receive_all$id==23]="2020-03"
group3_receive_all$date[group3_receive_all$id==24]="2020-04"
group3_receive_all$date[group3_receive_all$id==25]="2020-05"


#group3_receive_all[,date:=as.Date(paste(year,month,"01",sep ="-"),"%Y-%m-%d")]
#as.yearmon(group3_receive_all$date)
#group3_receive_all$date=as.Date(group3_receive_all$date,"%m/%d%y")
# group3_receive_all$Type=factor(group3_receive_all$Type)

#1:75(All);76:150(0);151:225(1)
p1=ggplot(group3_receive_all[1:75],aes(x=id,y=free_ride))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dashed","dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly free_ride")+facet_wrap(~receive_money)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
p2=ggplot(group3_receive_all[76:150],aes(x=id,y=contribution))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dashed","dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly contribution")+facet_wrap(~receive_money)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
p3=ggplot(group3_receive_all[151:225],aes(x=id,y=contribution))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dashed","dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly contribution")+facet_wrap(~receive_money)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
library(gridExtra)
#安装ggpubr时，会依赖于该包
grid.arrange(p1,p2,p3,ncol=3,nrow=1) 


######for two group
group2_receive_all=fread("C:/Users/Administrator/Desktop/lucy/mean/group2_receive_all.csv")
group2_isuser_all=fread("C:/Users/Administrator/Desktop/lucy/mean/group2_isuser_all.csv")

colnames(group2_receive_all)
group2_receive_all[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
                    IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
                    PushEvent+PullRequestReviewEvent]
#free-ride variable
group2_receive_all[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]

##ggplot tiem seriers
group2_receive_all$isuser[is.na(group2_receive_all$isuser)]=2
group2_receive_all[,Type:=ifelse(is_maintainer==0,"non-participate","Maintainer")]
group2_receive_all[,receive_money:=ifelse(isuser==0,"organization",ifelse(isuser==1,"user","All"))]

group2_receive_all[is.na(group2_receive_all$totalnumber)]=0
group2_receive_all[is.na(group2_receive_all$contribution)]=0
group2_receive_all[is.na(group2_receive_all$free_ride)]=0


group2_receive_all$date[group2_receive_all$id==1]="2018-05"
group2_receive_all$date[group2_receive_all$id==2]="2018-06"
group2_receive_all$date[group2_receive_all$id==3]="2018-07"
group2_receive_all$date[group2_receive_all$id==4]="2018-08"
group2_receive_all$date[group2_receive_all$id==5]="2018-09"
group2_receive_all$date[group2_receive_all$id==6]="2018-10"
group2_receive_all$date[group2_receive_all$id==7]="2018-11"
group2_receive_all$date[group2_receive_all$id==8]="2018-12"
group2_receive_all$date[group2_receive_all$id==9]="2019-01"
group2_receive_all$date[group2_receive_all$id==10]="2019-02"
group2_receive_all$date[group2_receive_all$id==11]="2019-03"
group2_receive_all$date[group2_receive_all$id==12]="2019-04"
group2_receive_all$date[group2_receive_all$id==13]="2019-05"
group2_receive_all$date[group2_receive_all$id==14]="2019-06"
group2_receive_all$date[group2_receive_all$id==15]="2019-07"
group2_receive_all$date[group2_receive_all$id==16]="2019-08"
group2_receive_all$date[group2_receive_all$id==17]="2019-09"
group2_receive_all$date[group2_receive_all$id==18]="2019-10"
group2_receive_all$date[group2_receive_all$id==19]="2019-11"
group2_receive_all$date[group2_receive_all$id==20]="2019-12"
group2_receive_all$date[group2_receive_all$id==21]="2020-01"
group2_receive_all$date[group2_receive_all$id==22]="2020-02"
group2_receive_all$date[group2_receive_all$id==23]="2020-03"
group2_receive_all$date[group2_receive_all$id==24]="2020-04"
group2_receive_all$date[group2_receive_all$id==25]="2020-05"


#group2_receive_all[,date:=as.Date(paste(year,month,"01",sep ="-"),"%Y-%m-%d")]
#as.yearmon(group2_receive_all$date)
#group2_receive_all$date=as.Date(group2_receive_all$date,"%m/%d%y")
# group2_receive_all$Type=factor(group2_receive_all$Type)

#1:50(All);51:100(0);101:150(1)
p1=ggplot(group2_receive_all[1:50],aes(x=id,y=contribution))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly contribution")+facet_wrap(~receive_money)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
p2=ggplot(group2_receive_all[51:100],aes(x=id,y=free_ride))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly free_ride")+facet_wrap(~receive_money)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
p3=ggplot(group2_receive_all[101:150],aes(x=id,y=free_ride))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly free_ride")+facet_wrap(~receive_money)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
library(gridExtra)
#安装ggpubr时，会依赖于该包
grid.arrange(p1,p2,p3,ncol=3,nrow=1) 


