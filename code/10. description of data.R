# # description of data
library(data.table) ### clean data
library(zoo) ### generate date variable
library(ggplot2) ### parallel trend figure
library(stargazer) ## output regression results to Word
library(pastecs)  # # descriptive analysis

#1.for users
# (1)for long panel data
A_user_panel=fread("C:/Users/Administrator/Desktop/lucy/合成/A_user_panel.csv")
# treat variable
A_user_panel[,treat:=ifelse(is_maintainer==1,1,0)]
#the shock happened on 2019-05=13
A_user_panel[,table(date)]
A_user_panel[,after:=ifelse(date>"2019-05",1,0)]
#contribution variable
A_user_panel[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
         IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
         PushEvent+PullRequestReviewEvent]
#free-ride variable
A_user_panel[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]

# # description
# summary
a= colnames(A_user_panel)
a= as.data.table(a)
names(a)=c("Variable")
fwrite(a,"C:/Users/Administrator/Desktop/lucy/合成/a.csv")

A= summary(A_user_panel)
A= as.data.table(A)
A[,V1:=NULL]
names(A)=c("Variable","data")
B=A[1:336,]
c=data.table(Variable=character(),min=character(),Qu_1st=character(),Median=character(),Mean=character(),Qu_3rd=character(),Max=character())
for (i in c(0:55)) {
  col_temp=B[i*6+1,Variable]
  min_temp=B[i*6+1,data]
  Qu_1st_temp=B[i*6+2,data]
  Median_temp=B[i*6+3,data]
  Mean_temp=B[i*6+4,data]
  Qu_3rd_temp=B[i*6+5,data]
  Max_temp=B[i*6+6,data]
  temp = c[,list(Variable=col_temp,min = min_temp,Qu_1st=Qu_1st_temp,Median=Median_temp,
                 Mean=Mean_temp,Qu_3rd=Qu_3rd_temp,Max=Max_temp)]
  i=i+1
  c=rbind(temp,c)
}

fwrite(c,"C:/Users/Administrator/Desktop/lucy/合成/c.csv")

str(A_user_panel)

head(A_user_panel,n=10)

tail(A_user_panel,n=10)

# # basic descriptive
stat.desc(A_user_panel,basic=TRUE, desc=TRUE, norm=F, p=0.95)
# basic statistics,descriptive statistics,normal distribution statistics,confidence interval on the mean (CI.mean)=0.95

colnames(A_user_panel)
mean=mean(A_user_panel)
median(A_user_panel)
var(A_user_panel) # Variance
sd(A_user_panel)  # standard deviation
max(A_user_panel)
min(A_user_panel)
range(A_user_panel)
quantile(A_user_panel) #quantile 25%
length(A_user_panel)
table(A_user_panel) #frequence

# # descriptive statistics by groups
# is_maintainer or not
mean=tapply(A_user_panel,A_user_panel$is_maintainer,mean)
sd=tapply(A_user_panel,A_user_panel$is_maintainer,sd)
median=tapply(A_user_panel,A_user_panel$is_maintainer,median)
max=tapply(A_user_panel,A_user_panel$is_maintainer,max)
min=tapply(A_user_panel,A_user_panel$is_maintainer,min)
cbind(mean,sd,min,median,max)
t1=round(cbind(mean,sd,min,median,max))
t1
# is_sponosr or not 


#histograms
library(car)
head(A_user_panel)
colnames(A_user_panel)

#data[sales < 50, hist(sales, breaks = 30)]
par(mfrow=c(1,3))
summary(A_user_panel$totalnumber)
A_user_panel[totalnumber<50,hist(totalnumber,breaks=30,col="green")]
box()
summary(A_user_panel$contribution)
A_user_panel[contribution<50,hist(contribution,breaks=30,col="green")]
box()
A_user_panel[0<contribution&contribution<50,hist(contribution,breaks=30,col="green")]
box()

# # conditional histograms
par(mfrow=c(1,2))
hist(A_user_panel$totalnumber[A_user_panel$is])
A_user_panel[is_miantainer==0,hist(totalnumber,breaks="FD",main="is_miantainer=0",xlab="totalnumber",col="green")]
A_user_panel[is_miantainer==1,hist(totalnumber,breaks="FD",main="is_miantainer=1",xlab="totalnumber",col="green")]

# histograms overlaid
hist(A_user_panel$totalnumber,breaks="FD",col="green")
hist(A_user_panel$totalnumber[A_user_panel$is_miantainer==0],breaks="FD",col="gray",add=TRUE)
legend("topright",c("is_miantainer=1","is_miantianer=0"),fill=c("green","gray"))

