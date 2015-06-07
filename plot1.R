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

#################################### PLOT 1 ###################################################
hist(Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)"
)

dev.copy(png, file = "plot1.png", width = 480, height = 480)  ## Copy the plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!
###############################################################################################
