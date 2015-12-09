#Read data if doesn't exist
if (!(exists("epc") && is.data.frame(epc))) source('readData.R')

#Open file device for store png image
png(filename = "plot3.png",width = 480,height = 480,bg = "transparent")

#Make plot
plot(epc$DateTime, epc$Sub_metering_1,type = "l",ylab = "Energy sub metering",col="black")

#Add line to plot
lines(epc$DateTime, epc$Sub_metering_2,col="red")

#Add line to plot
lines(epc$DateTime, epc$Sub_metering_3,col="blue")

#Add legent to plot
legend("topright", col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1))

#Close file device
dev.off()