if(!exists("mydata"))
{
  colClasses <- c("character","character",rep("numeric",7)) 
  mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", colClasses=colClasses)
  mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M")
  mydata$Date = as.Date(mydata$Date, "%d/%m/%Y")
  mydata <- mydata[mydata$Date >= as.Date("2007/02/01") & mydata$Date <= as.Date("2007/02/02"),]
}

par(mfrow = c(2,2))

with(mydata, plot(1:length(Date), Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xaxt="n"))

axis(1,at=c(0,length(mydata$Date)/2,length(mydata$Date)),labels=c("Thu","Fri","Sat"))

with(mydata, plot(1:length(Date), Voltage, type="l", xlab="datetime",ylab="Voltage",xaxt="n"))

axis(1,at=c(0,length(mydata$Date)/2,length(mydata$Date)),labels=c("Thu","Fri","Sat"))

with(mydata, plot(1:length(Date), mydata$Sub_metering_1, type="l", ylab="Energy sub metering",xaxt="n",col="black"))

with(mydata, lines(1:length(Date), mydata$Sub_metering_2, type="l", ylab="Energy sub metering",xaxt="n",col="red"))

with(mydata, lines(1:length(Date), mydata$Sub_metering_3, type="l", ylab="Energy sub metering",xaxt="n",col="blue"))

axis(1,at=c(0,length(mydata$Date)/2,length(mydata$Date)),labels=c("Thu","Fri","Sat"))

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty = "n")

with(mydata, plot(1:length(Date), Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power",xaxt="n"))

axis(1,at=c(0,length(mydata$Date)/2,length(mydata$Date)),labels=c("Thu","Fri","Sat"))


dev.copy(png,"figure/plot4.png",width=480,height=480)
dev.off()
