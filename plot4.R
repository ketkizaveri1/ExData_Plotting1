setwd("C:/Users/kzaveri004/Documents/R/ExpData/")
getwd()
list.files()
## Read data and generate a main data frame

main_data <- read.csv ("household_power_consumption.txt", sep = ";", na.strings="?")
main_data <- as.data.frame(main_data)
## generate sub_set considering the frame time 2007-02-01 to 2007-02-02
sub_set <- subset(main_data, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007", format="%d/%m/%Y") | 
                    as.Date(Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))


sub_set$DateTime = as.POSIXct(paste(sub_set$Date, sub_set$Time), format="%d/%m/%Y %H:%M:%S")
## define plot sieze and create png file
png('plot4.png',width=480,height=480, bg=NA)
par(mfrow = c(2,2))
## Create plot 1
plot(sub_set$Global_active_power ~ sub_set$DateTime, type='l', 
     ylab='Global Active Power',xlab='')
## Create plot 2
plot(sub_set$Voltage ~ sub_set$DateTime, type='l', ylab='Voltage',xlab='datetime')
## Create plot 3
plot(sub_set$Sub_metering_1 ~ sub_set$DateTime, type='l', ylab='Energy sub metering',xlab='')
lines(sub_set$Sub_metering_2 ~ sub_set$DateTime, type='l', col='Red')
lines(sub_set$Sub_metering_3 ~ sub_set$DateTime, type='l', col='Blue')
## Add lables in plot 3
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd=1, col=c('Black','Red','Blue'))   
## Create plot 4
plot(sub_set$Global_reactive_power ~ sub_set$DateTime, type='l', ylab='Global_reactive_power',xlab='datetime')
dev.off()