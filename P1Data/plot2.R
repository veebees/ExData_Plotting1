data<-read.table("P1Data.txt", header = F, sep = ";", na.strings = "?",
                 nrows = 3500, skip = 66500, stringsAsFactors = F)

colnames(data)<- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                   "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                   "Sub_metering_3")
# data$Date<- as.Date(as.character(data$Date), "%d/%m/%y")
mdata<- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

datetime<- paste(mdata$Date, mdata$Time)
dtnum<-strptime(datetime, "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
mdata2<-cbind(dtnum, datetime, mdata)
plot2<-plot(x=mdata2$dtnum, y=mdata2$Global_active_power, type = "l", main = "", 
            xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()