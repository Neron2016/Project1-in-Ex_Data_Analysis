plot3 <- function(file) {
  
  household_power_consumption <- read.table(file, header=T, sep=";")
  
  mynewdata<-na.omit(household_power_consumption [66637:69516, ])
  
  mynewdata$Date <- as.Date(mynewdata$Date, format="%d/%m/%Y")
  
  mynewdata <- transform(mynewdata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  mynewdata$Sub_metering_1 <- as.numeric(as.character(mynewdata$Sub_metering_1))
  mynewdata$Sub_metering_2 <- as.numeric(as.character(mynewdata$Sub_metering_2))
  mynewdata$Sub_metering_3 <- as.numeric(as.character(mynewdata$Sub_metering_3))
  
  plot(mynewdata$timestamp,mynewdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  
  lines(mynewdata$timestamp,mynewdata$Sub_metering_2,col="red")
  
  lines(mynewdata$timestamp,mynewdata$Sub_metering_3,col="blue")
  
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
  
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  cat("plot3.png was added to working directory", getwd())
}
plot3("household_power_consumption.txt")