# Assumes you have run get_data.R which saves clean version of 
#    UCI power data set into new CSV file defined by file2load

# Start with clean workspace
rm(list=ls())

## GLOBALS
file2load <- "eda_project1_data.csv"
plot_file_out <- "plot3.png"

## GET DATA -------------------------------------------------------------------
DF <- read.csv(file = file2load, header = TRUE)

# change TimStamp from default factor to POSIXlt
DF$TimeStamp <- as.POSIXlt(DF$TimeStamp)


## PLOT DEFINE  ---------------------------------------------------------------


png(filename = plot_file_out
    , width = 480
    , height = 480
    , units = "px")

plot(DF$TimeStamp, DF$Sub_metering_1
     , type = "line"
     , xlab =""
     , ylab ="Energy sub metering")

lines(DF$TimeStamp, DF$Sub_metering_2, col="red")
lines(DF$TimeStamp, DF$Sub_metering_3, col="blue")
legend("topright", lwd = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off() 