data<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
head(data)
##Subset data 
ds<-subset(data,Date=='1/2/2007'|Date=='2/2/2007')
##remove large data set from memory
rm(data)
##add a column a calculated DateTime column
ds$DateTime<-strptime(paste( ds$Date,ds$Time), "%d/%m/%Y %H:%M:%S")
##convert collumn data types
ds$Global_active_power<-as.numeric(ds$Global_active_power)
ds$Global_reactive_power<-as.numeric(ds$Global_reactive_power)
ds$Voltage<-as.numeric(ds$Voltage)
ds$Global_intensity<-as.numeric(ds$Global_intensity)
ds$Sub_metering_1<-as.integer(ds$Sub_metering_1)
ds$Sub_metering_2<-as.integer(ds$Sub_metering_2)
ds$Sub_metering_3<-as.integer(ds$Sub_metering_3)

#save to png file
png(file = "plot4.png", bg = "transparent")

par(mfrow=c(2,2))
with(ds, {
      
      with(ds,plot(DateTime, Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab=""))
      
      with(ds,plot(DateTime, Voltage, ylab="Global Active Power (kilowatts)", type="l", xlab=""))      
      
      with(ds, {
            plot(DateTime, Sub_metering_1, ylab="Energy sub metering", type="n", xlab="")
            lines(DateTime, Sub_metering_1)
            lines(DateTime, Sub_metering_2, col="Red")
            lines(DateTime, Sub_metering_3, col="Blue")
            legend("topright", lty=c(1,1,1), col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), x.intersp = 0.75, y.intersp = 0.75, box.lwd=0, text.width = strwidth("Sub_metering_1"))
      })
      
      with(ds,plot(DateTime, Global_reactive_power, ylab="Global Reactive Power (kilowatts)", type="l", xlab=""))   
})


dev.off()
