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
data.sub$Sub_metering_1<-as.numeric(data.sub$Sub_metering_1)
data.sub$Sub_metering_2<-as.numeric(data.sub$Sub_metering_2)
data.sub$Sub_metering_3<-as.numeric(data.sub$Sub_metering_3)

##Set the device to PNG
png("plot3.png", width=480, height=480)
##Make the plot
plot(datetime, data.sub$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, data.sub$Sub_metering_2, type="l", col="red")
lines(datetime, data.sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##Close device
dev.off()

