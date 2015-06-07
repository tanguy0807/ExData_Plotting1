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

#################################### PLOT 3 ###################################################
DateTime <- as.POSIXlt(paste(as.Date(Date, format="%d/%m/%Y"), Time, sep=" "))
Sys.setlocale("LC_TIME", "English") #to make sure weekdays are displayed in english (my local Time is set in French)

plot(DateTime, Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = ""
)
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       x.intersp = -0.5,
       y.intersp = 0.4,
       xjust = 1,
#       adj = c(-0.1,-0.1)
)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
###############################################################################################