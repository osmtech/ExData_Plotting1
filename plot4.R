#from forums
hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))
hpc$DateTime = as.POSIXct(strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S"))

png("plot4.png", width=550, height=550)
par(mfrow=c(2,2))
x <- as.numeric(hpc[, "Global_active_power"])
plot( hpc$DateTime,hpc$Global_active_power, type="l", xlab="", ylab="Global active power")
plot( hpc$DateTime,hpc$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot( hpc$DateTime,hpc$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(hpc$DateTime,hpc$Sub_metering_2, col="red")
lines(hpc$DateTime,hpc$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")

plot(hpc$DateTime, hpc$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l", lwd=0, col="black",lty=1, pch='.')
dev.off()