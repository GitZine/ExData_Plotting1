
power_cons <- read.table("household_power_consumption.txt",
                         dec = ".",stringsAsFactors = FALSE,sep=";"
                         ,header = TRUE,na.strings = "?")
power_cons$Date <-  as.Date(power_cons$Date,format = "%d/%m/%Y")
power_cons1 <- power_cons[power_cons$Date=="2007-02-01"|power_cons$Date=="2007-02-02",]
datetime <- with(power_cons1,strptime(paste(Date,Time,sep=" "),format = "%Y-%m-%d %H:%M:%S"))

with(power_cons1,plot(datetime,Global_active_power,type = "l"))

windows(height = 480,width = 480)

with(power_cons1,plot(datetime,Global_active_power,type = "l",xlab = "",ylab="Global Active Power"))
savePlot("plot2",type="png",device = dev.cur())
dev.off()