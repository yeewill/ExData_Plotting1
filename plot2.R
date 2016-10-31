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

##Convert Global Activte Power to numberic
data.sub$Global_active_power<-as.numeric(data.sub$Global_active_power)

##Set the device to PNG
png("plot2.png", width=480, height=480)
##Make the plot
plot(datetime, data.sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##Close device
dev.off()