# # scatterplots
library(car)
row.names(A_user_panel)=colnames(A_user_panel)
identify(A_user_panel$x,A_user_panel$y,row.names(A_user_panel))
scatterplot(x~y,id.method="identify",span=0.6,data=A_user_panel)
# by groups
scatterplot(date~totalnumber|is_miantainer,data=A_user_panel)



#(2) for wide panel data
A_user=fread("C:/Users/Administrator/Desktop/lucy/合成/A_user.csv")

# # basic descriptive
B=stat.desc(A_user,basic=TRUE, desc=TRUE, norm=F, p=0.95)
# basic statistics,descriptive statistics,normal distribution statistics,confidence interval on the mean (CI.mean)=0.95


mean1=tapply(A_user$totalnumber_202005,A_user$is_maintainer,mean)
mean2=tapply(A_user$PullRequestEvent_202005,A_user$is_maintainer,mean)
mean3=tapply(A_user$CommitCommentEvent_202005,A_user$is_maintainer,mean)
mean4=tapply(A_user$GollumEvent_202005,A_user$is_maintainer,mean)
mean5=tapply(A_user$ForkEvent_202005,A_user$is_maintainer,mean)
mean6=tapply(A_user$PublicEvent_202005,A_user$is_maintainer,mean)
mean7=tapply(A_user$CreateEvent_202005,A_user$is_maintainer,mean)
mean8=tapply(A_user$MemberEvent_202005,A_user$is_maintainer,mean)
mean9=tapply(A_user$IssuesEvent_202005,A_user$is_maintainer,mean)
mean10=tapply(A_user$ReleaseEvent_202005,A_user$is_maintainer,mean)
mean11=tapply(A_user$DeleteEvent_202005,A_user$is_maintainer,mean)
mean12=tapply(A_user$WatchEvent_202005,A_user$is_maintainer,mean)
mean13=tapply(A_user$IssueCommentEvent_202005,A_user$is_maintainer,mean)
mean14=tapply(A_user$PullRequestReviewCommentEvent_202005,A_user$is_maintainer,mean)
mean15=tapply(A_user$PushEvent_202005,A_user$is_maintainer,mean)
mean16=tapply(A_user$PullRequestReviewEvent_202005,A_user$is_maintainer,mean)
t25=rbind(mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10,mean11,mean12,mean13,mean14,mean15,mean16)

#t6=round(t6,digits = 3)

E=cbind(t1,t2)
E=cbind(E,t25)
E=as.data.table(E)
fwrite(E,"C:/Users/Administrator/Desktop/lucy/合成/E.csv")

mean1=mean(A_user$totalnumber_202005)
mean2=mean(A_user$PullRequestEvent_202005)
mean3=mean(A_user$CommitCommentEvent_202005)
mean4=mean(A_user$GollumEvent_202005)
mean5=mean(A_user$ForkEvent_202005)
mean6=mean(A_user$PublicEvent_202005)
mean7=mean(A_user$CreateEvent_202005)
mean8=mean(A_user$MemberEvent_202005)
mean9=mean(A_user$IssuesEvent_202005)
mean10=mean(A_user$ReleaseEvent_202005)
mean11=mean(A_user$DeleteEvent_202005)
mean12=mean(A_user$WatchEvent_202005)
mean13=mean(A_user$IssueCommentEvent_202005)
mean14=mean(A_user$PullRequestReviewCommentEvent_202005)
mean15=mean(A_user$PushEvent_202005)
mean16=mean(A_user$PullRequestReviewEvent_202005)
t25=rbind(mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10,mean11,mean12,mean13,mean14,mean15,mean16)

t6=round(t6,digits = 3)

D=cbind(t1,t2)
D=cbind(D,t25)

T=rbind(t1,t2,t3,t4,t5)
T=round(T,digits = 3)
T=as.data.table(T,keep.rownames=T)
fwrite(T,"C:/Users/Administrator/Desktop/lucy/合成/T.csv")

# # time series plots
D=fread("C:/Users/Administrator/Desktop/lucy/合成/D.csv")  # all means
E=fread("C:/Users/Administrator/Desktop/lucy/合成/E.csv")  #group means

E[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
               IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
               PushEvent+PullRequestReviewEvent]
#free-ride variable
E[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]

date=unique(A_user_panel[,list(date)])
base_date=unique(A_user_panel$date)[13]
ggplot(D)  + 
  geom_point(aes(x = date, y = totalnumber),color = "blue", size = 2) +
  geom_point(aes(x = date, y = ForkEvent),color = "red", size = 2)+
  geom_vline(date ="2019-05",linetype = "dashed") +
  xlab("") +
  ylab("mean")

