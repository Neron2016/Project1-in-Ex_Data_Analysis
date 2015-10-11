plot1 <- function(file) {
  household_power_consumption <- read.table(file, header=T, sep=";")
  
  mynewdata<-na.omit(household_power_consumption [66637:69516, ])
  
  mynewdata$Date <- as.Date(mynewdata$Date, format="%d/%m/%Y")
  
  mynewdata$Global_active_power <- as.numeric(as.character(mynewdata$Global_active_power))
  
  hist(mynewdata$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png was added to working directory", getwd())
}
plot1("household_power_consumption.txt")