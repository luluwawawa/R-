###
library(data.table)
library(ggplot2)


#1. read table
# for two group(is_maintainer0/1)
A_all=fread("C:/Users/Administrator/Desktop/lucy/合成/A_all.csv")
A_all_panel=fread("C:/Users/Administrator/Desktop/lucy/合成/A_all_panel.csv")

A_all_panel[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
        IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
        PushEvent+PullRequestReviewEvent]
A_all_panel[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]


#2. log
# for all
colnames(A_all_panel)
col_names = colnames(A_all_panel[,3:18])
var_names = paste0("l", col_names)

for (i in c(1:length(col_names))) {
  set(A_all_panel,,var_names[i],log1p(A_all_panel[[col_names[i]]]))
}
## for contribution and free-ride
colnames(A_all_panel)
col_names = colnames(A_all_panel[,53:54])
var_names = paste0("l", col_names)

for (i in c(1:length(col_names))) {
  set(A_all_panel,,var_names[i],log1p(A_all_panel[[col_names[i]]]))
}

# #check log histograms
#histograms
library(car)

#data[sales < 50, hist(sales, breaks = 30)]
par(mfrow=c(3,2))
A_all_panel[ltotalnumber<10,hist(ltotalnumber,breaks=30,col="green",main=)]
box()
A_all_panel[0<ltotalnumber&ltotalnumber<10,hist(ltotalnumber,breaks=30,col="green",main="ltotalnumber(remove 0)")]
box()
A_all_panel[lcontribution<10,hist(lcontribution,breaks=30,col="green")]
box()
A_all_panel[0<lcontribution&lcontribution<10,hist(lcontribution,breaks=30,col="green",main="lcontribution(remove 0)")]
box()
A_all_panel[lfree_ride<10,hist(lfree_ride,breaks=30,col="green")]
box()
A_all_panel[0<lfree_ride&lfree_ride<10,hist(lfree_ride,breaks=30,col="green",main="lfree_ride(remove 0)")]
box()
# # conditional histograms
par(mfrow=c(3,2))
A_all_panel[is_maintainer==0&ltotalnumber<10,hist(ltotalnumber,breaks=30,main="ltotalnumber(is_miantainer=0)",xlab="totalnumber",col="green")]
box()
A_all_panel[is_maintainer==1&ltotalnumber<10,hist(ltotalnumber,breaks=30,main="ltotalnumber(is_miantainer=1)",xlab="totalnumber",col="green")]
box()
A_all_panel[is_maintainer==0&lcontribution<10,hist(lcontribution,breaks=30,main="lcontribution(is_miantainer=0)",xlab="contribution",col="green")]
box()
A_all_panel[is_maintainer==1&lcontribution<10,hist(lcontribution,breaks=30,main="lcontribution(is_miantainer=1)",xlab="contribution",col="green")]
box()
A_all_panel[is_maintainer==0&lfree_ride<10,hist(lfree_ride,breaks=30,main="lfree_ride(is_miantainer=0)",xlab="free_ride",col="green")]
box()
A_all_panel[is_maintainer==1&lfree_ride<10,hist(lfree_ride,breaks=30,main="lfree_ride(is_miantainer=1)",xlab="free_ride",col="green")]
box()



#3. moderator
#(1).received_not
A_all[is_maintainer==1,received_not:=ifelse(first_sponsor_time<="2020-05-31",1,0)] 
A_all[is_maintainer==0,received_not:= 0]
length(A_all[is_maintainer==1,]$user_id) #12336
A_all[,table(received_not)] #1:(8828);0(7621842)


#(2).is user or organization

#(3). moderator3:creat_time
A_all[,as.Date(creat_time)]
A_all[,creat_days:=as.numeric(difftime("2019-05-23",creat_time,units = "days"))]
A_all[,table(creat_days)]
A_all[,hist(creat_days,breaks=30,main="creat_days",xlab="creat_days",col="green")]
box()
A_all[,creat_days_level:=ifelse(creat_days<1000,0,1)] #0(<1000)


#(4): isHireable

