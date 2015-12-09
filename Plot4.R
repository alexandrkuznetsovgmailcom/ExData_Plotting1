#Read data if doesn't exist
if (!(exists("epc") && is.data.frame(epc))) source('readData.R')

#Open file device for store png image
png(filename = "plot4.png",width = 480,height = 480,bg = "transparent")

#Make panel for four plot
par(mfrow = c(2,2))
with(epc,{
        #Make first plot
        plot(DateTime,Global_active_power,type = "l",ylab = "Global Active Power",col="black")
        
        #Make second plot
        plot(DateTime,Voltage,type = "l",col="black",ylab = "Voltage")
        
        #Make third plot
        plot(epc$DateTime, epc$Sub_metering_1,type = "l",ylab = "Energy sub metering",col="black")
        #Add lone to third plot
        lines(epc$DateTime, epc$Sub_metering_2,col="red")
        #Add lone to third plot
        lines(epc$DateTime, epc$Sub_metering_3,col="blue")
        #Add legend to third plot
        legend("topright", col = c("black","red","blue"),
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1),bty = "n")
        
        #Make fourth plot
        plot(DateTime,Global_reactive_power,type = "l",ylab = "Global Reactive Power",col="black")
})

#Close file device
dev.off()