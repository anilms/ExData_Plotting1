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
datetime<-as.POSIXct(paste(subData$Date, subData$Time), 
					 format="%Y-%m-%d %H:%M:%S")

png(file="plot4.png", height=480, width=480)
par(mfrow=c(2,2))	# Create Grid of 2x2 plots

# Plot1
plot(subData$Global_active_power ~ datetime, 
	 type="l", 
	 ylab="Global Active Power", 
	 xlab='')

# Plot2
plot(subData$Voltage ~ datetime, 
	 type="l", 
	 ylab="Voltage", 
	 xlab='datetime')

# Plot3
plot(subData$Sub_metering_1 ~ datetime, 
	 type="l", 
	 ylab="Energy sub metering", 
	 xlab='')
lines(datetime, subData$Sub_metering_2, type="l", col="red")
lines(datetime, subData$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1, bty='n', col = c("black", "blue", "red"), 
	   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot4
plot(subData$Global_reactive_power ~ datetime, 
	 type="l", 
	 ylab="Global_reactive_power", 
	 xlab='datetime')

status<-dev.off()



