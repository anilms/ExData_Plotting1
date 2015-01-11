## Exdata-010
## Read data from household_power_consumption.txt
inData <- read.table("household_power_consumption.txt", 
					 sep=";", header=T, colClasses = "character")

## Choose data within dates 2007-02-01 and 2007-02-02
startDate<-as.Date("2007-02-01")
endDate<-as.Date("2007-02-02")
inData$Date<-as.Date(inData$Date, format='%d/%m/%Y')
subData<-subset(inData, Date>=startDate & Date<=endDate)

## Plot to png file
DateTime<-as.POSIXct(paste(subData$Date, subData$Time), 
					 format="%Y-%m-%d %H:%M:%S")

png(file="plot3.png", height=480, width=480)
plot(subData$Sub_metering_1 ~ DateTime, type="l", ylab="Energy sub metering", xlab='')
lines(DateTime, subData$Sub_metering_2, type="l", col="red")
lines(DateTime, subData$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), 
	   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
status<-dev.off()

