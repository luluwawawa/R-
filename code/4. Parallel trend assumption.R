### 5. Parallel trend assumption
A_user=fread("C:/Users/Administrator/Desktop/lucy/合成/A_user_panel_cem.csv")

### 5.1 Extract date information
date=unique(A_user[,list(date)])

### 5.2 Choose baseline date (conventionally, we choose the period of policy change or the period before the policy change as the baseline)
unique(A_user$date)
base_date=unique(A_user$date)[10]  # # 2019-04(12)/2019-03(11)/2019-02(10)

A_user[,table(date)] 
A_user[, date_relevel:= relevel(as.factor(date), as.character(base_date))]
A_user[,table(date_relevel)]

### 5.3 Run regression
# mod_para = felm(lsales ~ has_insurance*factor(date) + lag_lproduct_life + lag_lcomp_num + lag_lcomp_avg_sales + lag_lreview_num + lag_lcomp_avg_review_num|product_id + date|0|product_id, data = data)
# summary(mod_para)
#mod_para = felm(contribution ~ treat*factor(date) |user_id + date|0|user_id, data = A_user[is_sponsor==0,])
#summary(mod_para)  #以第一个日期作为base date
A_user=A_user[is_sponsor==0,]
mod_para = felm(contribution ~ treat*factor(date_relevel) |user_id + date|0|user_id, data = A_user,weights = A_user$weight)
summary(mod_para)

### 5.4 Get coefficent information
coefs = summary(mod_para)$coefficients
coefs
timeline = unique(A_user$date)[-which(unique(A_user$date) == base_date)]

treatx = coefs[26:49]
treat_se = coefs[,2][26:49]
treat_CI_L = treatx - 1.96*treat_se
treat_CI_U = treatx + 1.96*treat_se

treat_dat = cbind.data.frame(date = timeline, treatx, treat_CI_L, treat_CI_U)

#### merge these two tables: date and treat_dat
colnames(date)
colnames(treat_dat)

dat_for_parallel = merge(date, treat_dat, by = "date", all.x = T)

## fill the baseline period with 0
dat_for_parallel[is.na(dat_for_parallel)] = 0


### 5.5 Draw Parallel trend figure
ggplot(dat_for_parallel, aes(x = date, y = treatx)) +
  geom_errorbar(aes(ymin = treat_CI_L, ymax = treat_CI_U), width = 0.05, size = 0.5) +
  geom_line(size = 1, color = "blue") + 
  geom_point(color = "blue", size = 2) +
  geom_line(y = 0, linetype = 2) +
  geom_vline(xintercept = as.numeric(dat_for_parallel[date == base_date]$date), linetype = "dashed") +
  xlab("") +
  ylab("Treatment Effect")+
  theme_bw()+
  theme(axis.title.x = element_text(colour="black",size=14,face="plain"))+
  theme(axis.title.y = element_text(colour="black",size=14,face="plain"))+
  theme(legend.text = element_text(size=14))+theme(legend.title =element_text(size=14))+
  theme(axis.text = element_text(colour="black",size=14,face="plain"))+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))







