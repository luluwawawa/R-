# # #
library(data.table)

# # # read 201805
data201805=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201805.csv")
data201806=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201806.csv")
data201807=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201807.csv")
data201808=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201808.csv")
data201809=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201809.csv")
data201810=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201810.csv")
data201811=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201811.csv")
data201812=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201812.csv")
data201901=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201901.csv")
data201902=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201902.csv")
data201903=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201903.csv")
data201904=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201904.csv")
data201905=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201905.csv")
data201906=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201906.csv")
data201907=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201907.csv")
data201908=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201908.csv")
data201909=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201909.csv")
data201910=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201910.csv")
data201911=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201911.csv")
data201912=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL201912.csv")
data202001=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL202001.csv")
data202002=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL202002.csv")
data202003=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL202003.csv")
data202004=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL202004.csv")
data202005=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\SQL202005.csv")


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

fwrite(B24,"C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\B24.csv")

# #1,方法1 ：用panel
install.packages("panelr")
library(panelr)
long_panel=long_panel(B24, prefix = "_", begin = 201805, end = 202005, label_location = "end",id="login")
fwrite(long_panel,"C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\long_panel.csv")

# #2.方法2 ：用data.table melt
DT=melt.data.table(B24,id.vars = "login",variable.name = "year",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

melt_panel=DT[order(DT$login),]  
fwrite(melt_panel,"C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\melt_panel.csv")

# # 3.B24与control变量结合
DT2=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\total.csv")
colnames(DT2)
head(DT2,10)
names(DT2)=c( "user_id","login","is_user_or_organization", 
              "creat_time","is_maintainer","creat_sponsorlist_time",  
             "first_sponsor_time","is_sponsor","first_sponsoring_time",   
              "name","avatarUrl","bio","location","websiteUrl","twitterUsername",         
             "email","repositories_number","repositories_first_creat",
             "projects_number","projects_first_creat","packages_number",         
              "topRepositories_number","company","following_number",       
            "followers_number","organizations_number","isHireable",              
            "isSiteAdmin","isBountyHunter","isCampusExpert",         
         "isDeveloperProgramMember","isEmployee","isGitHubStar",            
           "membersWithRole_number","isVerified")
wide_final= merge(B24,DT2,by="login",all=TRUE)

fwrite(wide_final,"C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\wide_final.csv")

# # 3.panel与control变量结合
melt_panel=fread("C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\melt_panel.csv")
long_final = merge(melt_panel,DT2,by="login",all=TRUE) 
fwrite(long_final,"C:\\Users\\Administrator\\Desktop\\lucy\\SQL Data\\long_final.csv")


# # 初步分析DT[i=where,j=select,by=group by ,order by]
#先把treat group筛选出来
colnames(wide_final)

mean_tabel=data.table(c("maintainer"),c("non-maintainer"))
for (col in colnames(wide_final[,3:])){
  a=Wide_final[,mean(col),by=hasMaintainer]
  mean_table=rbind(mean_table,a)
}


# #3.得到最终的表格
for (i in colnames(B24[,3:])) {
  a=
  
}
a1=mean(B24$totalnumber_201805)
a2=mean(B24$PullRequestEvent_201805)
a3=mean(B24$CommitCommentEvent_201805)
a4=mean(B24$GollumEvent_201805)
a5=mean(B24$ForkEvent_201805)
a6=mean(B24$PublicEvent_201805)
a7=mean(B24$CreateEvent_201805)
a8=mean(B24$MemberEvent_201805)
a9=mean(B24$IssuesEvent_201805)
a10=mean(B24$ReleaseEvent_201805)
a11=mean(B24$DeleteEvent_201805)
a12=mean(B24$WatchEvent_201805)
a13=mean(B24$IssueCommentEvent_201805)
a14=mean(B24$PullRequestReviewCommentEvent_201805)
a15=mean(B24$PushEvent_201805)
A1=list(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15)
a1=mean(B24$totalnumber_201806)
a2=mean(B24$PullRequestEvent_201806)
a3=mean(B24$CommitCommentEvent_201806)
a4=mean(B24$GollumEvent_201806)
a5=mean(B24$ForkEvent_201806)
a6=mean(B24$PublicEvent_201806)
a7=mean(B24$CreateEvent_201806)
a8=mean(B24$MemberEvent_201806)
a9=mean(B24$IssuesEvent_201806)
a10=mean(B24$ReleaseEvent_201806)
a11=mean(B24$DeleteEvent_201806)
a12=mean(B24$WatchEvent_201806)
a13=mean(B24$IssueCommentEvent_201806)
a14=mean(B24$PullRequestReviewCommentEvent_201806)
a15=mean(B24$PushEvent_201806)
A2=list(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15)
mean_table=rbind(A1,A2)


# # plot
ggplot() + geom_line(aes(mean$time,mean$totalnumber),color="red") + 
  geom_line(aes(mean$time,mean$PullRequestEvent),color="black")+
  geom_line(aes(mean$time,mean$CommitCommentEvent),color="blue")+
  geom_line(aes(mean$time,mean$GollumEvent),color="yellow") +
  geom_line(aes(mean$time,mean$ForkEvent),color="cyan1") +
  geom_line(aes(mean$time,mean$PublicEvent),color="deeppink") +
  geom_line(aes(mean$time,mean$CreateEvent),color="green") +
  geom_line(aes(mean$time,mean$MemberEvent),color="cyan2") +
  geom_line(aes(mean$time,mean$IssuesEvent),color="purple") +
  geom_line(aes(mean$time,mean$ReleaseEvent),color="darksalmon") +
  geom_line(aes(mean$time,mean$DeleteEvent),color="coral") +
  geom_line(aes(mean$time,mean$WatchEvent),color="bisque") +
  geom_line(aes(mean$time,mean$IssueCommentEvent),color="azure2")+
  geom_line(aes(mean$time,mean$PullRequestReviewCommentEvent),color="cornsilk") +
  geom_line(aes(mean$time,mean$PushEvent),color="skyblue") +
  scale_colour_manual("",c("red","black","blue","yellow","cyan1","deeppink",))

