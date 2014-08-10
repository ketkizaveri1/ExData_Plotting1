setwd("C:/Users/kzaveri004/Documents/R/ExpData/")
getwd()
list.files()

data1 <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=TRUE)

sub_set <- subset(data1, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007", format="%d/%m/%Y") | 
                    as.Date(Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))

png(file="plot1.png",width=480,height=480,bg=NA,units="px")
hist(as.numeric(sub_set$Global_active_power), 
     col="red", main="Global Active Power", xlab="Global Active Power in (kilowatts)", 
     ylim=c(0,1200))
dev.off()



