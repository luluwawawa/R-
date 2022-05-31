# # A_org=A[is_org_or_organization==0,]
# # based on organization, run DID without matching
# #
rstudioapi::restartSession() 

library(data.table) ### clean data
library(lfe) ### for running two-way fixed effect panel regression
library(zoo) ### generate date variable
library(ggplot2) ### parallel trend figure

# # 1.read table
A_org=fread("C:/Users/Administrator/Desktop/lucy/合成/A_org.csv")
colnames(A_org)
A_login=A_org[,"login"]
A_org_control=A_org[,402:435]
A_org_control=cbind(A_login,A_org_control)
A_org_DV=A_org[,1:401]
colnames(A_org_control)
colnames(A_org_DV)

# #  2.melt data into panel data
DT=melt.data.table(A_org_DV,id.vars = "login",variable.name = "date",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
                                                                                              "CommitCommentEvent(.*)", "GollumEvent(.*)","ForkEvent(.*)", 
                                                                                              "PublicEvent(.*)","CreateEvent(.*)","MemberEvent(.*)",
                                                                                              "IssuesEvent(.*)","ReleaseEvent(.*)","DeleteEvent(.*)",
                                                                                              "WatchEvent(.*)","IssueCommentEvent(.*)",
                                                                                              "PullRequestReviewCommentEvent(.*)","PushEvent(.*)","PullRequestReviewEvent(.*)"),value.name = c("totalnumber","PullRequestEvent",
                                                                                                                                                                                               "CommitCommentEvent", "GollumEvent","ForkEvent", 
                                                                                                                                                                                               "PublicEvent","CreateEvent","MemberEvent",
                                                                                                                                                                                               "IssuesEvent","ReleaseEvent","DeleteEvent",
                                                                                                                                                                                               "WatchEvent","IssueCommentEvent",
                                                                                                                                                                                               "PullRequestReviewCommentEvent","PushEvent","PullRequestReviewEvent"))

A_org_DV=DT[order(DT$login),] 

# merge
A_org= merge(A_org_DV,A_org_control,by="login",all=TRUE)
# order
A_org$date = as.numeric(as.character(A_org$date))
A_org=A_org[order(login),] 
A_org=A_org[order(user_id),] 
A_org[19:27,]
#
colnames(A_org)[2]="date"
A_org$date[A_org$date==1]="2018-05"
A_org$date[A_org$date==2]="2018-06"
A_org$date[A_org$date==3]="2018-07"
A_org$date[A_org$date==4]="2018-08"
A_org$date[A_org$date==5]="2018-09"
A_org$date[A_org$date==6]="2018-10"
A_org$date[A_org$date==7]="2018-11"
A_org$date[A_org$date==8]="2018-12"
A_org$date[A_org$date==9]="2019-01"
A_org$date[A_org$date==10]="2019-02"
A_org$date[A_org$date==11]="2019-03"
A_org$date[A_org$date==12]="2019-04"
A_org$date[A_org$date==13]="2019-05"
A_org$date[A_org$date==14]="2019-06"
A_org$date[A_org$date==15]="2019-07"
A_org$date[A_org$date==16]="2019-08"
A_org$date[A_org$date==17]="2019-09"
A_org$date[A_org$date==18]="2019-10"
A_org$date[A_org$date==19]="2019-11"
A_org$date[A_org$date==20]="2019-12"
A_org$date[A_org$date==21]="2020-01"
A_org$date[A_org$date==22]="2020-02"
A_org$date[A_org$date==23]="2020-03"
A_org$date[A_org$date==24]="2020-04"
A_org$date[A_org$date==25]="2020-05"
str(A_org$date)

# write
fwrite(A_org,"C:/Users/Administrator/Desktop/lucy/合成/A_org_panel.csv")


# # ## # # # # # # # # # # # # DID without matching # # # # # # # # # # # # # #
# 1. read table
A_org=fread("C:/Users/Administrator/Desktop/lucy/合成/A_org_panel.csv")

# 2. generate treat and after variable,and contribution Variable
# treat variable
A_org[,treat:=ifelse(is_maintainer==1,1,0)]

