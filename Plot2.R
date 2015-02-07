setwd("C:/Users/Vangapandu1/Pers/Coursera/EDA/WK1/Coursework")
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colClass <- c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
epcData<-read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",col.names=colNames,colClasses=colClass,na.strings = c("?","NA"))
tgtDates<-(epcData$Date=="1/2/2007" | epcData$Date=="2/2/2007")
epcDS<-epcData[tgtDates,]

len <- length(epcDS$Global_active_power)
png("plot2.png", width=480, height=480)
plot(epcDS$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab="",xaxt = "n")
axis(side=1, at=c("1",len/2,len), c("Thu","Fri","Sat"))
dev.off()
