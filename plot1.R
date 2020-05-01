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
png('plot1.png')
with(ds, hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
dev.off()