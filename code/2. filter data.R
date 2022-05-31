# # filter data for regression
library(data.table)

# # 1. read table 
wide_final=fread("C:/Users/Administrator/Desktop/lucy/合成/wide_final.csv")
colnames(wide_final)[402:435]

# # 2.filter users using creat acount time
length(unique(wide_final$login))  # # 19152174 users
as.Date(wide_final$creat_time)
A=wide_final[creat_time<="2018-05-01",]  # # before research period (9052426 users)
B=wide_final[creat_time >"2018-05-01" & creat_time<="2019-05-23",]  # before shock (4449538 users)
C=wide_final[creat_time>"2019-05-23",]  # after shock (5650210 users)

# # 3. based on A, filter users using is_user_or_organization
A[,table(is_user_or_organization)]  #1：user,0:org;2:other

A_user=A[is_user_or_organization==1,]
A_org=A[is_user_or_organization==0,]

# # 4. save 
fwrite(A,"C:/Users/Administrator/Desktop/lucy/合成/A_all.csv")
fwrite(A_user,"C:/Users/Administrator/Desktop/lucy/合成/A_user.csv")
fwrite(A_org,"C:/Users/Administrator/Desktop/lucy/合成/A_org.csv")

# # 










A$role=ifelse(A$is_maintainer==1 & A$is_sponsor==1,yes=1,no=0)
length(A[is_maintainer==1,]$login)  ##12336个Maintainer
length(A[is_sponsor==1,]$login)     ##19610个sponosr
length(A[role==1,]$login)          # #1678个即是sponosr 又是maintainer
# # 分析单纯的maintainer
a1=A[is_maintainer==1 & role==0,c(mean(totalnumber_201805),mean(totalnumber_201806),mean(totalnumber_201807),mean(totalnumber_201808),
                               mean(totalnumber_201809),mean(totalnumber_201810),mean(totalnumber_201811),mean(totalnumber_201812),
                               mean(totalnumber_201901),mean(totalnumber_201902),mean(totalnumber_201903),mean(totalnumber_201904),
                               mean(totalnumber_201905),mean(totalnumber_201906),mean(totalnumber_201907),mean(totalnumber_201908),
                               mean(totalnumber_201909),mean(totalnumber_201910),mean(totalnumber_201911),mean(totalnumber_201912),
                               mean(totalnumber_202001),mean(totalnumber_202002),mean(totalnumber_202003),mean(totalnumber_202004),
                               mean(totalnumber_202005))]
a2=A[is_sponsor==1 & role==0,c(mean(totalnumber_201805),mean(totalnumber_201806),mean(totalnumber_201807),mean(totalnumber_201808),
                               mean(totalnumber_201809),mean(totalnumber_201810),mean(totalnumber_201811),mean(totalnumber_201812),
                               mean(totalnumber_201901),mean(totalnumber_201902),mean(totalnumber_201903),mean(totalnumber_201904),
                               mean(totalnumber_201905),mean(totalnumber_201906),mean(totalnumber_201907),mean(totalnumber_201908),
                               mean(totalnumber_201909),mean(totalnumber_201910),mean(totalnumber_201911),mean(totalnumber_201912),
                               mean(totalnumber_202001),mean(totalnumber_202002),mean(totalnumber_202003),mean(totalnumber_202004),
                               mean(totalnumber_202005))]
a3=A[role==1,c(mean(totalnumber_201805),mean(totalnumber_201806),mean(totalnumber_201807),mean(totalnumber_201808),
                            mean(totalnumber_201809),mean(totalnumber_201810),mean(totalnumber_201811),mean(totalnumber_201812),
                            mean(totalnumber_201901),mean(totalnumber_201902),mean(totalnumber_201903),mean(totalnumber_201904),
                            mean(totalnumber_201905),mean(totalnumber_201906),mean(totalnumber_201907),mean(totalnumber_201908),
                            mean(totalnumber_201909),mean(totalnumber_201910),mean(totalnumber_201911),mean(totalnumber_201912),
                            mean(totalnumber_202001),mean(totalnumber_202002),mean(totalnumber_202003),mean(totalnumber_202004),
                            mean(totalnumber_202005))]
a4=A[is_maintainer==0 & is_sponsor==0,c(mean(totalnumber_201805),mean(totalnumber_201806),mean(totalnumber_201807),mean(totalnumber_201808),
            mean(totalnumber_201809),mean(totalnumber_201810),mean(totalnumber_201811),mean(totalnumber_201812),
            mean(totalnumber_201901),mean(totalnumber_201902),mean(totalnumber_201903),mean(totalnumber_201904),
            mean(totalnumber_201905),mean(totalnumber_201906),mean(totalnumber_201907),mean(totalnumber_201908),
            mean(totalnumber_201909),mean(totalnumber_201910),mean(totalnumber_201911),mean(totalnumber_201912),
            mean(totalnumber_202001),mean(totalnumber_202002),mean(totalnumber_202003),mean(totalnumber_202004),
            mean(totalnumber_202005))]
