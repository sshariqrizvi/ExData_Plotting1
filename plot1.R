if(!exists("mydata"))
{
  colClasses <- c("character","character",rep("numeric",7)) 
  mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", colClasses=colClasses)
  mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M")
  mydata$Date = as.Date(mydata$Date, "%d/%m/%Y")
  mydata <- mydata[mydata$Date >= as.Date("2007/02/01") & mydata$Date <= as.Date("2007/02/02"),]
}

hist(mydata$Global_active_power, freq=T,col = "red", 
     main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png,"figure/plot1.png",width=480,height=480)
dev.off()
