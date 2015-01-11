# Assumes you have run get_data.R which saves clean version of 
#    UCI power data set into new CSV file defined by file2load

# Start with clean workspace
rm(list=ls())

## GLOBALS
file2load <- "eda_project1_data.csv"
plot_file_out <- "plot2.png"

## GET DATA -------------------------------------------------------------------
DF <- read.csv(file = file2load, header = TRUE)

# change TimStamp from default factor to POSIXlt
DF$TimeStamp <- as.POSIXlt(DF$TimeStamp)


## PLOT DEFINE  ---------------------------------------------------------------


png(filename = plot_file_out
    , width = 480
    , height = 480
    , units = "px")

plot(DF$TimeStamp, DF$Global_active_power
     , type = "line"
     , xlab =""
     , ylab ="Global Active Power (kilowatts)")


dev.off() 