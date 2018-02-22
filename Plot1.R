setwd("/Users/YafeiXu/GoogleCloud/15 courseraproject")

data_all<-read.table("household_power_consumption.txt",header = T,sep = ";"
                   ,na.strings = "?",check.names = F,stringsAsFactors = F
                   ,dec = ".")
subsetData<-data_all[data_all$Date %in% c("1/2/2007","2/2/2007"), ]

globalActivePower<-as.numeric(subsetData$Global_active_power)
png("/Users/YafeiXu/GoogleCloud/GithubBB/ExData_Plotting1/plot1.png", width=480, height = 480)
hist(globalActivePower, col = "red", main = "Global active Power"
     , xlab = "Global Active Power (kilowatts)")
dev.off()