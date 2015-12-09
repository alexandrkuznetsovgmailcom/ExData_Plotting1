#Read data if doesn't exist
if (!(exists("epc") && is.data.frame(epc))) source('readData.R')

#Open file device for store png image
png(filename = "plot2.png",width = 480,height = 480,bg = "transparent")

#Make plot
plot(epc$DateTime, epc$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)")

#Close file device
dev.off()