#3. for three group(group=0/1/2)
A_all[,T:=is_sponsor+is_maintainer]
A_all[,table(T)]
A_all[,group:=T+is_sponsor]
A_all[,table(group)]  #3:both,2:sponsor,1:miantainer,0:none
A_all_group=A_all[group!=3,]
A_all_group[,table(group)] #2:sponsor,1:miantainer,0:none

#4. caculate mean

#(1) For two groups
#all: A_all , A_all$is_maintainer
#moderator 1: received not
A_all_receive1=A_all[received_not==1,]
A_all_receive0=A_all[received_not==0,]
#moderator 2: is user 
A_all_isuser1=A_all[is_user_or_organization==1,]
A_all_isuser0=A_all[is_user_or_organization==0,]
#moderator 3: is Hireable
A_all_isHireable1=A_all[isHireable==1,]
A_all_isHireable0=A_all[isHireable==0,]
#moderator4:creat_days_level
A_all_creatlong=A_all[creat_days_level==1,]
A_all_creatshort=A_all[creat_days_level==0,]

#(2) For three groups
#all: A_all_group, A_all_group$group
#moderator 1: received not
A_all_group_receive1=A_all_group[received_not==1,]
A_all_receive0=A_all_group[received_not==0,]
#moderator 2: is user 
A_all_group_isuser1=A_all_group[is_user_or_organization==1,]
A_all_group_isuser0=A_all_group[is_user_or_organization==0,]
#moderator 3: is Hireable
A_all_group_isHireable1=A_all_group[isHireable==1,]
A_all_group_isHireable0=A_all_group[isHireable==0,]
#moderator4:creat_days_level
A_all_group_creatlong=A_all_group[creat_days_level==1,]
A_all_group_creatshort=A_all_group[creat_days_level==0,]

colnames(A_all_creatshort)
temp1=tapply(A_all_group_isHireable0$totalnumber_201805,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,3:17])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp1=rbind(temp1,temp)
}
temp2=tapply(A_all_group_isHireable0$totalnumber_201806,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,19:33])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp2=rbind(temp2,temp)
}
temp3=tapply(A_all_group_isHireable0$totalnumber_201807,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,35:49])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp3=rbind(temp3,temp)
}
temp4=tapply(A_all_group_isHireable0$totalnumber_201808,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,51:65])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp4=rbind(temp4,temp)
}
temp5=tapply(A_all_group_isHireable0$totalnumber_201809,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,67:81])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp5=rbind(temp5,temp)
}
temp6=tapply(A_all_group_isHireable0$totalnumber_201810,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,83:97])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp6=rbind(temp6,temp)
}
temp7=tapply(A_all_group_isHireable0$totalnumber_201811,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,99:113])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp7=rbind(temp7,temp)
}
temp8=tapply(A_all_group_isHireable0$totalnumber_201812,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,115:129])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp8=rbind(temp8,temp)
}
temp9=tapply(A_all_group_isHireable0$totalnumber_201901,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,131:145])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp9=rbind(temp9,temp)
}
temp10=tapply(A_all_group_isHireable0$totalnumber_201902,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,147:161])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp10=rbind(temp10,temp)
}
temp11=tapply(A_all_group_isHireable0$totalnumber_201903,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,163:177])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp11=rbind(temp11,temp)
}
temp12=tapply(A_all_group_isHireable0$totalnumber_201904,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,179:193])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp12=rbind(temp12,temp)
}
temp13=tapply(A_all_group_isHireable0$totalnumber_201905,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,195:209])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp13=rbind(temp13,temp)
}
temp14=tapply(A_all_group_isHireable0$totalnumber_201906,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,211:225])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp14=rbind(temp14,temp)
}
temp15=tapply(A_all_group_isHireable0$totalnumber_201907,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,227:241])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp15=rbind(temp15,temp)
}
temp16=tapply(A_all_group_isHireable0$totalnumber_201908,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,243:257])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp16=rbind(temp16,temp)
}
temp17=tapply(A_all_group_isHireable0$totalnumber_201909,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,259:273])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp17=rbind(temp17,temp)
}
temp18=tapply(A_all_group_isHireable0$totalnumber_201910,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,275:289])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp18=rbind(temp18,temp)
}
temp19=tapply(A_all_group_isHireable0$totalnumber_201911,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,291:305])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp19=rbind(temp19,temp)
}
temp20=tapply(A_all_group_isHireable0$totalnumber_201912,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,307:321])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp20=rbind(temp20,temp)
}
temp21=tapply(A_all_group_isHireable0$totalnumber_202001,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,323:337])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp21=rbind(temp21,temp)
}
temp22=tapply(A_all_group_isHireable0$totalnumber_202002,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,339:353])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp22=rbind(temp22,temp)
}
temp23=tapply(A_all_group_isHireable0$totalnumber_202003,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,355:369])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp23=rbind(temp23,temp)
}
temp24=tapply(A_all_group_isHireable0$totalnumber_202004,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,371:385])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp24=rbind(temp24,temp)
}
temp25=tapply(A_all_group_isHireable0$totalnumber_202005,A_all_group_isHireable0$group,mean)
for (col in colnames(A_all_group_isHireable0[,387:401])) {
  temp=tapply(A_all_group_isHireable0[[col]],A_all_group_isHireable0$group,mean)
  temp25=rbind(temp25,temp)
}

