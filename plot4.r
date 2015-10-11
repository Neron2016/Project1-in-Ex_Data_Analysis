plot4 <- function(file) {
  
  par(mfrow=c(2,2))
  
  household_power_consumption <- read.table(file, header=T, sep=";")
  
  mynewdata<-na.omit(household_power_consumption [66637:69516, ])
  
  mynewdata$Date <- as.Date(mynewdata$Date, format="%d/%m/%Y")
  
  mynewdata$Sub_metering_1=as.numeric(as.character(mynewdata$Sub_metering_1))
  
  mynewdata$Sub_metering_2=as.numeric(as.character(mynewdata$Sub_metering_2))
  
  mynewdata$Sub_metering_3=as.numeric(as.character(mynewdata$Sub_metering_3))
  
  mynewdata <- transform(mynewdata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  ##PLOT 1
  
  plot(mynewdata$timestamp,mynewdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
  
  ##PLOT 2
  
  plot(mynewdata$timestamp,mynewdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##PLOT 3
  
  plot(mynewdata$timestamp,mynewdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  
  lines(mynewdata$timestamp, mynewdata$Sub_metering_2,col="red")
  
  lines(mynewdata$timestamp,mynewdata$Sub_metering_3,col="blue")
  
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
  
  ##PLOT 4
  
  plot(mynewdata$timestamp, mynewdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  ## closing all plots
  

  dev.copy(png, file="plot4.png", width=480, height=480)
  
  dev.off()
  
  cat("plot4.png was added to working directory", getwd())
  
}
plot4("household_power_consumption.txt")