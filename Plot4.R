setwd("C:/Users/Vangapandu1/Pers/Coursera/EDA/WK1/Coursework")
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colClass <- c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
epcData<-read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",col.names=colNames,colClasses=colClass,na.strings = c("?","NA"))
tgtDates<-(epcData$Date=="1/2/2007" | epcData$Date=="2/2/2007")
epcDS<-epcData[tgtDates,]

png("plot4.png", width=480, height=480)
dt <- strptime(paste(epcDS$Date, epcDS$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))

# 1st graph
len <- length(epcDS$Global_active_power)
plot(epcDS$Global_active_power,type="l",ylab="Global Active Power", xlab="",xaxt = "n")
axis(side=1, at=c("1",len/2,len), c("Thu","Fri","Sat"))

# 2nd graph
plot(dt, as.numeric(epcDS$Voltage), type="l", xlab="datetime", ylab="Voltage")

# 3rd graph
plot(dt, as.numeric(epcDS$Sub_metering_1), type="l",ylab="Energy sub metering", xlab="")
lines(dt, as.numeric(epcDS$Sub_metering_2), col="red")
lines(dt, as.numeric(epcDS$Sub_metering_3), col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, bty="n")

# 4th graph
plot(dt, as.numeric(epcDS$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()