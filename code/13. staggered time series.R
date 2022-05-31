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

# 3.classify maintainers according to "creat_sponsorlist_time"
max(A_all$creat_sponsorlist_time)  # "2022-04-19T14:23:04Z"
min(A_all$creat_sponsorlist_time)

#3.1 for two groups(did not filter out any develpoers,only consider is maintainer=0/1)
# 2019-05(25)
length(unique(A_all[creat_sponsorlist_time >"2019-05-01" & creat_sponsorlist_time<="2019-06-01"&is_maintainer==1,]$login)) #25
A_all_temp1=A_all[creat_sponsorlist_time >"2019-05-01" & creat_sponsorlist_time<="2019-06-01"&is_maintainer==1,]
# 2019-06(14)
length(unique(A_all[creat_sponsorlist_time >"2019-06-01" & creat_sponsorlist_time<="2019-07-01"&is_maintainer==1,]$login)) 
A_all_temp2=A_all[creat_sponsorlist_time >"2019-06-01" & creat_sponsorlist_time<="2019-07-01"&is_maintainer==1,]
# 2019-07(15)
length(unique(A_all[creat_sponsorlist_time >"2019-07-01" & creat_sponsorlist_time<="2019-08-01"&is_maintainer==1,]$login)) 
A_all_temp3=A_all[creat_sponsorlist_time >"2019-07-01" & creat_sponsorlist_time<="2019-08-01"&is_maintainer==1,]
# 2019-08(19)
length(unique(A_all[creat_sponsorlist_time >"2019-08-01" & creat_sponsorlist_time<="2019-09-01"&is_maintainer==1,]$login)) 
A_all_temp4=A_all[creat_sponsorlist_time >"2019-08-01" & creat_sponsorlist_time<="2019-09-01"&is_maintainer==1,]
# 2019-09(96)
length(unique(A_all[creat_sponsorlist_time >"2019-09-01" & creat_sponsorlist_time<="2019-10-01"&is_maintainer==1,]$login)) 
A_all_temp5=A_all[creat_sponsorlist_time >"2019-09-01" & creat_sponsorlist_time<="2019-10-01"&is_maintainer==1,]
# 2019-10(2415)
length(unique(A_all[creat_sponsorlist_time >"2019-10-01" & creat_sponsorlist_time<="2019-11-01"&is_maintainer==1,]$login)) 
A_all_temp6=A_all[creat_sponsorlist_time >"2019-10-01" & creat_sponsorlist_time<="2019-11-01"&is_maintainer==1,]
# 2019-11(907)
length(unique(A_all[creat_sponsorlist_time >"2019-11-01" & creat_sponsorlist_time<="2019-12-01"&is_maintainer==1,]$login)) 
A_all_temp7=A_all[creat_sponsorlist_time >"2019-11-01" & creat_sponsorlist_time<="2019-12-01"&is_maintainer==1,]
# 2019-12(336)
length(unique(A_all[creat_sponsorlist_time >"2019-12-01" & creat_sponsorlist_time<="2020-01-01"&is_maintainer==1,]$login)) 
A_all_temp8=A_all[creat_sponsorlist_time >"2019-12-01" & creat_sponsorlist_time<="2020-01-01"&is_maintainer==1,]
# 2020-01(378)
length(unique(A_all[creat_sponsorlist_time >"2020-01-01" & creat_sponsorlist_time<="2020-02-01"&is_maintainer==1,]$login)) 
A_all_temp9=A_all[creat_sponsorlist_time >"2020-01-01" & creat_sponsorlist_time<="2020-02-01"&is_maintainer==1,]
# 2020-02(352)
length(unique(A_all[creat_sponsorlist_time >"2020-02-01" & creat_sponsorlist_time<="2020-03-01"&is_maintainer==1,]$login)) 
A_all_temp10=A_all[creat_sponsorlist_time >"2020-02-01" & creat_sponsorlist_time<="2020-03-01"&is_maintainer==1,]
# 2020-03(311)
length(unique(A_all[creat_sponsorlist_time >"2020-03-01" & creat_sponsorlist_time<="2020-04-01"&is_maintainer==1,]$login)) 
A_all_temp11=A_all[creat_sponsorlist_time >"2020-03-01" & creat_sponsorlist_time<="2020-04-01"&is_maintainer==1,]
# 2020-04(452)
length(unique(A_all[creat_sponsorlist_time >"2020-04-01" & creat_sponsorlist_time<="2020-05-01"&is_maintainer==1,]$login)) 
A_all_temp12=A_all[creat_sponsorlist_time >"2020-04-01" & creat_sponsorlist_time<="2020-05-01"&is_maintainer==1,]
# 2020-05(599)
length(unique(A_all[creat_sponsorlist_time >"2020-05-01" & creat_sponsorlist_time<="2020-06-01"&is_maintainer==1,]$login)) 
A_all_temp13=A_all[creat_sponsorlist_time >"2020-05-01" & creat_sponsorlist_time<="2020-06-01"&is_maintainer==1,]


