power_cons <- read.table("household_power_consumption.txt",
                         dec = ".",stringsAsFactors = FALSE,sep=";"
                         ,header = TRUE,na.strings = "?")
power_cons$Date <-  as.Date(power_cons$Date,format = "%d/%m/%Y")
power_cons1 <- power_cons[power_cons$Date=="2007-02-01"|power_cons$Date=="2007-02-02",]
datetime <- with(power_cons1,strptime(paste(Date,Time,sep=" "),format = "%Y-%m-%d %H:%M:%S"))

windows(height = 480,width = 480)
with(power_cons1,plot(datetime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy Sub Metering"))
par(new=TRUE)
with(power_cons1,lines(datetime,Sub_metering_2,col="red"))
par(new=TRUE)
with(power_cons1,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=c(1,1),col=c("black","red","blue"))
savePlot("plot3",type="png",device = dev.cur())
dev.off()