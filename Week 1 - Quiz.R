#1
Comm <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")

head(Comm)

length(which(Comm$VAL == 24))


#3
getwd()
setwd("/Users/ashleycampisano/Downloads")

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url,"./getdata_data_DATA.gov_NGAP (1).xlsx")

colindex <- 7:15 (G:P)
rowindex <- 18:23 (18:23)

?read_xlsx
dat <- read_xlsx("./getdata_data_DATA.gov_NGAP (1).xlsx", range = "G18:P23")

sum(dat$Zip*dat$Ext,na.rm=T)

#4

fileurl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileurl, useInternal = TRUE)
rootnode <- xmlRoot(doc)
xmlName(rootnode)

xmlSApply(rootnode, xmlValue)

xpathSApply(rootnode, "//name", xmlValue)
xpathSApply(rootnode, "//zipcode", xmlValue)

zipcode <- xpathSApply(rootnode, "//zipcode", xmlValue)
length(which(zipcode == 21231))

##5

DT <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")
head(DT)

DT <- fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")


system.time(pwgtp15 <- tapply(DT$pwgtp15,DT$SEX,mean))
#.001

system.time(DT[,mean(pwgtp15),by=SEX])
# .017

system.time(mean(DT[DT$SEX==1,]$pwgtp15))+system.time(mean(DT[DT$SEX==2,]$pwgtp15))
# .025

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
# .001

system.time(mean(DT$pwgtp15,by=DT$SEX))
# 0 

system.time(rowMeans(DT)[DT$SEX==1], rowMeans(DT)[DT$SEX==2])
#error
