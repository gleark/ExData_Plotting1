# Start with clean workspace
rm(list=ls())

## GLOBALS
file2load <- "eda_project1_data.csv"
plot_file_out <- "plot4.png"

## GET DATA -------------------------------------------------------------------
DF <- read.csv(file = file2load, header = TRUE)

# change TimStamp from default factor to POSIXlt
DF$TimeStamp <- as.POSIXlt(DF$TimeStamp)


## DEFINE PLOT  ---------------------------------------------------------------
png(filename = plot_file_out
    , width = 480
    , height = 480
    , units = "px")

par(mfrow = c(2,2))

with(DF, {
  # row1, col1
  plot(DF$TimeStamp, DF$Global_active_power
       , type = "line"
       , xlab = "TImeStamp"
       , ylab ="Global Active Power (kilowatts)")
  
  # row2, col2
  plot(DF$TimeStamp, DF$Voltage
       , type = "line"
       , xlab =""
       , ylab = "Voltage")
  
  # row2, col2
  plot(DF$TimeStamp, DF$Sub_metering_1
       , type = "line"
       , xlab =""
       , ylab ="Energy sub metering")
  
  lines(DF$TimeStamp, DF$Sub_metering_2, col="red")
  lines(DF$TimeStamp, DF$Sub_metering_3, col="blue")
  legend("topright", lwd = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # row2, col2
  plot(DF$TimeStamp, DF$Global_reactive_power
       , type = "line",
       , xlab = "Global_reactive_power"
       , ylab = "TImeStamp")
  
})

dev.off()