#the shock happened on 2019-05=13
A_org[,table(date)]
A_org[,after:=ifelse(date>"2019-05",1,0)]

#contribution variable
A_org[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
         IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
         PushEvent+PullRequestReviewEvent]

#free-ride variable
A_org[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]

colnames(A_org)
A_org[13:25,]

A_org[,sum_contribution:=NULL]


# # 3. run DID1(DV ~ treat*after)
A_org[,table(after)]
mod1_1 = felm(contribution ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_2 = felm(free_ride ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_3 = felm(totalnumber ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_4 = felm(PullRequestEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_5 = felm(CommitCommentEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_6 = felm(GollumEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_7 = felm(ForkEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_8 = felm(PublicEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_9 = felm(CreateEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_10 = felm(MemberEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_11 = felm(IssuesEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_12 = felm(ReleaseEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_13 = felm(DeleteEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_14 = felm(WatchEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_15 = felm(IssueCommentEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_16 = felm(PullRequestReviewCommentEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_17 = felm(PushEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod1_18 = felm(PullRequestReviewEvent ~ treat*after|user_id + date|0|user_id, data = A_org[is_sponsor==0,])

# # 4. run DID2(DV ~ treat*after*contribution_rate)
#  moderator1:
A_org[,contribution_rate:=ifelse(date<=13,contribution/(contribution + free_ride),0)]
Average_rate= A_org[,.(user_id,contribution_rate)]
# length(unique(Average_rate$user_id)) # 7494801
Average_rate[is.nan(Average_rate$contribution_rate)]=0
sum1= aggregate(Average_rate$contribution_rate,by=list(Average_rate$user_id),sum)
names(sum1)=c("user_id","sum_contribution")
sum1$rate_moderator=sum1$sum_contribution/13
A_org=merge(A_org,sum1,by="user_id",all=TRUE)
as.datatable(A_org)
# unique(Average_rate)
A_org[,sum_contribution:=NULL]
head(A_org)


# DID 2
mod2_1 = felm(contribution ~ treat*after*rate_moderator|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod2_2 = felm(free_ride ~ treat*after*rate_moderator|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod2_3 = felm(totalnumber ~ treat*after*rate_moderator|user_id + date|0|user_id, data = A_org[is_sponsor==0,])

# # 5. run DID3(DV~treat*after*recieved_not)
# moderator2:divide maintainer into reveived money/not received before research period(2020-5-31)
A_org[is_maintainer==1,received_not:=ifelse(first_sponsor_time<="2020-05-31",1,0)] #214375 
A_org[is_maintainer==0,received_not:= 0]
length(A_org[is_maintainer==1,]$user_id) #297000
A_org[,table(received_not)]
# DID 3
mod3_1 = felm(contribution ~ treat*after*received_not|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod3_2 = felm(free_ride ~ treat*after*received_not|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod3_3 = felm(totalnumber ~ treat*after*received_not|user_id + date|0|user_id, data = A_org[is_sponsor==0,])

# # 6. run DID4(DV~)
# moderator3:creat_time
A_org[,as.Date(creat_time)]
A_org[,creat_days:=as.numeric(difftime(creat_time,"2019-05-23",units = "days"))]

# DID 4
mod4_1 = felm(contribution ~ treat*after*creat_days|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod4_2 = felm(free_ride ~ treat*after*creat_days|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod4_3 = felm(totalnumber ~ treat*after*creat_days|user_id + date|0|user_id, data = A_org[is_sponsor==0,])

# # 7.run DID
# moderator5: isVerified
mod5_1 = felm(contribution ~ treat*after*isVerified|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod5_2 = felm(free_ride ~ treat*after*isVerified|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod5_3 = felm(totalnumber ~ treat*after*isVerified|user_id + date|0|user_id, data = A_org[is_sponsor==0,])

# moderator6: membersWithRole_number
mod6_1 = felm(contribution ~ treat*after*membersWithRole_number|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod6_2 = felm(free_ride ~ treat*after*membersWithRole_number|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
mod6_3 = felm(totalnumber ~ treat*after*membersWithRole_number|user_id + date|0|user_id, data = A_org[is_sponsor==0,])
