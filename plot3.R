# plot1.R

library(dplyr)

fileName = "./household_power_consumption.txt"
data = read.table( fileName, 
                   header=TRUE, 
                   sep=";", 
                   stringsAsFactors = FALSE,
                   na.strings = "?"
                   )
data2 = subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")
ds = mutate(data2,Date = as.POSIXct(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")))
ds$Time <- NULL
png("plot3.png")
with(ds, {
     plot(Date,Sub_metering_1,xlab="",ylab="Energy sub metering", type="n")
     lines(Date,Sub_metering_1)
     lines(Date,Sub_metering_2,col="red")
     lines(Date,Sub_metering_3,col="blue")
     legend("topright",legend=c("Sub_metering_1",
                                "Sub_metering_2",
                                "Sub_metering_3"),
                         lwd=1,
                         col=c("black","red","blue")
            )
})
dev.off()