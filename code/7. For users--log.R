# # # # # # # # # # # # # DID without matching(log) # # # # # # # # # # # # # #
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
A_user[,name:=NULL]
A_user[,bio:=NULL]
A_user[,avatarurl]

### 4.log
# # 3.log-transformation and lag 
A_user[totalnumber < 30, hist(totalnumber, breaks = 30)]  ## dependent variable is highly right-skewed
A_user[contribution < 30, hist(contribution, breaks = 30)]
A_user[free_ride < 30, hist(free_ride, breaks = 30)]

## 
colnames(A_user)
col_names = colnames(A_user[,3:18])
var_names = paste0("l", col_names)

for (i in c(1:length(col_names))) {
  set(A_user,var_names[i],log1p(A_user[[col_names[i]]]))
}

## generate lag
my_shift <- function(x){return(shift(x,1,type = "lag", fill = x[1L]))}
## we must sort our data before generating lag
A_user = A_user[order(user_id, date)]

colnames(A_user)
col_names = colnames(A_user[,57:72])
var_names = paste0("lag_", col_names)

for (i in c(1:length(col_names))) {
  A_user[, (var_names[i]) := my_shift(get(col_names[i])), by = "user_id"]
}

# # 5. add contirbution and free ride log
## 
colnames(A_user)
col_names = colnames(A_user[,3:18])
var_names = paste0("l", col_names)

for (i in c(1:length(col_names))) {
  set(A_user,var_names[i],log1p(A_user[[col_names[i]]]))
}

## generate lag
my_shift <- function(x){return(shift(x,1,type = "lag", fill = x[1L]))}
## we must sort our data before generating lag
A_user = A_user[order(user_id, date)]


colnames(A_user)
col_names = colnames(A_user[,57:72])
var_names = paste0("lag_", col_names)

for (i in c(1:length(col_names))) {
  A_user[, (var_names[i]) := my_shift(get(col_names[i])), by = "user_id"]
}

# 6. DID
mod1_1 = felm(lcontribution ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_2 = felm(lfree_ride ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
mod1_3 = felm(ltotalnumber ~ treat*after|user_id + date|0|user_id, data = A_user[is_sponsor==0,])
