# Start with clean workspace
rm(list=ls())

## GLOBALS
DataDirPath <- "./data/"
file2load <- "household_power_consumption.txt"
finalOutputFileName <- "eda_project1_data.csv"


dirpath_filename_in  <- paste(DataDirPath,file2load,sep="")
dirpath_filename_out <- paste(DataDirPath,finalOutputFileName,sep="")

## GET DATA -------------------------------------------------------------------

# read in dataset 
# Source: UCI Individual household electric power consumption Data Set
# fileUrl <- https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# unzip into data directory

# determine colClasses
file_part  <- read.table(dirpath_filename,
                     ,header=TRUE
                     ,sep = ";"
                     ,na.strings = "?"
                     ,nrows = 5000)
                     #,as.is = !stringsAsFactors)

classes <- sub("logical","numeric",sapply(file_part,class))

household_power <- read.table(dirpath_filename,
                   header = TRUE,
                   ,sep = ";"
                   ,na.strings = "?"
                   ,colClasses = classes)
                   # ,as.is = !stringsAsFactors)

rm(file_part, classes, file2load)

# convert the Date and Time variables to Date/Time class
date_time <- paste(household_power$Date, household_power$Time)
household_power$TimeStamp <- strptime(date_time, "%d/%m/%Y %H:%M:%S")




drops <- c("Date", "Time")
keeps <- !(colnames(household_power) %in% drops)

# remove extra cols, NA rows, & filter date to specific range
start_ts <- strptime ("2007-02-01 00:00:00", "%Y-%m-%d %H:%M" )
stop_ts  <- strptime ("2007-02-03 00:00:00", "%Y-%m-%d %H:%M" )
  
DF <- household_power[household_power$TimeStamp>= start_ts & household_power$TimeStamp< stop_ts,keeps]
keeps <- !(colnames(DF) %in% c("TimeStamp"))

DF2 <- DF[complete.cases(DF[,keeps]),]

write.csv(DF, file =dirpath_filename_out, row.names = FALSE)



