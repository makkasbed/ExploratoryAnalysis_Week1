plotThree <- function()
{
  source("clean.R")
  df <- clean()
  
  #create plot3, lines add the corressponding lines to the graph
  with(df, {
    plot(Sub_metering_1~dateTime, type="l",
         ylab="Energy Sub metering", xlab="")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')
  })
  
  #add legend to graph and set colours for each
  legend("topright",col=c("black","red","blue"),lwd=c(1,1,1),
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #save plot to file plot3.png
  dev.copy(png,file="plot3.png",width=480,height=480)
  dev.off()
  
}