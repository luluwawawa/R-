#changing treat variable: from is_maintainer to received_not

# # # # # # # # # # # # # DID without matching # # # # # # # # # # # # # #
# 1. read table
A_user=fread("C:/Users/Administrator/Desktop/lucy/合成/A_user_panel.csv")

# 2. generate treat and after variable,and contribution Variable
# treat variable: using recived_not as treat 
#A_user[,treat:=ifelse(is_maintainer==1,1,0)]
# moderator2:divide maintainer into reveived money/not received before research period(2020-5-31)
A_user[is_maintainer==1,received_not:=ifelse(first_sponsor_time<="2020-05-31",1,0)] #214375
A_user[is_maintainer==0,received_not:= 0]
length(A_user[is_maintainer==1,]$user_id) #297000
A_user[,table(received_not)]


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

# # 3. run DID1(DV ~ received_not*after)
A_user[,table(after)]
mod1_1 = felm(contribution ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_2 = felm(free_ride ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_3 = felm(totalnumber ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_4 = felm(PullRequestEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_5 = felm(CommitCommentEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_6 = felm(GollumEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_7 = felm(ForkEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_8 = felm(PublicEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_9 = felm(CreateEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_10 = felm(MemberEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_11 = felm(IssuesEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_12 = felm(ReleaseEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_13 = felm(DeleteEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_14 = felm(WatchEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_15 = felm(IssueCommentEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_16 = felm(PullRequestReviewCommentEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_17 = felm(PushEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_18 = felm(PullRequestReviewEvent ~ received_not*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])



