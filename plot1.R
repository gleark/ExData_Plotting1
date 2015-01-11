# Assumes you have run get_data.R which saves clean version of 
#    UCI power data set into new CSV file defined by file2load

# Start with clean workspace
rm(list=ls())

## GLOBALS
file2load <- "eda_project1_data.csv"

## GET DATA -------------------------------------------------------------------
DF <- read.csv(file = file2load, header = TRUE)

# change TimStamp from default factor to POSIXlt
DF$TimeStamp <- as.POSIXlt(DF$TimeStamp)

hist(DF$Global_active_power
     , main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)"
     , col = "red")