# 4.check different groups of maintainers(mean)

temp1=tapply(A_all_temp13$totalnumber_201805,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,3:17])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp1=rbind(temp1,temp)
}
temp2=tapply(A_all_temp13$totalnumber_201806,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,19:33])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp2=rbind(temp2,temp)
}
temp3=tapply(A_all_temp13$totalnumber_201807,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,35:49])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp3=rbind(temp3,temp)
}
temp4=tapply(A_all_temp13$totalnumber_201808,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,51:65])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp4=rbind(temp4,temp)
}
temp5=tapply(A_all_temp13$totalnumber_201809,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,67:81])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp5=rbind(temp5,temp)
}
temp6=tapply(A_all_temp13$totalnumber_201810,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,83:97])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp6=rbind(temp6,temp)
}
temp7=tapply(A_all_temp13$totalnumber_201811,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,99:113])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp7=rbind(temp7,temp)
}
temp8=tapply(A_all_temp13$totalnumber_201812,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,115:129])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp8=rbind(temp8,temp)
}
temp9=tapply(A_all_temp13$totalnumber_201901,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,131:145])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp9=rbind(temp9,temp)
}
temp10=tapply(A_all_temp13$totalnumber_201902,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,147:161])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp10=rbind(temp10,temp)
}
temp11=tapply(A_all_temp13$totalnumber_201903,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,163:177])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp11=rbind(temp11,temp)
}
temp12=tapply(A_all_temp13$totalnumber_201904,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,179:193])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp12=rbind(temp12,temp)
}
temp13=tapply(A_all_temp13$totalnumber_201905,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,195:209])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp13=rbind(temp13,temp)
}
temp14=tapply(A_all_temp13$totalnumber_201906,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,211:225])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp14=rbind(temp14,temp)
}
temp15=tapply(A_all_temp13$totalnumber_201907,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,227:241])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp15=rbind(temp15,temp)
}
temp16=tapply(A_all_temp13$totalnumber_201908,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,243:257])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp16=rbind(temp16,temp)
}
temp17=tapply(A_all_temp13$totalnumber_201909,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,259:273])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp17=rbind(temp17,temp)
}
temp18=tapply(A_all_temp13$totalnumber_201910,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,275:289])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp18=rbind(temp18,temp)
}
temp19=tapply(A_all_temp13$totalnumber_201911,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,291:305])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp19=rbind(temp19,temp)
}
temp20=tapply(A_all_temp13$totalnumber_201912,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,307:321])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp20=rbind(temp20,temp)
}
temp21=tapply(A_all_temp13$totalnumber_202001,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,323:337])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp21=rbind(temp21,temp)
}
temp22=tapply(A_all_temp13$totalnumber_202002,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,339:353])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp22=rbind(temp22,temp)
}
temp23=tapply(A_all_temp13$totalnumber_202003,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,355:369])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp23=rbind(temp23,temp)
}
temp24=tapply(A_all_temp13$totalnumber_202004,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,371:385])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp24=rbind(temp24,temp)
}
temp25=tapply(A_all_temp13$totalnumber_202005,A_all_temp13$is_maintainer,mean)
for (col in colnames(A_all_temp13[,387:401])) {
  temp=tapply(A_all_temp13[[col]],A_all_temp13$is_maintainer,mean)
  temp25=rbind(temp25,temp)
}

