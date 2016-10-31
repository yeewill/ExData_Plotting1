## William Yee
## October 30, 2016
## Coursera Exploratory Data Analysis Week 1 Project

##Set the Working Directory
setwd("C:/Users/yeewi/Documents/Exploratory Data Analysis/week 1")

##read the file
power.consumption<- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, dec=".", stringsAsFactors = FALSE)


## Select 2007-02-01 and 2007-02-02
data.sub<-subset(power.consumption, Date %in% c("1/2/2007", "2/2/2007"))
## Fix the time
datetime <- strptime(paste(data.sub$Date, data.sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Convert to numberic
globalActivePower <- as.numeric(data.sub$Global_active_power)
globalReactivePower <- as.numeric(data.sub$Global_reactive_power)
volt <- as.numeric(data.sub$Voltage)
subMeter1 <- as.numeric(data.sub$Sub_metering_1)
subMeter2 <- as.numeric(data.sub$Sub_metering_2)
subMeter3 <- as.numeric(data.sub$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()