# Read the given text file with column names as described in the course project.
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colClass <- c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
epcData<-read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",col.names=colNames,colClasses=colClass,na.strings = c("?","NA"))

# Declare only the dates for which the data is needed and read data for those dates into a dataset.
tgtDates<-(epcData$Date=="1/2/2007" | epcData$Date=="2/2/2007")
epcDS<-epcData[tgtDates,]

# Create a png file and draw a histogram of Global Active Power on X-axis and Frequesncy on Y-axis.
png("plot1.png", width=480, height=480)
hist(epcDS$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
