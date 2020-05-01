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
png("plot2.png")
with(ds,plot(Date,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="n"))
with(ds,lines(Date,Global_active_power))
dev.off()