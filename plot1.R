#Read data if doesn't exist
if (!(exists("epc") && is.data.frame(epc))) source('readData.R')

#Open file device for store png image
png(filename = "plot1.png",width = 480,height = 480,bg = "transparent")

#Make histogram
hist(epc$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

#Close file device
dev.off()
