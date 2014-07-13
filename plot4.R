
#Reading data from a text file.
data = read.table("household_power_consumption.txt", header=TRUE,sep=";")

#Changing character date variable to date format variable. 
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y")
data$Date<-format(data$Date, "%Y-%m-%d")
data$Date<-as.Date(data$Date)

#Subsetting data for the required period.
subdata<-subset(data, Date >= "2007-02-01")
subdata<-subset(subdata, Date <= "2007-02-02")

#Creating a png grphic device.
png(filename = "plot4.png",width = 480,height = 480,units = "px")

#Plotting four graphs simultaneously.
par(mfrow=c(2,2))

#Plotting Global Active Power series against weekdays of the date.
plot(as.numeric(as.character(subdata$Global_active_power)),type="l",xlab="",ylab="Global Active Power (Kilowatts)",xaxt="n")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

#Plotting Voltage against weekdays of the date.
plot(as.numeric(as.character(subdata$Voltage)),type="l",xlab="",ylab="Voltage",xaxt="n")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

#Plotting Energy sub metering data against weekdays of the date.
plot(as.numeric(as.character(subdata$Sub_metering_1)),type="l",xlab="",ylab="Energy sub metering",xaxt = 'n')
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
lines(as.numeric(as.character(subdata$Sub_metering_2)), col="red")
lines(as.numeric(as.character(subdata$Sub_metering_3)), col="blue")

#Adding  the legend to the plot.
legend(2100,35, names(subdata)[7:9] ,bty='n',lty=1, col=c('black', 'red', 'blue'), cex=0.75)

#Plotting Voltage against weekdays of the date.
plot(as.numeric(as.character(subdata$Global_reactive_power)),type="l",xlab="",ylab="Global_reactive_power",xaxt="n")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

#switching the device off.
dev.off()