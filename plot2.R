##### the dataset can be downloaded at the "data folder" at:
##### https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
##### once you downloaded it, unzip the file to your working directory

##### type your working directory here:
workpath <- "C:/Users/Catherine/Desktop/R/exploratory/CP1"
setwd(workpath)

library(sqldf) #you will need to install quite a few packages if you do not have the package sqldf ... sorry!

##### extracting only the lines for dates corresponding to 2007-02-01 and 2007-02-02
raw_table <- read.csv.sql("household_power_consumption.txt",
                          sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                          header = TRUE, sep = ";")
closeAllConnections()

attach(raw_table) #prevents from typing the name of the data frame before each variable

names(raw_table)

#################################### PLOT 2 ###################################################
DateTime <- as.POSIXlt(paste(as.Date(Date, format="%d/%m/%Y"), Time, sep=" "))
Sys.setlocale("LC_TIME", "English") #to make sure weekdays are displayed in english (my local Time is set in French)

png("plot2.png", width=480, height=480)

DateTime <- as.POSIXlt(paste(as.Date(Date, format="%d/%m/%Y"), Time, sep=" "))
Sys.setlocale("LC_TIME", "English") #to make sure weekdays are displayed in english (my local Time is set in French)

plot(DateTime, Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = ""
)

dev.off()
###############################################################################################