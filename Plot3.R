# Read the given text file with column names as described in the course project.
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colClass <- c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
epcData<-read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",col.names=colNames,colClasses=colClass,na.strings = c("?","NA"))

# Declare the dates for which the data is needed and read data for those dates into a dataset.
tgtDates<-(epcData$Date=="1/2/2007" | epcData$Date=="2/2/2007")
epcDS<-epcData[tgtDates,]

# Create a png file and plot Energy sub metering along Y-axis.
png("plot3.png", width=480, height=480)
dt <- strptime(paste(epcDS$Date, epcDS$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(dt, as.numeric(epcDS$Sub_metering_1), type="l",ylab="Energy sub metering", xlab="")
lines(dt, as.numeric(epcDS$Sub_metering_2), col="red")
lines(dt, as.numeric(epcDS$Sub_metering_3), col="blue")

#Draw a legend on the top right corner of the graph to indicate the lines with different colors.
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)
dev.off()
