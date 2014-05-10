#from forums
hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))
hpc$DateTime = as.POSIXct(strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S"))

plot( hpc$DateTime,hpc$Global_active_power, type="l", xlab="", ylab="Global active power (kilowatts)")

dev.copy(png,'plot2.png')
dev.off()