setwd("C:/Users/kzaveri004/Documents/R/ExpData/")
getwd()
list.files()
## Read data and generate a main data frame

main_data <- read.csv ("household_power_consumption.txt", sep = ";", na.strings="?")
main_data <- as.data.frame(main_data)
## generate sub_set considering the frame time 2007-02-01 to 2007-02-02
sub_set <- subset(main_data, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007", format="%d/%m/%Y") | 
                    as.Date(Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))

head(sub_set)
## Second task 
## Create a second subset when Date and time are convined with format %d/%m/%Y %H:%M:%S using as.POSIXct
sub_set$DateTime = as.POSIXct(paste(sub_set$Date, sub_set$Time), format="%d/%m/%Y %H:%M:%S")
## define plot sieze and create png file
png('Plott2.png',width=480,height=480)
## create plot
plot(sub_set$Global_active_power ~ sub_set$DateTime, type='l', 
     ylab='Global Active Power (kilowatts)',xlab='')
## close device
dev.off()