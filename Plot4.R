setwd("/Users/YafeiXu/GoogleCloud/15 courseraproject")

data_all<-read.table("household_power_consumption.txt",header = T,sep = ";"
                     ,na.strings = "?",check.names = F,stringsAsFactors = F
                     ,dec = ".")
subsetData<-data_all[data_all$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

globalActivePower<-as.numeric(subsetData$Global_active_power)
globalReactivePower<-as.numeric(subsetData$Global_reactive_power)
voltage<-as.numeric(subsetData$Voltage)
subMetering1<-as.numeric(subsetData$Sub_metering_1)
subMetering2<-as.numeric(subsetData$Sub_metering_2)
subMetering3<-as.numeric(subsetData$Sub_metering_3)

png("/Users/YafeiXu/GoogleCloud/GithubBB/ExData_Plotting1/plot4.png", width=480
    , height = 480)
par(mfrow=c(2,2))

plot(datetime,globalActivePower, type="l"
     , xlab= "", ylab = "Global Active Power")
plot(datetime,voltage, type="l"
     , xlab= "datetime", ylab = "Voltage")

plot(datetime,subMetering1, type="l"
     , xlab= "", ylab = "Energy sub metering")
lines(datetime,subMetering2, type="l", col="red")
lines(datetime,subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

plot(datetime,globalReactivePower, type="l"
     , xlab= "datetime", ylab = "Global_reactive_power")

dev.off()
