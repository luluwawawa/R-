# # CEM Matching
# 1. library Matching package
library(data.table)
library(cem)           ###CEM matching
library(lfe)

# 2.read A_user
A_user=fread("C:/Users/Administrator/Desktop/lucy/合成/A_user.csv")
colnames(A_user)
A_user=A_user[,402:435]
A_user=A_user[is_sponsor==0,]  #7475789
A_user[,as.Date(creat_time)]
A_user[,creat_days:= as.numeric(difftime("2019-05-23",creat_time, units = "days"))]
A_user_1=A_user[,c("user_id","is_maintainer","isHireable","isSiteAdmin",
                   "isBountyHunter","isCampusExpert","isDeveloperProgramMember","isEmployee",
                   "isGitHubStar","organizations_number","creat_days",
                   "repositories_number","projects_number","packages_number",
                   "topRepositories_number","following_number","followers_number")]

# 3. CEM matching 
# 3.1 check imbalance
#"2019-05-21"-"2019-02-01"
#creat_days="sturges"
#is_Hirable=c(0.5)
#isSiteAdmin= c(0.5)
#isBountyHunter=c(0.5) 
#isCampusExpert=c(0.5) 
#isDeveloperProgramMember=c(0.5) 
#isEmployee=c(0.5) 
#isGitHubStar=c(0.5) 

#repositories_number="sturges" 
#projects_number="sturges" 
#packages_number="sturges" 
#topRepositories_number="sturges" 
#following_number="sturges" 
#followers_number="sturges" 
#organizations_number="sturges" 

## Automatical coarsening for continuous variables
#cut.point就是分组的值
#首先设定每个变量的cut.point(对于连续变量，中间值设置为：sturges; 若是指定的数字，01变量，就是0.5)
cut_auto = list(is_Hirable=c(0.5),isSiteAdmin= c(0.5),isBountyHunter=c(0.5),isCampusExpert=c(0.5),
                isDeveloperProgramMember=c(0.5),isEmployee=c(0.5),isGitHubStar=c(0.5),
                organizations_number="sturges",creat_days="sturges",
                repositories_number="sturges",projects_number="sturges",packages_number="sturges",
                topRepositories_number="sturges",following_number="sturges",followers_number="sturges")

colnames(A_user_1)
## Check the imbalance（相对于中间值，对于两组，L1越接近与0越平衡）
rr = imbalance(A_user_1$is_maintainer, A_user_1, drop=c("user_id","is_maintainer"), breaks = cut_auto)
rr$tab

# 3.21 Automatical coarsening (CEM)
cem_auto <- cem(treatment = "is_maintainer", A_user_1, cutpoints = cut_auto, keep.all=TRUE,eval.imbalance = TRUE, drop = c("user_id","is_maintainer"), L1.breaks = cut_auto )
cem_auto$imbalance$tab

#3.22 manually matching
# # check distribution
library(ggplot2)
# 画出每个变量的直方图，看看是否符合normal distribute
organizations_numberHist <- ggplot(A_user_1, aes(x=organizations_number)) + geom_histogram(bins = 15, color="darkblue", fill="lightblue") + theme_bw() +
  xlab("organizations_number")
creat_daysHist <- ggplot(A_user_1, aes(x=creat_days)) + geom_histogram(bins = 15, color="darkblue", fill="lightblue") + theme_bw() +
  xlab("creat_days")
repositories_numberHist <- ggplot(A_user_1, aes(x=repositories_number)) + geom_histogram(bins = 15, color="darkblue", fill="lightblue") + theme_bw() +
  xlab("repositories_number")
projects_numberHist <- ggplot(A_user_1, aes(x=projects_number)) + geom_histogram(bins = 15, color="darkblue", fill="lightblue") + theme_bw() +
  xlab("projects_number")
topRepositories_numberHist <- ggplot(A_user_1, aes(x=topRepositories_number)) + geom_histogram(bins = 15, color="darkblue", fill="lightblue") + theme_bw() +
  xlab("topRepositories_number")
