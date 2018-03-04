
power_cons <- read.table("household_power_consumption.txt",
                         dec = ".",stringsAsFactors = FALSE,sep=";"
                         ,header = TRUE,na.strings = "?")
power_cons$Date <-  as.Date(power_cons$Date,format = "%d/%m/%Y")
power_cons$Time <- strptime(power_cons$Time,format="%H:%M:%S")
power_cons1 <- power_cons[power_cons$Date=="2007-02-01"|power_cons$Date=="2007-02-02",]

## histogram
hist(power_cons1$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
## I am creating the windows() because savePlot doesn't recognize
## Rstudio plot window.
windows(height = 480,width = 480)
hist(power_cons1$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
savePlot("plot1",type="png",device=dev.cur())
dev.off()