is_maintainer_1=cbind(temp1[,1],temp2[,1],temp3[,1],temp4[,1],temp5[,1],temp6[,1],temp7[,1],temp8[,1],temp9[,1],
              temp10[,1],temp11[,1],temp12[,1],temp13[,1],temp14[,1],temp15[,1],temp16[,1],temp17[,1],temp18[,1],
              temp19[,1],temp20[,1],temp21[,1],temp22[,1],temp23[,1],temp24[,1],temp25[,1])

is_maintainer_1=t(is_maintainer_1)
is_maintainer_1=as.data.table(is_maintainer_1)

fwrite(is_maintainer_1,"C:/Users/Administrator/Desktop/lucy/合成/is_maintainer_1.csv")
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

# 5.ggplot-group2
group2_different_sponosrtime=fread("C:/Users/Administrator/Desktop/lucy/mean/group2_different_sponosrtime.csv")
group2_different_sponosrtime[,Type:=ifelse(type==13,"join in 2019-05",ifelse(type==14,"join in 2019-06",ifelse(type==15,"join in 2019-07",
                                                                                                              ifelse(type==16,"join in 2019-08",
                                                                                                                     ifelse(type==17,"join in 2019-09",
                                                                                                                            ifelse(type==18,"join in 2019-10",
                                                                                                                                   ifelse(type==19,"join in 2019-11",
                                                                                                                                          ifelse(type==20,"join in 2019-12",
                                                                                                                                                 ifelse(type==21,"join in 2020-01",
                                                                                                                                                        ifelse(type==22,"join in 2020-02",
                                                                                                                                                               ifelse(type==23,"join in 2020-03",
                                                                                                                                                                      ifelse(type==24,"join in 2020-04","join in 2020-05"
                                                                                                                                                                       ))))))))))))]

group2_different_sponosrtime[,contribution:= PullRequestEvent+CommitCommentEvent+GollumEvent+CreateEvent+
                        IssuesEvent+ReleaseEvent+IssueCommentEvent+PullRequestReviewCommentEvent+
                        PushEvent+PullRequestReviewEvent]
#free-ride variable
group2_different_sponosrtime[,free_ride:=ForkEvent+PublicEvent+MemberEvent+DeleteEvent+WatchEvent]
ggplot(group2_different_sponosrtime,aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))

#2019-05
ggplot(group2_different_sponosrtime[1:25],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =13,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2019-06
ggplot(group2_different_sponosrtime[26:50],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =14,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2019-07
ggplot(group2_different_sponosrtime[51:75],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =15,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2019-08
ggplot(group2_different_sponosrtime[76:100],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =16,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2019-09
ggplot(group2_different_sponosrtime[101:125],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =17,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2019-10
ggplot(group2_different_sponosrtime[126:150],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =18,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2019-11
ggplot(group2_different_sponosrtime[151:175],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =19,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2019-12
ggplot(group2_different_sponosrtime[176:200],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =20,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2020-01
ggplot(group2_different_sponosrtime[201:225],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =21,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2020-02
ggplot(group2_different_sponosrtime[226:250],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =22,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2020-03
ggplot(group2_different_sponosrtime[251:275],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =23,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2020-04
ggplot(group2_different_sponosrtime[276:300],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =24,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))
#2020-05
ggplot(group2_different_sponosrtime[301:325],aes(x=id,y=totalnumber))+
  geom_point(aes(color=Type),size=1.08)+
  geom_line(aes(linetype=Type,color=Type),size=1.08)+
  geom_vline(xintercept =25,linetype = "dashed") +
  theme_bw()+
  theme(axis.title.x=element_text(colour="black",size=11,face="plain"))+
  theme(axis.title.y=element_text(colour="black",size=12,face="plain"))+
  theme(axis.text=element_text(colour="black",size=12,face="plain"))+
  xlab("date(2018.05-2020.05)")+
  ylab("Average Monthly total number")+facet_wrap(~Type)+
  theme(strip.text.x=element_text(colour="black",size=12,face="plain"))

