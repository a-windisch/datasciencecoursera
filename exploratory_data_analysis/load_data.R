######################################################
#           Loading data for EDA project             #
#    Andreas Windisch, andreas.windisch@yahoo.com    #
######################################################



cat("######################################################\n")
cat("#           Loading data for EDA project             #\n")
cat("#    Andreas Windisch, andreas.windisch@yahoo.com    #\n")
cat("######################################################\n")

setwd("./course_project_2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
cat("Data set loaded.\n")
cat("------------------------------------------------------\n")
cat("Summary of NEI Emissions:\n")
print(summary(NEI$Emissions))
cat("------------------------------------------------------\n")
cat("Number of 0.0 in NEI$Emissions:\n")
cat(mean(NEI$Emissions==0.0)*100.0," %\n")
cat("------------------------------------------------------\n")
cat("Dimension NEI         : ", dim(NEI), "\n")
cat("Fraction of NAs in NEI:\n")
cat("fips     : ", mean(is.na(NEI$fips))*100.0, " %\n")
cat("SCC      : ", mean(is.na(NEI$SCC))*100.0, " %\n")
cat("Pollutant: ", mean(is.na(NEI$Pollutant))*100.0, " %\n")
cat("Emissions: ", mean(is.na(NEI$Emissions))*100.0, " %\n")
cat("type     : ", mean(is.na(NEI$type))*100.0, " %\n")
cat("year     : ", mean(is.na(NEI$year))*100.0, " %\n")
