
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
png(filename = "plot1.png",width = 480,height = 480,units = "px")

#Constructing the histogram for Global Active Power.
hist(as.numeric(as.character(subdata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)")

#switching the device off.
dev.off()