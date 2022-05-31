# 1.read data
A_all=fread("C:/Users/Administrator/Desktop/lucy/合成/A_all.csv")
A_all_panel=fread("C:/Users/Administrator/Desktop/lucy/合成/A_all_panel.csv")

A_all_panel[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
              IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
              PushEvent+PullRequestReviewEvent]
A_all_panel[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]

# 2. filter data
A_all[,table(is_user_or_organization)] #0:org:135869;1:user:7494801;2:1421754 
colnames(A_all)
A_all[,T:=is_sponsor+is_maintainer]
A_all[,table(T)]
A_all[,group:=T+is_sponsor]
A_all[,table(group)]  #3:both(1678),2:sponsor(17932),1:miantainer(10658),0:none(7600402)
length(unique(A_all[is_maintainer==1,]$login))  #12336

A_all= A_all[is_user_or_organization!=2,]

A_all[creat_sponsorlist_time]

# 3. changing the shock time
A_all_temp=A_all[creat_sponsorlist_time >"2019-10-01" & is_maintainer==1,]

temp1=tapply(A_all_temp$totalnumber_201805,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,3:17])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp1=rbind(temp1,temp)
}
temp2=tapply(A_all_temp$totalnumber_201806,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,19:33])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp2=rbind(temp2,temp)
}
temp3=tapply(A_all_temp$totalnumber_201807,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,35:49])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp3=rbind(temp3,temp)
}
temp4=tapply(A_all_temp$totalnumber_201808,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,51:65])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp4=rbind(temp4,temp)
}
temp5=tapply(A_all_temp$totalnumber_201809,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,67:81])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp5=rbind(temp5,temp)
}
temp6=tapply(A_all_temp$totalnumber_201810,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,83:97])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp6=rbind(temp6,temp)
}
temp7=tapply(A_all_temp$totalnumber_201811,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,99:113])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp7=rbind(temp7,temp)
}
temp8=tapply(A_all_temp$totalnumber_201812,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,115:129])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp8=rbind(temp8,temp)
}
temp9=tapply(A_all_temp$totalnumber_201901,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,131:145])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp9=rbind(temp9,temp)
}
temp10=tapply(A_all_temp$totalnumber_201902,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,147:161])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp10=rbind(temp10,temp)
}
temp11=tapply(A_all_temp$totalnumber_201903,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,163:177])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp11=rbind(temp11,temp)
}
temp12=tapply(A_all_temp$totalnumber_201904,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,179:193])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp12=rbind(temp12,temp)
}
temp13=tapply(A_all_temp$totalnumber_201905,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,195:209])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp13=rbind(temp13,temp)
}
temp14=tapply(A_all_temp$totalnumber_201906,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,211:225])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp14=rbind(temp14,temp)
}
temp15=tapply(A_all_temp$totalnumber_201907,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,227:241])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp15=rbind(temp15,temp)
}
temp16=tapply(A_all_temp$totalnumber_201908,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,243:257])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp16=rbind(temp16,temp)
}
temp17=tapply(A_all_temp$totalnumber_201909,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,259:273])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp17=rbind(temp17,temp)
}
temp18=tapply(A_all_temp$totalnumber_201910,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,275:289])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp18=rbind(temp18,temp)
}
temp19=tapply(A_all_temp$totalnumber_201911,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,291:305])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp19=rbind(temp19,temp)
}
temp20=tapply(A_all_temp$totalnumber_201912,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,307:321])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp20=rbind(temp20,temp)
}
temp21=tapply(A_all_temp$totalnumber_202001,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,323:337])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp21=rbind(temp21,temp)
}
temp22=tapply(A_all_temp$totalnumber_202002,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,339:353])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp22=rbind(temp22,temp)
}
temp23=tapply(A_all_temp$totalnumber_202003,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,355:369])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp23=rbind(temp23,temp)
}
temp24=tapply(A_all_temp$totalnumber_202004,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,371:385])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp24=rbind(temp24,temp)
}
temp25=tapply(A_all_temp$totalnumber_202005,A_all_temp$is_maintainer,mean)
for (col in colnames(A_all_temp[,387:401])) {
  temp=tapply(A_all_temp[[col]],A_all_temp$is_maintainer,mean)
  temp25=rbind(temp25,temp)
}

is_maintainer_1=cbind(temp1[,1],temp2[,1],temp3[,1],temp4[,1],temp5[,1],temp6[,1],temp7[,1],temp8[,1],temp9[,1],
                      temp10[,1],temp11[,1],temp12[,1],temp13[,1],temp14[,1],temp15[,1],temp16[,1],temp17[,1],temp18[,1],
                      temp19[,1],temp20[,1],temp21[,1],temp22[,1],temp23[,1],temp24[,1],temp25[,1])

is_maintainer_1=t(is_maintainer_1)
is_maintainer_1=as.data.table(is_maintainer_1)

fwrite(is_maintainer_1,"C:/Users/Administrator/Desktop/lucy/合成/is_maintainer_1.csv")


# 4. ggplot
mean=fread("C:/Users/Administrator/Desktop/lucy/mean/group2_2019.10.csv")
mean[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
                               IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
                               PushEvent+PullRequestReviewEvent]
#free-ride variable
mean[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]
ggplot(mean,aes(x=id,y=ReleaseEvent))+
  geom_point(size=1.08)+
  geom_line(size=1.08)+
  geom_vline(xintercept =18,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))


# # only consider the maintainer
# 1.group2 
group3_mean=fread("C:/Users/Administrator/Desktop/lucy/mean/group3_mean.csv")
group3_mean[,Type:=ifelse(group==0,"non-participate",ifelse(group==1,"Maintainer","Sponsor"))]

ggplot(group3_mean[group==2,],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(color=Type),size=1.08)+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))+
  geom_vline(xintercept =18,linetype = "solid") 















