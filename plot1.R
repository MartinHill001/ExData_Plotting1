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

#Plot 1
hist(ds$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

#copy to a png file
dev.copy(png,file="plot1.png")
dev.off()
