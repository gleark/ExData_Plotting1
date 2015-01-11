## Introduction

This repo contains a set of simple R scripts that take at dataset of household power consumption readings and produce a series of simple graphs.

Scripts included are:  

* <b>get_data.R</b> - created tidy dataset from UCI data  

(All of the following scripts use the tidy dataset created above)  

* <b>plot1.R</b> - create histogram of Global Active Power(kw) readings  
* <b>plot2.R</b> - create timeseries line plot of Global Active Power(kw)  
* <b>plot3.R</b> - create timeseries line plot of Energy sub metering variables 1,2, & 3  
* <b>plot4.R</b> - creates 2 x 2 panel plot of plot2,plot3, and 2-timeseries plots of Voltage and Global Reactive Power  

## Base Dataset 

Orignal data source is from <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>.  
The specific data file used is "Individual household
electric power consumption Data Set" Data used was download from Coursera EDA website:

* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Tidy Dataset
A tidy dataset was created from the raw UCI dataset by using the R-script get_data.R.  This script does the following:

* reads in raw datafile
* convert Date, Time fields into TimeStamp with POSIXlt format
* filters dataset to contain records that:
** fall between [2007-02-01,2007-02-02]
** are complete records, i.e. contain no NAs

This dataset is saved into a CSV format that is then loaded for use in each plotting script

The stored variables are the same as the raw dataset except for:

* **TimeStamp** which is character date in the format of YYYY-MM-DD HH:MM:SS

## Plots scripts

Each script plot creates a single 480x480 pixel PNG file as output

