plotme <- function()
{
  source("clean.R")
  df <- clean()
  hist(df$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")
  dev.copy(png,"plot1.png",width=480,height=480)
  dev.off()
}

