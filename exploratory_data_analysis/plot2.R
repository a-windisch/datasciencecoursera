######################################################
#           Plot 1 for EDA project                   #
#    Andreas Windisch, andreas.windisch@yahoo.com    #
######################################################

cat("######################################################\n")
cat("#       Preparing Plot 2 for EDA project             #\n")
cat("#    Andreas Windisch, andreas.windisch@yahoo.com    #\n")
cat("######################################################\n")

setwd("./course_project_2")
source("load_data.R")

cat("Collecting data for Baltimore 1999, 2002, 2005 and 2008.\n")
total1999 <- sum(NEI$Emissions[which(NEI$year==1999 & NEI$fips == "24510")])
total2002 <- sum(NEI$Emissions[which(NEI$year==2002 & NEI$fips == "24510")])
total2005 <- sum(NEI$Emissions[which(NEI$year==2005 & NEI$fips == "24510")])
total2008 <- sum(NEI$Emissions[which(NEI$year==2008 & NEI$fips == "24510")])

cat("Creating plot.\n")
png("plot2.png")
plot(1999,total1999/1000,xlim = c(1998,2009), ylim = c(1, 4),pch = 19, main = "Total emissions PM2.5 for Baltimore City", ylab = "total emissions [kt]", xlab = "year", xaxt="n")
axis(side = 1, at = c( 1999, 2002, 2005, 2008), las=2)
points(2002,total2002/1000, pch=19)
points(2005,total2005/1000, pch=19)
points(2008,total2008/1000, pch=19)
segments(1999,total1999/1000,2002,total2002/1000)
segments(2002,total2002/1000,2005,total2005/1000)
segments(2005,total2005/1000,2008,total2008/1000)
dev.off()
cat("File plot2.png written.\n")
cat("End of script.\n")
