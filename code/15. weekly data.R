# # 1.read weekly data
SQL20190901=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190901.csv")
SQL20190902=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190902.csv")
SQL20190903=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190903.csv")
SQL20190904=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190904.csv")
SQL20190905=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190905.csv")
SQL20190906=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190906.csv")
SQL20190907=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190907.csv")
w2019_w1 = merge(SQL20190901,SQL20190902,by="login",all=TRUE) 
w2019_w1 = merge(w2019_w1,SQL20190903,by="login",all=TRUE) 
w2019_w1 = merge(w2019_w1,SQL20190904,by="login",all=TRUE)  
w2019_w1 = merge(w2019_w1,SQL20190905,by="login",all=TRUE) 
w2019_w1 = merge(w2019_w1,SQL20190906,by="login",all=TRUE) 
w2019_w1 = merge(w2019_w1,SQL20190907,by="login",all=TRUE) 
w2019_w1 = melt.data.table(w2019_w1,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w1=w2019_w1[order(w2019_w1$login),] 
w2019_w1[is.na(w2019_w1)]=0
Tw2019_w1= aggregate(w2019_w1$totalnumber,by=list(w2019_w1$login),sum)
colnames(Tw2019_w1)=c("login","totalnumber2019w1")
fwrite(Tw2019_w1,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w1.csv")


SQL20190908=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190908.csv")
SQL20190909=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190909.csv")
SQL20190910=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190910.csv")
SQL20190911=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190911.csv")
SQL20190912=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190912.csv")
SQL20190913=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190913.csv")
SQL20190914=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190914.csv")
w2019_w2 = merge(SQL20190908,SQL20190909,by="login",all=TRUE) 
w2019_w2 = merge(w2019_w2,SQL20190910,by="login",all=TRUE) 
w2019_w2 = merge(w2019_w2,SQL20190911,by="login",all=TRUE)  
w2019_w2 = merge(w2019_w2,SQL20190912,by="login",all=TRUE) 
w2019_w2 = merge(w2019_w2,SQL20190913,by="login",all=TRUE) 
w2019_w2 = merge(w2019_w2,SQL20190914,by="login",all=TRUE) 
w2019_w2 = melt.data.table(w2019_w2,id.vars = "login",variable.name = "week2",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w2=w2019_w2[order(w2019_w2$login),] 
w2019_w2[is.na(w2019_w2)]=0
Tw2019_w2= aggregate(w2019_w2$totalnumber,by=list(w2019_w2$login),sum)
colnames(Tw2019_w2)=c("login","totalnumber2019w2")
fwrite(Tw2019_w2,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w2.csv")

SQL20190915=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190915.csv")
SQL20190916=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190916.csv")
SQL20190917=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190917.csv")
SQL20190918=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190918.csv")
SQL20190919=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190919.csv")
SQL20190920=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190920.csv")
SQL20190921=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190921.csv")
w2019_w3 = merge(SQL20190915,SQL20190916,by="login",all=TRUE) 
w2019_w3 = merge(w2019_w3,SQL20190917,by="login",all=TRUE) 
w2019_w3 = merge(w2019_w3,SQL20190918,by="login",all=TRUE)  
w2019_w3 = merge(w2019_w3,SQL20190919,by="login",all=TRUE) 
w2019_w3 = merge(w2019_w3,SQL20190920,by="login",all=TRUE) 
w2019_w3 = merge(w2019_w3,SQL20190921,by="login",all=TRUE) 
w2019_w3 = melt.data.table(w2019_w3,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w3=w2019_w3[order(w2019_w3$login),] 
w2019_w3[is.na(w2019_w3)]=0
Tw2019_w3= aggregate(w2019_w3$totalnumber,by=list(w2019_w3$login),sum)
colnames(Tw2019_w3)=c("login","totalnumber2019w3")
fwrite(Tw2019_w3,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w3.csv")

SQL20190922=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190922.csv")
SQL20190923=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190923.csv")
SQL20190924=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190924.csv")
SQL20190925=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190925.csv")
SQL20190926=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190926.csv")
SQL20190927=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190927.csv")
SQL20190928=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190928.csv")
w2019_w4 = merge(SQL20190922,SQL20190923,by="login",all=TRUE) 
w2019_w4 = merge(w2019_w4,SQL20190924,by="login",all=TRUE) 
w2019_w4 = merge(w2019_w4,SQL20190925,by="login",all=TRUE)  
w2019_w4 = merge(w2019_w4,SQL20190926,by="login",all=TRUE) 
w2019_w4 = merge(w2019_w4,SQL20190927,by="login",all=TRUE) 
w2019_w4 = merge(w2019_w4,SQL20190928,by="login",all=TRUE) 
w2019_w4 = melt.data.table(w2019_w4,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w4=w2019_w4[order(w2019_w4$login),] 
w2019_w4[is.na(w2019_w4)]=0
Tw2019_w4= aggregate(w2019_w4$totalnumber,by=list(w2019_w4$login),sum)
colnames(Tw2019_w4)=c("login","totalnumber2019w4")
fwrite(Tw2019_w4,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w4.csv")

SQL20190929=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190929.csv")
SQL20190930=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20190930.csv")
SQL20191001=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191001.csv")
SQL20191002=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191002.csv")
SQL20191003=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191003.csv")
SQL20191004=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191004.csv")
SQL20191005=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191005.csv")
w1910_w5 = merge(SQL20190929,SQL20190930,by="login",all=TRUE) 
w1910_w1 = merge(w1910_w1,SQL20191001,by="login",all=TRUE) 
w1910_w1 = merge(w1910_w1,SQL20191002,by="login",all=TRUE)  
w1910_w1 = merge(w1910_w1,SQL20191003,by="login",all=TRUE) 
w1910_w1 = merge(w1910_w1,SQL20191004,by="login",all=TRUE) 
w1910_w1 = merge(w1910_w1,SQL20191005,by="login",all=TRUE) 
w1910_w1 = melt.data.table(w1910_w1,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w1910_w1=w1910_w1[order(w1910_w1$login),] 
w1910_w1[is.na(w1910_w1)]=0
Tw1910_w1= aggregate(w1910_w1$totalnumber,by=list(w1910_w1$login),sum)
colnames(Tw1910_w1)=c("login","totalnumber2019w5")
fwrite(Tw1910_w1,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw1910_w1.csv")

SQL20191006=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191006.csv")
SQL20191007=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191007.csv")
SQL20191008=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191008.csv")
SQL20191009=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191009.csv")
SQL20191010=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191010.csv")
SQL20191011=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191011.csv")
SQL20191012=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191012.csv")
w2019_w6 = merge(SQL20191006,SQL20191007,by="login",all=TRUE) 
w2019_w6 = merge(w2019_w6,SQL20191008,by="login",all=TRUE) 
w2019_w6 = merge(w2019_w6,SQL20191009,by="login",all=TRUE)  
w2019_w6 = merge(w2019_w6,SQL20191010,by="login",all=TRUE) 
w2019_w6 = merge(w2019_w6,SQL20191011,by="login",all=TRUE) 
w2019_w6 = merge(w2019_w6,SQL20191012,by="login",all=TRUE) 
w2019_w6 = melt.data.table(w2019_w6,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w6=w2019_w6[order(w2019_w6$login),] 
w2019_w6[is.na(w2019_w6)]=0
Tw2019_w6= aggregate(w2019_w6$totalnumber,by=list(w2019_w6$login),sum)
colnames(Tw2019_w6)=c("login","totalnumber2019w6")
fwrite(Tw2019_w6,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w6.csv")

SQL20191013=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191013.csv")
SQL20191014=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191014.csv")
SQL20191015=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191015.csv")
SQL20191016=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191016.csv")
SQL20191017=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191017.csv")
SQL20191018=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191018.csv")
SQL20191019=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191019.csv")
w2019_w7 = merge(SQL20191013,SQL20191014,by="login",all=TRUE) 
w2019_w7 = merge(w2019_w7,SQL20191015,by="login",all=TRUE) 
w2019_w7 = merge(w2019_w7,SQL20191016,by="login",all=TRUE)  
w2019_w7 = merge(w2019_w7,SQL20191017,by="login",all=TRUE) 
w2019_w7 = merge(w2019_w7,SQL20191018,by="login",all=TRUE) 
w2019_w7 = merge(w2019_w7,SQL20191019,by="login",all=TRUE) 
w2019_w7 = melt.data.table(w2019_w7,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w7=w2019_w7[order(w2019_w7$login),] 
w2019_w7[is.na(w2019_w7)]=0
Tw2019_w7= aggregate(w2019_w7$totalnumber,by=list(w2019_w7$login),sum)
colnames(Tw2019_w7)=c("login","totalnumber2019w7")
fwrite(Tw2019_w7,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w7.csv")

SQL20191020=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191020.csv")
SQL20191021=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191021.csv")
SQL20191022=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191022.csv")
SQL20191023=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191023.csv")
SQL20191024=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191024.csv")
SQL20191025=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191025.csv")
SQL20191026=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191026.csv")
w2019_w8 = merge(SQL20191020,SQL20191021,by="login",all=TRUE) 
w2019_w8 = merge(w2019_w8,SQL20191022,by="login",all=TRUE) 
w2019_w8 = merge(w2019_w8,SQL20191023,by="login",all=TRUE)  
w2019_w8 = merge(w2019_w8,SQL20191024,by="login",all=TRUE) 
w2019_w8 = merge(w2019_w8,SQL20191025,by="login",all=TRUE) 
w2019_w8 = merge(w2019_w8,SQL20191026,by="login",all=TRUE) 
w2019_w8 = melt.data.table(w2019_w8,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w8=w2019_w8[order(w2019_w8$login),] 
w2019_w8[is.na(w2019_w8)]=0
Tw2019_w8= aggregate(w2019_w8$totalnumber,by=list(w2019_w8$login),sum)
colnames(Tw2019_w8)=c("login","totalnumber2019w8")
fwrite(Tw2019_w8,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w8.csv")

SQL20191027=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191027.csv")
SQL20191028=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191028.csv")
SQL20191029=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191029.csv")
SQL20191030=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191030.csv")
SQL20191031=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191031.csv")
SQL20191101=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191101.csv")
SQL20191102=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191102.csv")
w2019_w9 = merge(SQL20191027,SQL20191028,by="login",all=TRUE) 
w2019_w9 = merge(w2019_w9,SQL20191029,by="login",all=TRUE) 
w2019_w9 = merge(w2019_w9,SQL20191030,by="login",all=TRUE)  
w2019_w9 = merge(w2019_w9,SQL20191031,by="login",all=TRUE) 
w2019_w9 = merge(w2019_w9,SQL20191101,by="login",all=TRUE) 
w2019_w9 = merge(w2019_w9,SQL20191102,by="login",all=TRUE) 
w2019_w9 = melt.data.table(w2019_w9,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w9=w2019_w9[order(w2019_w9$login),] 
w2019_w9[is.na(w2019_w9)]=0
Tw2019_w9= aggregate(w2019_w9$totalnumber,by=list(w2019_w9$login),sum)
colnames(Tw2019_w9)=c("login","totalnumber2019w9")
fwrite(Tw2019_w9,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w9.csv")

SQL20191103=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191103.csv")
SQL20191104=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191104.csv")
SQL20191105=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191105.csv")
SQL20191106=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191106.csv")
SQL20191107=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191107.csv")
SQL20191108=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191108.csv")
SQL20191109=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191109.csv")
w2019_w10 = merge(SQL20191103,SQL20191104,by="login",all=TRUE) 
w2019_w10 = merge(w2019_w10,SQL20191105,by="login",all=TRUE) 
w2019_w10 = merge(w2019_w10,SQL20191106,by="login",all=TRUE)  
w2019_w10 = merge(w2019_w10,SQL20191107,by="login",all=TRUE) 
w2019_w10 = merge(w2019_w10,SQL20191108,by="login",all=TRUE) 
w2019_w10 = merge(w2019_w10,SQL20191109,by="login",all=TRUE) 
w2019_w10 = melt.data.table(w2019_w10,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w10=w2019_w10[order(w2019_w10$login),] 
w2019_w10[is.na(w2019_w10)]=0
Tw2019_w10= aggregate(w2019_w10$totalnumber,by=list(w2019_w10$login),sum)
colnames(Tw2019_w10)=c("login","totalnumber2019w10")
fwrite(Tw2019_w10,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w10.csv")

SQL20191110=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191110.csv")
SQL20191111=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191111.csv")
SQL20191112=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191112.csv")
SQL20191113=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191113.csv")
SQL20191114=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191114.csv")
SQL20191115=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191115.csv")
SQL20191116=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191116.csv")
w2019_w11 = merge(SQL20191110,SQL20191111,by="login",all=TRUE) 
w2019_w11 = merge(w2019_w11,SQL20191112,by="login",all=TRUE) 
w2019_w11 = merge(w2019_w11,SQL20191113,by="login",all=TRUE)  
w2019_w11 = merge(w2019_w11,SQL20191114,by="login",all=TRUE) 
w2019_w11 = merge(w2019_w11,SQL20191115,by="login",all=TRUE) 
w2019_w11 = merge(w2019_w11,SQL20191116,by="login",all=TRUE) 
w2019_w11 = melt.data.table(w2019_w11,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w11=w2019_w11[order(w2019_w11$login),] 
w2019_w11[is.na(w2019_w11)]=0
Tw2019_w11= aggregate(w2019_w11$totalnumber,by=list(w2019_w11$login),sum)
colnames(Tw2019_w11)=c("login","totalnumber2019w11")
fwrite(Tw2019_w11,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w11.csv")

SQL20191117=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191117.csv")
SQL20191118=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191118.csv")
SQL20191119=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191119.csv")
SQL20191120=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191120.csv")
SQL20191121=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191121.csv")
SQL20191122=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191122.csv")
SQL20191123=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191123.csv")
w2019_w12 = merge(SQL20191117,SQL20191118,by="login",all=TRUE) 
w2019_w12 = merge(w2019_w12,SQL20191119,by="login",all=TRUE) 
w2019_w12 = merge(w2019_w12,SQL20191120,by="login",all=TRUE)  
w2019_w12 = merge(w2019_w12,SQL20191121,by="login",all=TRUE) 
w2019_w12 = merge(w2019_w12,SQL20191122,by="login",all=TRUE) 
w2019_w12 = merge(w2019_w12,SQL20191123,by="login",all=TRUE) 
w2019_w12 = melt.data.table(w2019_w12,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w12=w2019_w12[order(w2019_w12$login),] 
w2019_w12[is.na(w2019_w12)]=0
Tw2019_w12= aggregate(w2019_w12$totalnumber,by=list(w2019_w12$login),sum)
colnames(Tw2019_w12)=c("login","totalnumber2019w12")
fwrite(Tw2019_w12,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w12.csv")

SQL20191124=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191124.csv")
SQL20191125=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191125.csv")
SQL20191126=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191126.csv")
SQL20191127=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191127.csv")
SQL20191128=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191128.csv")
SQL20191129=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191129.csv")
SQL20191130=fread("C:/Users/Administrator/Desktop/lucy/SQL_weekly/SQL20191130.csv")
w2019_w13 = merge(SQL20191124,SQL20191125,by="login",all=TRUE) 
w2019_w13 = merge(w2019_w13,SQL20191126,by="login",all=TRUE) 
w2019_w13 = merge(w2019_w13,SQL20191127,by="login",all=TRUE)  
w2019_w13 = merge(w2019_w13,SQL20191128,by="login",all=TRUE) 
w2019_w13 = merge(w2019_w13,SQL20191129,by="login",all=TRUE) 
w2019_w13 = merge(w2019_w13,SQL20191130,by="login",all=TRUE) 
w2019_w13 = melt.data.table(w2019_w13,id.vars = "login",variable.name = "week1",measure.vars = patterns("totalnumber(.*)","PullRequestEvent(.*)",
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

w2019_w13=w2019_w13[order(w2019_w13$login),] 
w2019_w13[is.na(w2019_w13)]=0
Tw2019_w13= aggregate(w2019_w13$totalnumber,by=list(w2019_w13$login),sum)
colnames(Tw2019_w13)=c("login","totalnumber2019w13")
fwrite(Tw2019_w13,"C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w13.csv")



# # 
Tw2019_w1=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w1.csv")
Tw2019_w2=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w2.csv")
Tw2019_w3=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w3.csv")
Tw2019_w4=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w4.csv")
Tw2019_w5=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w5.csv")
Tw2019_w6=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w6.csv")
Tw2019_w7=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w7.csv")
Tw2019_w8=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w8.csv")
Tw2019_w9=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w9.csv")
Tw2019_w10=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w10.csv")
Tw2019_w11=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w11.csv")
Tw2019_w12=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w12.csv")
Tw2019_w13=fread("C:\\Users\\Administrator\\Desktop\\lucy\\合成\\Tw2019_w13.csv")

Tw2019_all = merge(Tw2019_w1,Tw2019_w2,by="login",all=TRUE) 
Tw2019_all = merge(Tw2019_all,Tw2019_w3,by="login",all=TRUE) 
Tw2019_all = merge(Tw2019_all,Tw2019_w4,by="login",all=TRUE) 
Tw2019_all = merge(Tw2019_all,Tw2019_w5,by="login",all=TRUE) 
Tw2019_all = merge(Tw2019_all,Tw2019_w6,by="login",all=TRUE) 
Tw2019_all = merge(Tw2019_all,Tw2019_w7,by="login",all=TRUE) 
Tw2019_all = merge(Tw2019_all,Tw2019_w8,by="login",all=TRUE) 
Tw2019_all = merge(Tw2019_all,Tw2019_w9,by="login",all=TRUE) 
Tw2019_all = merge(Tw2019_all,Tw2019_w10,by="login",all=TRUE) 
Tw2019_all = merge(Tw2019_all,Tw2019_w11,by="login",all=TRUE) 
Tw2019_all = merge(Tw2019_all,Tw2019_w12,by="login",all=TRUE) 
Tw2019_all = merge(Tw2019_all,Tw2019_w13,by="login",all=TRUE) 

A_all=fread("C:/Users/Administrator/Desktop/lucy/合成/A_all.csv")
A_all_temp=A_all[is_maintainer==1 & is_user_or_organization==1,]
A_all_temp=A_all_temp[,c("login","creat_sponsorlist_time","first_sponsor_time")]
fwrite(A_all_temp,"C:/Users/Administrator/Desktop/lucy/合成/A_all_temp.csv")
DT=merge(A_all_temp,Tw2019_all,by="login") # 两个都有的才对
colnames(DT)
DT[is.na(DT)]=0

# caculate mean
temp1=mean(DT$totalnumber2019w1)
for (col in colnames(DT[,4:15])) {
  temp=mean(DT[[col]])
  temp1=rbind(temp1,temp)
}

#w5(77)
DT1=DT[creat_sponsorlist_time >"2019-09-28" & creat_sponsorlist_time <="2019-10-05",]
temp2=mean(DT1$totalnumber2019w1)
for (col in colnames(DT1[,4:15])) {
  temp=mean(DT1[[col]])
  temp2=rbind(temp2,temp)
}

#w6(422)
DT2=DT[creat_sponsorlist_time >"2019-10-05" & creat_sponsorlist_time <="2019-10-12",]
temp3=mean(DT2$totalnumber2019w1)
for (col in colnames(DT2[,4:15])) {
  temp=mean(DT2[[col]])
  temp3=rbind(temp3,temp)
}

#w7(374)
DT3=DT[creat_sponsorlist_time >"2019-10-12" & creat_sponsorlist_time <="2019-10-19",]
temp4=mean(DT3$totalnumber2019w1)
for (col in colnames(DT3[,4:15])) {
  temp=mean(DT3[[col]])
  temp4=rbind(temp4,temp)
}

#w8(878)
DT4=DT[creat_sponsorlist_time >"2019-10-19" & creat_sponsorlist_time <="2019-10-26",]
temp5=mean(DT4$totalnumber2019w1)
for (col in colnames(DT4[,4:15])) {
  temp=mean(DT4[[col]])
  temp5=rbind(temp5,temp)
}

#w9(663)
DT5=DT[creat_sponsorlist_time >"2019-10-26" & creat_sponsorlist_time <="2019-11-02",]
temp6=mean(DT5$totalnumber2019w1)
for (col in colnames(DT5[,4:15])) {
  temp=mean(DT5[[col]])
  temp6=rbind(temp6,temp)
}

Wmean=rbind(temp1,temp2,temp3,temp4,temp5,temp6)
Wmean=as.data.table(Wmean)
fwrite(Wmean,"C:/Users/Administrator/Desktop/lucy/合成/Wmean.csv")

Wmean=fread("C:/Users/Administrator/Desktop/lucy/合成/Wmean.csv")

ggplot(Wmean,aes(x=id,y=V1))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =5,linetype = "dashed") +
  geom_vline(xintercept =6,linetype = "dashed") +
  geom_vline(xintercept =7,linetype = "dashed") +
  geom_vline(xintercept =8,linetype = "dashed") +
  geom_vline(xintercept =9,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2019-09-01-2019-11-30)")+
  ylab("Average weekly total number")+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))

