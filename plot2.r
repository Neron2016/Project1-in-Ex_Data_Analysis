plot2 <- function(file) {
  household_power_consumption <- read.table(file, header=T, sep=";")
  
  mynewdata<-na.omit(household_power_consumption [66637:69516, ])
  
  mynewdata$Date <- as.Date(mynewdata$Date, format="%d/%m/%Y")
  
  mynewdata$Global_active_power <- as.numeric(as.character(mynewdata$Global_active_power))
  
  mynewdata <- transform(mynewdata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  plot(mynewdata$timestamp,mynewdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("plot2.png was added to working directory", getwd())
}
plot2("household_power_consumption.txt")