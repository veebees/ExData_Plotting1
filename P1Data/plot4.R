data<-read.table("P1Data.txt", header = F, sep = ";", na.strings = "?",
                 nrows = 3500, skip = 66500, stringsAsFactors = F)

colnames(data)<- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                   "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                   "Sub_metering_3")
# data$Date<- as.Date(as.character(data$Date), "%d/%m/%y")
mdata<- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

datetime<- paste(mdata$Date, mdata$Time)
dtnum<-strptime(datetime, "%d/%m/%Y %H:%M:%S")

mdata2<-cbind(dtnum, datetime, mdata)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(x=mdata2$dtnum, y = mdata2$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(x = mdata2$dtnum, y= mdata2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(x=mdata2$dtnum, y=mdata2$Sub_metering_1,type = "l", col = "black",
     ylab = "Energy sub metering", xlab = "")
lines(x=mdata2$dtnum, y=mdata2$Sub_metering_3, type = "l", col = "blue")
lines(x=mdata2$dtnum, y=mdata2$Sub_metering_2, type = "l", col = "red")
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,  col = c("black", "red", "blue"), bty = "n", cex=.9)
plot(x=mdata2$dtnum, y=mdata2$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