packages_numberHist <- ggplot(A_user_1, aes(x=packages_number)) + geom_histogram(bins = 15, color="darkblue", fill="lightblue") + theme_bw() +
  xlab("packages_number")
following_numberHist <- ggplot(A_user_1, aes(x=following_number)) + geom_histogram(bins = 15, color="darkblue", fill="lightblue") + theme_bw() +
  xlab("following_number")
followers_numberHist <- ggplot(A_user_1, aes(x=followers_number)) + geom_histogram(bins = 15, color="darkblue", fill="lightblue") + theme_bw() +
  xlab("followers_number")

library(gridExtra)
grid.arrange(organizations_numberHist,creat_daysHist,repositories_numberHist,
             projects_numberHist,topRepositories_numberHist,packages_numberHist,
             following_numberHist,followers_numberHist, ncol=3)

#(4)人为的定义一些cut.point
## Define cut points（找分类的点，很依靠之前的知识）
organizations_numberCut = 0.95
creat_daysCut = c(99.5,999.5,3999.5)
#repositories_numberCut = 0.95
#projects_numberCut = 0.95
#topRepositories_numberCut = 0.95
#packages_numberCut = 0.95
#following_numberCut =0.95
#followers_numberCut= 0.95

## Save the cut points into a list

#cut_man = list(is_Hirable=c(0.5),isSiteAdmin= c(0.5),isBountyHunter=c(0.5),isCampusExpert=c(0.5),
#     isDeveloperProgramMember=c(0.5),isEmployee=c(0.5),isGitHubStar=c(0.5),
#     organizations_number= organizations_numberCut,creat_days= creat_daysCut,
#     repositories_number= repositories_numberCut,projects_number= projects_numberCut,packages_number= topRepositories_numberCut,
#     topRepositories_number= topRepositories_numberCut,following_number=following_numberCut,followers_number=followers_numberCut)

cut_man = list(is_Hirable=c(0.5),isSiteAdmin= c(0.5),isBountyHunter=c(0.5),isCampusExpert=c(0.5),
     isDeveloperProgramMember=c(0.5),isEmployee=c(0.5),isGitHubStar=c(0.5),
     organizations_number= organizations_numberCut,creat_days= creat_daysCut)

### Imbalance before matching
rr = imbalance(A_user_1$is_maintainer, A_user_1, drop=c("user_id","is_maintainer"), breaks = cut_man)
rr$tab

### CEM matching
cem_man = cem(treatment = "is_maintainer", A_user_1, cutpoints = cut_man, keep.all=TRUE,eval.imbalance = TRUE, drop = c("user_id","is_maintainer"), L1.breaks = cut_man )
cem_man$imbalance$tab

# 3.3 using CEM filter data
A_user_cem_man=cbind(A_user_1,weight=cem_man$w)
summary(A_user_cem_man$weight)
A_user_cem_man=A_user_cem_man[,c("user_id","weight")]

#A_user_cem_auto=cbind(A_user_1,weight=cem_auto$w)
#summary(A_user_cem_auto$weight)
#A_user_cem_auto=A_user_cem_auto[,c("user_id","weight")]

# 3.4 merge data
A_user=fread("C:/Users/Administrator/Desktop/lucy/合成/A_user_panel.csv")
#A_user=merge(A_user,A_user_cem_auto,by="user_id",all=TRUE)

A_user=merge(A_user,A_user_cem_man,by="user_id",all=TRUE)
fwrite(A_user,"C:/Users/Administrator/Desktop/lucy/合成/A_user_panel_cem.csv")

# 3.5 running DID after matching

# (1). generate treat and after variable,and contribution Variable
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


# # (2). run DID1(DV ~ treat*after)
A_user[,table(after)]
A_user=A_user[is_sponsor==0,]
mod1_1 = felm(contribution ~ treat*after|user_id + date|0|user_id, data = A_user,weights = A_user$weight)
mod1_2 = felm(free_ride ~ treat*after|user_id + date|0|user_id, data = A_user,weights = A_user$weight)