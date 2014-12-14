## Read data from household_power_consumption.txt
inData <- read.table("household_power_consumption.txt", 
					 sep=";", header=T, colClasses = "character")

## Choose data within dates 2007-02-01 and 2007-02-02
startDate<-as.Date("2007-02-01")
endDate<-as.Date("2007-02-02")
inData$Date<-as.Date(inData$Date, format='%d/%m/%Y')
subData<-subset(inData, Date>=startDate & Date<=endDate)

## Plot to png file
png(file="plot1.png", height=480, width=480)
hist(as.numeric(subData$Global_active_power), 
	 col="red", 
	 main="Global Active Power", 
	 xlab="Global Active Power (kilowatts)")
status<-dev.off()

