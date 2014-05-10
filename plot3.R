#from forums
hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))
hpc$DateTime = as.POSIXct(strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S"))

#png('plot3.png')
plot( hpc$DateTime,hpc$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(hpc$DateTime,hpc$Sub_metering_2, col="red")
lines(hpc$DateTime,hpc$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1)
#dev.off()