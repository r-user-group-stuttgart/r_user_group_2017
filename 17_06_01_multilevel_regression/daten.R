rm(list=ls())

library(haven)
wv6<-read_sav("wv6.sav")


eman<-wv6$RESEMAVAL
eman[which(eman<0)]<-NA

cntry<-to_label(wv6$V2)

attach(wv6)
education<-V248
education<-(education-1)/8

#Defining NA values
education[which(education<0)]<-NA


income<-V239
income<-(income-1)/9

#Defining NA values
income[which(income<0)]<-NA


#--Informational Awareness--#
info1<-V217;info2<-V218;info3<-V219;info4<-V220;info5<-V221;info6<-V222;
info7<-V223;info8<-V224

#Defining NA values
info1[which(info1<1)]<-NA;info2[which(info2<1)]<-NA;info3[which(info3<1)]<-NA;
info4[which(info4<1)]<-NA;info5[which(info5<1)]<-NA;info6[which(info6<1)]<-NA;
info7[which(info7<1)]<-NA;info8[which(info8<1)]<-NA

#recoding the info variables from less informed to more informed
info1<-abs(info1-5);info2<-abs(info2-5);info3<-abs(info3-5);info4<-abs(info4-5);
info5<-abs(info5-5);info6<-abs(info6-5);info7<-abs(info7-5);info8<-abs(info8-5)

#constucting inform index and recoding into 0 to 1
inform<-(info1+info2+info3+info4+info5+info6+info7+info8)/32
detach(wv6)

work<-data.frame(eman,education,income,inform,cntry)

library(lme4)

target <- c("Germany", "Argentina", "India", "Iraq", 
            "Japan", "Jordan", "Kazakhstan", "Kuwait", 
            "Lebanon", "Libya",  "Malaysia", "Mexico",  
            "Netherlands", "New Zealand", "Nigeria", 
            "Pakistan", "Palestine", "Peru", "Philippines", 
            "Poland", "Romania", "Russia","South Korea",
            "Turkey","United States")
smaller <- work %>% filter(cntry %in% target)


wvs<-na.omit(smaller)

getwd()
write_sav(wvs, "C:/Users/Favone/Documents/GitHub/dreamymemes/Multilevel Workshop/wvs.sav")