group_0=cbind(temp1[,1],temp2[,1],temp3[,1],temp4[,1],temp5[,1],temp6[,1],temp7[,1],temp8[,1],temp9[,1],
              temp10[,1],temp11[,1],temp12[,1],temp13[,1],temp14[,1],temp15[,1],temp16[,1],temp17[,1],temp18[,1],
              temp19[,1],temp20[,1],temp21[,1],temp22[,1],temp23[,1],temp24[,1],temp25[,1])
group_1=cbind(temp1[,2],temp2[,2],temp3[,2],temp4[,2],temp5[,2],temp6[,2],temp7[,2],temp8[,2],temp9[,2],
              temp10[,2],temp11[,2],temp12[,2],temp13[,2],temp14[,2],temp15[,2],temp16[,2],temp17[,2],temp18[,2],
              temp19[,2],temp20[,2],temp21[,2],temp22[,2],temp23[,2],temp24[,2],temp25[,2])
group_2=cbind(temp1[,3],temp2[,3],temp3[,3],temp4[,3],temp5[,3],temp6[,3],temp7[,3],temp8[,3],temp9[,3],
              temp10[,3],temp11[,3],temp12[,3],temp13[,3],temp14[,3],temp15[,3],temp16[,3],temp17[,3],temp18[,3],
              temp19[,3],temp20[,3],temp21[,3],temp22[,3],temp23[,3],temp24[,3],temp25[,3])

group_0=t(group_0)
group_1=t(group_1)
group_2=t(group_2)
group_0=as.data.table(group_0)
group_1=as.data.table(group_1)
group_2=as.data.table(group_2)
fwrite(group_0,"C:/Users/Administrator/Desktop/lucy/合成/group_0.csv")
fwrite(group_1,"C:/Users/Administrator/Desktop/lucy/合成/group_1.csv")
fwrite(group_2,"C:/Users/Administrator/Desktop/lucy/合成/group_2.csv")

# 3. ggplot
#### for three group
group3_creatlevel_all=fread("C:/Users/Administrator/Desktop/lucy/mean/group3_creatlevel_all.csv")
group3_isHireable_all=fread("C:/Users/Administrator/Desktop/lucy/mean/group3_isHireable_all.csv")

colnames(group3_isHireable_all)
group3_isHireable_all[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
                     IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
                     PushEvent+PullRequestReviewEvent]
#free-ride variable
group3_isHireable_all[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]

##ggplot tiem seriers
group3_isHireable_all$received[is.na(group3_isHireable_all$received)]=2
group3_isHireable_all[,Type:=ifelse(group==0,"non-participate",ifelse(group==1,"Maintainer","Sponsor"))]
group3_isHireable_all[,can_be_hire:=ifelse(isHireable==0,"is not hireable","is hireable")]
                                          
