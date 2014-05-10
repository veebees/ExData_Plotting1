
data<-read.table("P1Data.txt", header = F, sep = ";", na.strings = "?",
                 nrows = 3500, skip = 66500, stringsAsFactors = F)

colnames(data)<- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                  "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                  "Sub_metering_3")


mdata<- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

png("plot1.png", width = 480, height = 480)

plot1<-hist(mdata$Global_active_power, col = "red", 
            main = "Global Active Power", 
            xlab = "Global Active Power (kilowatts)")
dev.off()