mean=data.table(a1,a2,a3,a4)
# # 基本看出；financail incentive 会增加Maintainer AND sPONOSR的参与，其他人基本不受影响。
str(A$first_sponsor_time)

length(A[is_maintainer==1 & first_sponsor_time<="2020-05-30",]$login) # # 8823
a5=A[is_maintainer==1 & first_sponsor_time<="2020-05-30",c(mean(totalnumber_201805),mean(totalnumber_201806),mean(totalnumber_201807),mean(totalnumber_201808),
                                        mean(totalnumber_201809),mean(totalnumber_201810),mean(totalnumber_201811),mean(totalnumber_201812),
                                        mean(totalnumber_201901),mean(totalnumber_201902),mean(totalnumber_201903),mean(totalnumber_201904),
                                        mean(totalnumber_201905),mean(totalnumber_201906),mean(totalnumber_201907),mean(totalnumber_201908),
                                        mean(totalnumber_201909),mean(totalnumber_201910),mean(totalnumber_201911),mean(totalnumber_201912),
                                        mean(totalnumber_202001),mean(totalnumber_202002),mean(totalnumber_202003),mean(totalnumber_202004),
                                        mean(totalnumber_202005))]
a5
length(A[is_maintainer==1 & first_sponsor_time >"2020-05-30",]$login) # #3513
a6=A[is_maintainer==1 & first_sponsor_time > "2020-05-30",c(mean(totalnumber_201805),mean(totalnumber_201806),mean(totalnumber_201807),mean(totalnumber_201808),
                                                           mean(totalnumber_201809),mean(totalnumber_201810),mean(totalnumber_201811),mean(totalnumber_201812),
                                                           mean(totalnumber_201901),mean(totalnumber_201902),mean(totalnumber_201903),mean(totalnumber_201904),
                                                           mean(totalnumber_201905),mean(totalnumber_201906),mean(totalnumber_201907),mean(totalnumber_201908),
                                                           mean(totalnumber_201909),mean(totalnumber_201910),mean(totalnumber_201911),mean(totalnumber_201912),
                                                           mean(totalnumber_202001),mean(totalnumber_202002),mean(totalnumber_202003),mean(totalnumber_202004),
                                                           mean(totalnumber_202005))]
a6
mean=data.table(a1,a2,a3,a4,a5,a6)

length(A[is_sponsor==1 & first_sponsor_time<="2020-05-30",]$login) # #18928
a7=A[is_sponsor==1 & first_sponsor_time<="2020-05-30",c(mean(totalnumber_201805),mean(totalnumber_201806),mean(totalnumber_201807),mean(totalnumber_201808),
                                                           mean(totalnumber_201809),mean(totalnumber_201810),mean(totalnumber_201811),mean(totalnumber_201812),
                                                           mean(totalnumber_201901),mean(totalnumber_201902),mean(totalnumber_201903),mean(totalnumber_201904),
                                                           mean(totalnumber_201905),mean(totalnumber_201906),mean(totalnumber_201907),mean(totalnumber_201908),
                                                           mean(totalnumber_201909),mean(totalnumber_201910),mean(totalnumber_201911),mean(totalnumber_201912),
                                                           mean(totalnumber_202001),mean(totalnumber_202002),mean(totalnumber_202003),mean(totalnumber_202004),
                                                           mean(totalnumber_202005))]
a7
length(A[is_sponsor==1 & first_sponsor_time > "2020-05-30",]$login) # # 682
a8=A[is_sponsor==1 & first_sponsor_time > "2020-05-30",c(mean(totalnumber_201805),mean(totalnumber_201806),mean(totalnumber_201807),mean(totalnumber_201808),
                                                        mean(totalnumber_201809),mean(totalnumber_201810),mean(totalnumber_201811),mean(totalnumber_201812),
                                                        mean(totalnumber_201901),mean(totalnumber_201902),mean(totalnumber_201903),mean(totalnumber_201904),
                                                        mean(totalnumber_201905),mean(totalnumber_201906),mean(totalnumber_201907),mean(totalnumber_201908),
                                                        mean(totalnumber_201909),mean(totalnumber_201910),mean(totalnumber_201911),mean(totalnumber_201912),
                                                        mean(totalnumber_202001),mean(totalnumber_202002),mean(totalnumber_202003),mean(totalnumber_202004),
                                                        mean(totalnumber_202005))]
a8