ggplot(D)  + 
  geom_line(aes(x = id, y = totalnumber),color = "blue", size = 1) +
  geom_line(aes(x = id, y = ForkEvent),color = "red", size = 1)+
  geom_vline(x =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean")

par(mfrow=c(1,3))
ggplot(E[is_maintainer==0,])  + 
  geom_line(aes(x = id, y = totalnumber),color = "blue", size = 1) +
  geom_line(aes(x = id, y = contribution),color = "red", size = 1) +
  geom_line(aes(x = id, y = free_ride),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(is_maintainer=0)")
ggplot(E[is_maintainer==1,])  + 
  geom_line(aes(x = id, y = totalnumber),color = "blue", size = 1) +
  geom_line(aes(x = id, y = contribution),color = "red", size = 1) +
  geom_line(aes(x = id, y = free_ride),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  scale_colour_manual(c("totalnumber","contribution","free_ride"),c("blue","red","green"))+
  xlab("date") +
  ylab("mean(is_maintainer=1)")
ggplot(E[is_maintainer==2,])  + 
  geom_line(aes(x = id, y = totalnumber),color = "blue", size = 1) +
  geom_line(aes(x = id, y = contribution),color = "red", size = 1) +
  geom_line(aes(x = id, y = free_ride),color = "green", size = 1)+
  geom_vline(xintercept =13,linetype = "dashed") +
  xlab("date") +
  ylab("mean(All)")

mean=mean(A_user)
median(A_user)
var(A_user) # Variance
sd(A_user)  # standard deviation
max(A_user)
min(A_user)
range(A_user)
quantile(A_user) #quantile 25%
length(A_user)
table(A_user) #frequence

# # descriptive statistics by groups
mean=tapply(A_user,A_user$is_maintainer,mean)
sd=tapply(A_user,A_user$is_maintainer,sd)
median=tapply(A_user,A_user$is_maintainer,median)
max=tapply(A_user,A_user$is_maintainer,max)
min=tapply(A_user,A_user$is_maintainer,min)
cbind(mean,sd,min,median,max)
t1=round(cbind(mean,sd,min,median,max))
t1

#histograms
library(car)
head(A_user)
#data[sales < 50, hist(sales, breaks = 30)]
A_user[,hist(totalnumber,breaks="FD",col="green")]
box()

# # conditional histograms
par(mfrow=c(1,2))
hist(A_user$totalnumber[A_user$is])
A_user[is_miantainer==0,hist(totalnumber,breaks="FD",main="is_miantainer=0",xlab="totalnumber",col="green")]
A_user[is_miantainer==1,hist(totalnumber,breaks="FD",main="is_miantainer=1",xlab="totalnumber",col="green")]

# histograms overlaid
hist(A_user$totalnumber,breaks="FD",col="green")
hist(A_user$totalnumber[A_user$is_miantainer==0],breaks="FD",col="gray",add=TRUE)
legend("topright",c("is_miantainer=1","is_miantianer=0"),fill=c("green","gray"))

# # scatterplots
library(car)
row.names(A_user)=colnames(A_user)
identify(A_user$x,A_user$y,row.names(A_user))
scatterplot(x~y,id.method="identify",span=0.6,data=A_user)
# by groups
scatterplot(date~totalnumber|is_miantainer,data=A_user)


#2. for organization
# 2.1 for long panel
A_user=fread("C:/Users/Administrator/Desktop/lucy/合成/A_user.csv")
colnames(A_user)
A_login=A_user[,"login"]
A_user_control=A_user[,402:435]
A_user_control=cbind(A_login,A_user_control)
A_user_DV=A_user[,1:401]
colnames(A_user_control)
colnames(A_user_DV)

# 2.2for wide panel
A_org=fread("C:/Users/Administrator/Desktop/lucy/合成/A_org.csv")

#mean
mean1=mean(A_org$totalnumber_202005)
mean2=mean(A_org$PullRequestEvent_202005)
mean3=mean(A_org$CommitCommentEvent_202005)
mean4=mean(A_org$GollumEvent_202005)
mean5=mean(A_org$ForkEvent_202005)
mean6=mean(A_org$PublicEvent_202005)
mean7=mean(A_org$CreateEvent_202005)
mean8=mean(A_org$MemberEvent_202005)
mean9=mean(A_org$IssuesEvent_202005)
mean10=mean(A_org$ReleaseEvent_202005)
mean11=mean(A_org$DeleteEvent_202005)
mean12=mean(A_org$WatchEvent_202005)
mean13=mean(A_org$IssueCommentEvent_202005)
mean14=mean(A_org$PullRequestReviewCommentEvent_202005)
mean15=mean(A_org$PushEvent_202005)
mean16=mean(A_org$PullRequestReviewEvent_202005)
t1=rbind(mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10,mean11,mean12,mean13,mean14,mean15,mean16)

t6=round(t6,digits = 3)

D=cbind(t1,t2)
D=cbind(D,t25)




