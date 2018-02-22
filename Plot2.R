setwd("/Users/YafeiXu/GoogleCloud/15 courseraproject")

data_all<-read.table("household_power_consumption.txt",header = T,sep = ";"
                     ,na.strings = "?",check.names = F,stringsAsFactors = F
                     ,dec = ".")
subsetData<-data_all[data_all$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

globalActivePower<-as.numeric(subsetData$Global_active_power)

png("/Users/YafeiXu/GoogleCloud/GithubBB/ExData_Plotting1/plot2.png", width=480
    , height = 480)
plot(datetime,globalActivePower, type="l"
     , xlab= "", ylab = "Global Active Power (kilowatts)")
dev.off()