#group3_receive_all[,date:=as.Date(paste(year,month,"01",sep ="-"),"%Y-%m-%d")]
#as.yearmon(group3_receive_all$date)
#group3_receive_all$date=as.Date(group3_receive_all$date,"%m/%d%y")
# group3_receive_all$Type=factor(group3_receive_all$Type)

#1:75(All);76:150(0);151:225(1)
p1=ggplot(group3_isHireable_all[1:75],aes(x=id,y=contribution))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dashed","dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly contribution")+facet_wrap(~can_be_hire)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
p2=ggplot(group3_isHireable_all[76:150],aes(x=id,y=contribution))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dashed","dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly contribution")+facet_wrap(~can_be_hire)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
p3=ggplot(group3_creatlevel_all[151:225],aes(x=id,y=contribution))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dashed","dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly contribution")+facet_wrap(~receive_money)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
library(gridExtra)
#安装ggpubr时，会依赖于该包
grid.arrange(p1,p2,p3,ncol=3,nrow=1) 


######for two group
group2_creatlevel_all=fread("C:/Users/Administrator/Desktop/lucy/mean/group2_creatlevel_all.csv")
group2_isHireable_all=fread("C:/Users/Administrator/Desktop/lucy/mean/group2_isHireable_all.csv")

colnames(group2_isHireable_all)
group2_isHireable_all[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
                     IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
                     PushEvent+PullRequestReviewEvent]
#free-ride variable
group2_isHireable_all[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]

##ggplot tiem seriers
group2_isHireable_all[,Type:=ifelse(is_maintainer==0,"non-participate","Maintainer")]
group2_isHireable_all[,receive_money:=ifelse(isHireable==0,"is not hireable","is hireable")]


