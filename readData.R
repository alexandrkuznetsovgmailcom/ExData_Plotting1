#load library
library("dplyr")

#unzip file
unzip("exdata-data-household_power_consumption.zip")

#read 10 rows for get column class
epc <- read.csv(file = "./household_power_consumption.txt",sep = ";",nrows = 10, na.strings = "?")
classes <- sapply(epc, class)

#read data
epc <- read.csv(file = "./household_power_consumption.txt",sep = ";",colClasses = classes, na.strings = "?")

#remove file
unlink("household_power_consumption.txt")

#filter data for two days
epc <- filter(epc,Date == "1/2/2007" | Date == "2/2/2007")

#Convert "Date" and "Time" columns of "factor" class to "DateTime" column of POSIXct class
#dplyr works wrong with POSIXlt class (http://stackoverflow.com/questions/30063190/problems-with-dplyr-and-posixlt-data)
epc$DateTime <- as.POSIXct(strptime(paste(epc$Date,epc$Time,sep = " "),format = "%d/%m/%Y %H:%M:%S",tz = ""))

#Remove columns "Date" and "Time"
epc <- select(epc,-Date,-Time)

