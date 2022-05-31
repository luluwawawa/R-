# # based on A_user, run DID without matching
# #
rstudioapi::restartSession() 

library(data.table) ### clean data
library(lfe) ### for running two-way fixed effect panel regression
library(zoo) ### generate date variable
library(ggplot2) ### parallel trend figure
library(stargazer) ## output regression results to Word
library(plyr)

# # 1.read table
A_user=fread("C:/Users/Administrator/Desktop/lucy/合成/A_user.csv")
colnames(A_user)
A_login=A_user[,"login"]
A_user_control=A_user[,402:435]
A_user_control=cbind(A_login,A_user_control)
A_user_DV=A_user[,1:401]
colnames(A_user_control)
colnames(A_user_DV)

# # 2.melt data into panel data
DT=melt.data.table(A_user_DV,id.vars = "login",variable.name = "date",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

A_user_DV=DT[order(DT$login),] 

# merge
A_user= merge(A_user_DV,A_user_control,by="login",all=TRUE)
# order
A_user$date = as.numeric(as.character(A_user$date))
A_user=A_user[order(login),] 
A_user=A_user[order(user_id),] 
A_user[19:27,]
#
colnames(A_user)[2]="date"
A_user$date[A_user$date==1]="2018-05"
A_user$date[A_user$date==2]="2018-06"
A_user$date[A_user$date==3]="2018-07"
A_user$date[A_user$date==4]="2018-08"
A_user$date[A_user$date==5]="2018-09"
A_user$date[A_user$date==6]="2018-10"
A_user$date[A_user$date==7]="2018-11"
A_user$date[A_user$date==8]="2018-12"
A_user$date[A_user$date==9]="2019-01"
A_user$date[A_user$date==10]="2019-02"
A_user$date[A_user$date==11]="2019-03"
A_user$date[A_user$date==12]="2019-04"
A_user$date[A_user$date==13]="2019-05"
A_user$date[A_user$date==14]="2019-06"
A_user$date[A_user$date==15]="2019-07"
A_user$date[A_user$date==16]="2019-08"
A_user$date[A_user$date==17]="2019-09"
A_user$date[A_user$date==18]="2019-10"
A_user$date[A_user$date==19]="2019-11"
A_user$date[A_user$date==20]="2019-12"
A_user$date[A_user$date==21]="2020-01"
A_user$date[A_user$date==22]="2020-02"
A_user$date[A_user$date==23]="2020-03"
A_user$date[A_user$date==24]="2020-04"
A_user$date[A_user$date==25]="2020-05"
str(A_user$date)

# write
fwrite(A_user,"C:/Users/Administrator/Desktop/lucy/合成/A_user_panel.csv")

# # # # # # # # # # # # # DID without matching # # # # # # # # # # # # # #
# 1. read table
A_user=fread("C:/Users/Administrator/Desktop/lucy/合成/A_user_panel.csv")

# 2. generate treat and after variable,and contribution Variable
# treat variable
A_user[,treat:=ifelse(is_maintainer==1,1,0)]

#the shock happened on 2019-05=13
A_user[,table(date)]
A_user[,after:=ifelse(date>"2019-05",1,0)]

#contribution variable
A_user[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
                          IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
                          PushEvent+PullRequestReviewEvent]

#free-ride variable
A_user[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]

colnames(A_user)
A_user[13:25,]

A_user[,sum_contribution:=NULL]

# # # description of data
colnames(A_user)
a=summary(A_user)
tbl_summary(A_user)




# # 3. run DID1(DV ~ treat*after)
A_user[,table(after)]
mod1_1 = felm(contribution ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_2 = felm(free_ride ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_3 = felm(totalnumber ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_4 = felm(PullRequestEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_5 = felm(CommitCommentEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_6 = felm(GollumEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_7 = felm(ForkEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_8 = felm(PublicEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_9 = felm(CreateEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_10 = felm(MemberEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_11 = felm(IssuesEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_12 = felm(ReleaseEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_13 = felm(DeleteEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_14 = felm(WatchEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_15 = felm(IssueCommentEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_16 = felm(PullRequestReviewCommentEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_17 = felm(PushEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_18 = felm(PullRequestReviewEvent ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# # 4. run DID2(DV ~ treat*after*contribution_rate)
#  moderator1:
A_user[,contribution_rate:=ifelse(date<=13,contribution/(contribution + free_ride),0)]
Average_rate= A_user[,.(user_id,contribution_rate)]
# length(unique(Average_rate$user_id)) # 7494801
Average_rate[is.nan(Average_rate$contribution_rate)]=0
sum1= aggregate(Average_rate$contribution_rate,by=list(Average_rate$user_id),sum)
names(sum1)=c("user_id","sum_contribution")
sum1$rate_moderator=sum1$sum_contribution/13
A_user=merge(A_user,sum1,by="user_id",all=TRUE)
as.datatable(A_user)
# unique(Average_rate)
A_user[,sum_contribution:=NULL]
head(A_user)


# DID 2
mod2_1 = felm(contribution ~ treat*after*rate_moderator|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod2_2 = felm(free_ride ~ treat*after*rate_moderator|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod2_3 = felm(totalnumber ~ treat*after*rate_moderator|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# # 5. run DID3(DV~treat*after*recieved_not)
# moderator2:divide maintainer into reveived money/not received before research period(2020-5-31)
A_user[is_maintainer==1,received_not:=ifelse(first_sponsor_time<="2020-05-31",1,0)] #214375 
A_user[is_maintainer==0,received_not:= 0]
length(A_user[is_maintainer==1,]$user_id) #297000
A_user[,table(received_not)]
# DID 3
mod3_1 = felm(contribution ~ treat*after*received_not|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod3_2 = felm(free_ride ~ treat*after*received_not|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod3_3 = felm(totalnumber ~ treat*after*received_not|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# # 6. run DID4(DV~)
# moderator3:creat_time
A_user[,as.Date(creat_time)]
A_user[,creat_days:=as.numeric(difftime(creat_time,"2019-05-23",units = "days"))]

# DID 4
mod4_1 = felm(contribution ~ treat*after*creat_days|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod4_2 = felm(free_ride ~ treat*after*creat_days|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod4_3 = felm(totalnumber ~ treat*after*creat_days|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# # 7.run DID
# moderator5: isHireable
mod5_1 = felm(contribution ~ treat*after*isHireable|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod5_2 = felm(free_ride ~ treat*after*isHireable|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod5_3 = felm(totalnumber ~ treat*after*isHireable|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# moderator6: isSiteAdmin
mod6_1 = felm(contribution ~ treat*after*isSiteAdmin|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod6_2 = felm(free_ride ~ treat*after*isSiteAdmin|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod6_3 = felm(totalnumber ~ treat*after*isSiteAdmin|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# moderator7:isBountyHunter
mod7_1 = felm(contribution ~ treat*after*isBountyHunter|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod7_2 = felm(free_ride ~ treat*after*isBountyHunter|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod7_3 = felm(totalnumber ~ treat*after*isBountyHunter|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# moderator8:isCampusExpert
mod8_1 = felm(contribution ~ treat*after*isCampusExpert|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod8_2 = felm(free_ride ~ treat*after*isCampusExpert|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod8_3 = felm(totalnumber ~ treat*after*isCampusExpert|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# moderator9:isDeveloperProgramMember
mod9_1 = felm(contribution ~ treat*after*isDeveloperProgramMember|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod9_2 = felm(free_ride ~ treat*after*isDeveloperProgramMember|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod9_3 = felm(totalnumber ~ treat*after*isDeveloperProgramMember|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# moderator10:isEmployee
mod10_1 = felm(contribution ~ treat*after*isEmployee|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod10_2 = felm(free_ride ~ treat*after*isEmployee|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod10_3 = felm(totalnumber ~ treat*after*isEmployee|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# moderator11:isGitHubStar
mod11_1 = felm(contribution ~ treat*after*isGitHubStar|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod11_2 = felm(free_ride ~ treat*after*isGitHubStar|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod11_3 = felm(totalnumber ~ treat*after*isGitHubStar|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# moderator 12:organizations_number
A_user[,table(organizations_number)]
mod12_1 = felm(contribution ~ treat*after*organizations_number|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod12_2 = felm(free_ride ~ treat*after*organizations_number|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod12_3 = felm(totalnumber ~ treat*after*organizations_number|user_id + date|0|user_id, data = A_user[is_sponsor==0,])