#1:50(All);51:100(0);101:150(1)
p1=ggplot(group2_isHireable_all[1:50],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly totalnumber")+facet_wrap(~receive_money)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
p2=ggplot(group2_isHireable_all[51:100],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly totalnumber")+facet_wrap(~receive_money)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
p3=ggplot(group2_isHireable_all[101:150],aes(x=id,y=free_ride))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dotted","solid"))+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly free_ride")+facet_wrap(~receive_money)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
library(gridExtra)
#安装ggpubr时，会依赖于该包
grid.arrange(p1,p2,p3,ncol=3,nrow=1) 


# 4. check the increase of new users

B=wide_final[creat_time >"2018-05-01" & creat_time<="2019-05-23",]  # before shock (4449538 users)
C=wide_final[creat_time>"2019-05-23",]  # after shock (5650210 users)

temp1=length(unique(wide_final[creat_time >"2018-05-01" & creat_time<="2018-06-01",]$login))
temp2=length(unique(wide_final[creat_time >"2018-06-01" & creat_time<="2018-07-01",]$login))
temp3=length(unique(wide_final[creat_time >"2018-07-01" & creat_time<="2018-08-01",]$login))
temp4=length(unique(wide_final[creat_time >"2018-08-01" & creat_time<="2018-09-01",]$login))
temp5=length(unique(wide_final[creat_time >"2018-09-01" & creat_time<="2018-10-01",]$login))                
temp6=length(unique(wide_final[creat_time >"2018-10-01" & creat_time<="2018-11-01",]$login)) 
temp7=length(unique(wide_final[creat_time >"2018-11-01" & creat_time<="2018-12-01",]$login)) 
temp8=length(unique(wide_final[creat_time >"2018-12-01" & creat_time<="2019-01-01",]$login)) 
temp9=length(unique(wide_final[creat_time >"2019-01-01" & creat_time<="2019-02-01",]$login)) 
temp10=length(unique(wide_final[creat_time >"2019-02-01" & creat_time<="2019-03-01",]$login)) 
temp11=length(unique(wide_final[creat_time >"2019-03-01" & creat_time<="2019-04-01",]$login)) 
temp12=length(unique(wide_final[creat_time >"2019-04-01" & creat_time<="2019-05-01",]$login)) 
temp13=length(unique(wide_final[creat_time >"2019-05-01" & creat_time<="2019-06-01",]$login)) 
temp14=length(unique(wide_final[creat_time >"2019-06-01" & creat_time<="2019-07-01",]$login)) 
temp15=length(unique(wide_final[creat_time >"2019-07-01" & creat_time<="2019-08-01",]$login)) 
temp16=length(unique(wide_final[creat_time >"2019-08-01" & creat_time<="2019-09-01",]$login)) 
temp17=length(unique(wide_final[creat_time >"2019-09-01" & creat_time<="2019-10-01",]$login)) 
temp18=length(unique(wide_final[creat_time >"2019-10-01" & creat_time<="2019-11-01",]$login)) 
temp19=length(unique(wide_final[creat_time >"2019-11-01" & creat_time<="2019-12-01",]$login)) 
temp20=length(unique(wide_final[creat_time >"2019-12-01" & creat_time<="2020-01-01",]$login)) 
temp21=length(unique(wide_final[creat_time >"2020-01-01" & creat_time<="2020-02-01",]$login)) 
temp22=length(unique(wide_final[creat_time >"2020-02-01" & creat_time<="2020-03-01",]$login)) 
temp23=length(unique(wide_final[creat_time >"2020-03-01" & creat_time<="2020-04-01",]$login)) 
temp24=length(unique(wide_final[creat_time >"2020-04-01" & creat_time<="2020-05-01",]$login)) 

data=rbind(temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12,
           temp13,temp14,temp15,temp16,temp17,temp18,temp19,temp20,temp21,temp22,temp23,
           temp24)
data=as.data.table(data)
data=fread("C:/Users/Administrator/Desktop/lucy/合成/data.csv")

ggplot(data,aes(x=id,y=V1))+
  geom_point(colour="red",size=2)+
  geom_line(colour="blue")+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Monthly new users")+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))


## 5.all events
mean_all=fread("C:/Users/Administrator/Desktop/lucy/mean/mean(all).csv")
mean_all$events=factor(mean_all$events)
ggplot(mean_all,aes(x=id,y=number_all))+
  geom_point(aes(color=events),size=1.08)+
  geom_line(aes(color=events),size=1.08)+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Monthly average number")+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))


# 6. check montly increased maintainer
A_all=fread("C:/Users/Administrator/Desktop/lucy/合成/A_all.csv")
colnames(A_all)
summary(A_all$creat_sponsorlist_time)
max(A_all$creat_sponsorlist_time) # "2022-04-19T14:23:04Z"
min(A_all$creat_sponsorlist_time)

A_all[,as.Date(creat_sponsorlist_time)]
temp13=length(unique(A_all[creat_sponsorlist_time >"2019-05-01" & creat_sponsorlist_time<="2019-06-01",]$login)) 
temp14=length(unique(A_all[creat_sponsorlist_time >"2019-06-01" & creat_sponsorlist_time<="2019-07-01",]$login)) 
temp15=length(unique(A_all[creat_sponsorlist_time >"2019-07-01" & creat_sponsorlist_time<="2019-08-01",]$login)) 
temp16=length(unique(A_all[creat_sponsorlist_time >"2019-08-01" & creat_sponsorlist_time<="2019-09-01",]$login)) 
temp17=length(unique(A_all[creat_sponsorlist_time >"2019-09-01" & creat_sponsorlist_time<="2019-10-01",]$login)) 
temp18=length(unique(A_all[creat_sponsorlist_time >"2019-10-01" & creat_sponsorlist_time<="2019-11-01",]$login)) 
temp19=length(unique(A_all[creat_sponsorlist_time >"2019-11-01" & creat_sponsorlist_time<="2019-12-01",]$login)) 
temp20=length(unique(A_all[creat_sponsorlist_time >"2019-12-01" & creat_sponsorlist_time<="2020-01-01",]$login)) 
temp21=length(unique(A_all[creat_sponsorlist_time >"2020-01-01" & creat_sponsorlist_time<="2020-02-01",]$login)) 
temp22=length(unique(A_all[creat_sponsorlist_time >"2020-02-01" & creat_sponsorlist_time<="2020-03-01",]$login)) 
temp23=length(unique(A_all[creat_sponsorlist_time >"2020-03-01" & creat_sponsorlist_time<="2020-04-01",]$login)) 
temp24=length(unique(A_all[creat_sponsorlist_time >"2020-04-01" & creat_sponsorlist_time<="2020-05-01",]$login)) 
temp25=length(unique(A_all[creat_sponsorlist_time >"2020-05-01" & creat_sponsorlist_time<="2020-06-01",]$login)) 

data1=rbind(temp13,temp14,temp15,temp16,temp17,temp18,temp19,temp20,temp21,temp22,temp23,
           temp24,temp25)
data1=as.data.table(data1)
date=c("2019-05","2019-06","2019-07","2019-08","2019-09","2019-10",
       "2019-11","2019-12","2020-01","2020-02","2020-03","2020-04","2020-05")
date=as.data.table(date)
data1=cbind(date,data1)

ggplot(data,aes(x=date,y=V1,group=1))+
  geom_point(colour="red",size=2)+
  geom_line(colour="blue")+
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2019.05-2020.05)")+
  ylab("Monthly new maintainers")+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))

