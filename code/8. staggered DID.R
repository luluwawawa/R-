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

# 3. generate staggered DID variable
#creat_sponsorlist_time

A_user[is_maintainer==1,as.yearmon(creat_sponsorlist_time)]
A_user[is.na(A_user$creat_sponsorlist_time)]=0
A_user[is_maintainer==1,staggered:=ifelse(creat_sponsorlist_time<=date,1,0)]
A_user[is_maintainer==1,distance:=(as.yearmon(date)-as.yearmon(creat_sponsorlist_time))*12]

A_user[,table(distance)]
A_user[is_maintainer==1,d_12:=ifelse(distance<=-12,1,0)]
A_user[is_maintainer==1,d_11:=ifelse(distance==-11,1,0)]
A_user[is_maintainer==1,d_10:=ifelse(distance==-10,1,0)]
A_user[is_maintainer==1,d_9:=ifelse(distance==-9,1,0)]
A_user[is_maintainer==1,d_8:=ifelse(distance==-8,1,0)]
A_user[is_maintainer==1,d_7:=ifelse(distance==-7,1,0)]
A_user[is_maintainer==1,d_6:=ifelse(distance==-6,1,0)]
A_user[is_maintainer==1,d_5:=ifelse(distance==-5,1,0)]
A_user[is_maintainer==1,d_4:=ifelse(distance==-4,1,0)]
A_user[is_maintainer==1,d_3:=ifelse(distance==-3,1,0)]
A_user[is_maintainer==1,d_2:=ifelse(distance==-2,1,0)]
A_user[is_maintainer==1,d_1:=ifelse(distance==-1,1,0)]
A_user[is_maintainer==1,current:=ifelse(distance==0,1,0)]
A_user[is_maintainer==1,d1:=ifelse(distance==1,1,0)]
A_user[is_maintainer==1,d2:=ifelse(distance==2,1,0)]
A_user[is_maintainer==1,d3:=ifelse(distance==3,1,0)]
A_user[is_maintainer==1,d4:=ifelse(distance==4,1,0)]
A_user[is_maintainer==1,d5:=ifelse(distance==5,1,0)]
A_user[is_maintainer==1,d6:=ifelse(distance==6,1,0)]
A_user[is_maintainer==1,d7:=ifelse(distance==7,1,0)]
A_user[is_maintainer==1,d8:=ifelse(distance==8,1,0)]
A_user[is_maintainer==1,d9:=ifelse(distance==9,1,0)]
A_user[is_maintainer==1,d10:=ifelse(distance==10,1,0)]
A_user[is_maintainer==1,d11:=ifelse(distance==11,1,0)]
A_user[is_maintainer==1,d12:=ifelse(distance>=12,1,0)]
A_user[is.na(A_user$staggered)]=0
A_user[is.na(A_user$distance)]=0
A_user[is.na(A_user$d1)]=0
A_user[is.na(A_user$d2)]=0
A_user[is.na(A_user$d3)]=0
A_user[is.na(A_user$d4)]=0
A_user[is.na(A_user$d5)]=0
A_user[is.na(A_user$d6)]=0
A_user[is.na(A_user$d7)]=0
A_user[is.na(A_user$d8)]=0
A_user[is.na(A_user$d9)]=0
A_user[is.na(A_user$d10)]=0
A_user[is.na(A_user$d11)]=0
A_user[is.na(A_user$d12)]=0
A_user[is.na(A_user$current)]=0
A_user[is.na(A_user$d_1)]=0
A_user[is.na(A_user$d_2)]=0
A_user[is.na(A_user$d_3)]=0
A_user[is.na(A_user$d_4)]=0
A_user[is.na(A_user$d_5)]=0
A_user[is.na(A_user$d_6)]=0
A_user[is.na(A_user$d_7)]=0
A_user[is.na(A_user$d_8)]=0
A_user[is.na(A_user$d_9)]=0
A_user[is.na(A_user$d_10)]=0
A_user[is.na(A_user$d_11)]=0
A_user[is.na(A_user$d_12)]=0


# 5. run staggered DID
#mod1_1 = felm(contribution ~ staggered|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
#mod1_2 = felm(free_ride ~ staggered|user_id + date|0|user_id, data = A_user[is_sponsor==0,])

# 6. parallel trend 

mod_para = felm(contribution ~ d_12+d_11+d_10+d_9+d_8+d_7+d_6+d_5+d_4+d_3+d_2+d_1+current+d1+d2+d3+d4+d5+d6+d7+d8+d9+d10+d11+d12|user_id + date|0|user_id, data = A_user,weights = A_user$weight)
summary(mod_para)




