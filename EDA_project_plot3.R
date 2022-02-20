## plot 3
library(data.table)

power_data <- data.table::fread(input = "household_power_consumption.txt"
                                , na.strings="?")
names(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                       "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

power_data <- subset(power_data, power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")
power_data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

png("plot3.png", width = 480, height = 480)

plot(power_data$dateTime, power_data$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(power_data$dateTime, power_data$Sub_metering_2, col = "red")
lines(power_data$dateTime, power_data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1","Sub_metering_2",
                                                      "Sub_metering_3"),
       lty = c(1,1), lwd =c(1.2))

dev.off()