# # for all users
wide_final=fread("C:/Users/Administrator/Desktop/lucy/合成/wide_final.csv")

temp13=length(unique(B[creat_sponsorlist_time >"2019-05-01" & creat_sponsorlist_time<="2019-06-01",]$login)) 
temp14=length(unique(B[creat_sponsorlist_time >"2019-06-01" & creat_sponsorlist_time<="2019-07-01",]$login)) 
temp15=length(unique(B[creat_sponsorlist_time >"2019-07-01" & creat_sponsorlist_time<="2019-08-01",]$login)) 
temp16=length(unique(B[creat_sponsorlist_time >"2019-08-01" & creat_sponsorlist_time<="2019-09-01",]$login)) 
temp17=length(unique(B[creat_sponsorlist_time >"2019-09-01" & creat_sponsorlist_time<="2019-10-01",]$login)) 
temp18=length(unique(B[creat_sponsorlist_time >"2019-10-01" & creat_sponsorlist_time<="2019-11-01",]$login)) 
temp19=length(unique(B[creat_sponsorlist_time >"2019-11-01" & creat_sponsorlist_time<="2019-12-01",]$login)) 
temp20=length(unique(B[creat_sponsorlist_time >"2019-12-01" & creat_sponsorlist_time<="2020-01-01",]$login)) 
temp21=length(unique(B[creat_sponsorlist_time >"2020-01-01" & creat_sponsorlist_time<="2020-02-01",]$login)) 
temp22=length(unique(B[creat_sponsorlist_time >"2020-02-01" & creat_sponsorlist_time<="2020-03-01",]$login)) 
temp23=length(unique(B[creat_sponsorlist_time >"2020-03-01" & creat_sponsorlist_time<="2020-04-01",]$login)) 
temp24=length(unique(B[creat_sponsorlist_time >"2020-04-01" & creat_sponsorlist_time<="2020-05-01",]$login)) 
temp25=length(unique(B[creat_sponsorlist_time >"2020-05-01" & creat_sponsorlist_time<="2020-06-01",]$login)) 

data2=rbind(temp13,temp14,temp15,temp16,temp17,temp18,temp19,temp20,temp21,temp22,temp23,
           temp24,temp25)
data2=as.data.table(data2)
date=c("2019-05","2019-06","2019-07","2019-08","2019-09","2019-10",
       "2019-11","2019-12","2020-01","2020-02","2020-03","2020-04","2020-05")
date=as.data.table(date)
data2=cbind(date,data2)

ggplot(me,aes(x=id1,y=V1))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  scale_linetype_manual(values=c("dashed","dotted","solid"))+
  geom_vline(xintercept =1,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=13,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=13,face="plain"))+
  theme(axis.text=element_text(colour="black",size=13,face="plain"))+
  xlab("date(2019.05-2020.05)")+
  ylab("Monthly new increased maintainers")+
  theme(strip.text.x=element_text(colour="black",size=13,face="plain"))



