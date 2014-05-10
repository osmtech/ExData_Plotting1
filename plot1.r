#from forums
hpc <- read.table("household_power_consumption.txt",
                                     skip = 66637, nrow = 2880, sep = ";", 
                                     col.names = colnames(read.table(
                                           "household_power_consumption.txt",
                                           nrow = 1, header = TRUE, sep=";")))

x <- as.numeric(hpc[, "Global_active_power"])
hist.data = hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#hist.data$counts = hist.data$counts/1000
dev.copy(png,'plot1.png')
dev.off()