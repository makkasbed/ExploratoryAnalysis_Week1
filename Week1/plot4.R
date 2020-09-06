plotFour <- function()
{
  source("clean.R")
  df <- clean()
  
  #create plot3, lines add the corressponding lines to the graph
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(df, {
    plot(Global_active_power~dateTime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~dateTime, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~dateTime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~dateTime,col='red')
    lines(Sub_metering_3~dateTime,col='blue')
    #legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"), bty="n")
    legend("topright", col=c("black", "red", "blue"),bty="n",lwd=2,lty=1, cex=.56,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~dateTime, type="l",xlab="datetime")
  })
  
  #save plot to file plot4.png
  dev.copy(png,file="plot4.png",width=480,height=480)
  dev.off()
}