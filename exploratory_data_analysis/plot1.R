######################################################
#           Plot 1 for EDA project                   #
#    Andreas Windisch, andreas.windisch@yahoo.com    #
######################################################

cat("######################################################\n")
cat("#       Preparing Plot 1 for EDA project             #\n")
cat("#    Andreas Windisch, andreas.windisch@yahoo.com    #\n")
cat("######################################################\n")

setwd("./course_project_2")
source("load_data.R")

cat("Collecting data for 1999, 2002, 2005 and 2008.\n")
total1999 <- sum(NEI$Emissions[which(NEI$year==1999)])
total2002 <- sum(NEI$Emissions[which(NEI$year==2002)])
total2005 <- sum(NEI$Emissions[which(NEI$year==2005)])
total2008 <- sum(NEI$Emissions[which(NEI$year==2008)])
cat("Creating plot.\n")
png("plot1.png")
plot(1999,total1999/1000000,xlim = c(1998,2009), ylim = c(2, 8),pch = 19, main = "Total emissions PM2.5", ylab = "total emissions [Mt]", xlab = "year", xaxt="n")
axis(side = 1, at = c( 1999, 2002, 2005, 2008), las=2)
points(2002,total2002/1000000, pch=19)
points(2005,total2005/1000000, pch=19)
points(2008,total2008/1000000, pch=19)
segments(1999,total1999/1000000,2002,total2002/1000000)
segments(2002,total2002/1000000,2005,total2005/1000000)
segments(2005,total2005/1000000,2008,total2008/1000000)
dev.off()
cat("File plot1.png written.\n")
cat("End of script.\n")





