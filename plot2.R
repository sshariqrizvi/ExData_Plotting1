if(!exists("mydata"))
{
  colClasses <- c("character","character",rep("numeric",7)) 
  mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", colClasses=colClasses)
  mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M")
  mydata$Date = as.Date(mydata$Date, "%d/%m/%Y")
  mydata <- mydata[mydata$Date >= as.Date("2007/02/01") & mydata$Date <= as.Date("2007/02/02"),]
}

with(mydata, plot(1:length(Date), Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xaxt="n"))

axis(1,at=c(0,length(mydata$Date)/2,length(mydata$Date)),labels=c("Thu","Fri","Sat"))

dev.copy(png,"figure/plot2.png",width=480,height=480)
dev.off()
