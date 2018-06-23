######################################################
#           Plot 3 for EDA project                   #
#    Andreas Windisch, andreas.windisch@yahoo.com    #
######################################################

cat("######################################################\n")
cat("#       Preparing Plot 3 for EDA project             #\n")
cat("#    Andreas Windisch, andreas.windisch@yahoo.com    #\n")
cat("######################################################\n")

cat("Loading ggplot2 and dplyr.\n")
library(ggplot2)
library(dplyr)

setwd("./course_project_2")
source("load_data.R")

cat("Collecting data.\n")

data <- NEI %>% group_by(type, year)  %>% 
                summarise( total = sum(Emissions))
data$total = data$total/1000000

cat("Creating plot.\n")
png("plot3.png")
p <- ggplot(data, aes(x=year,y=total,group=type)) + 
            geom_line(aes(color=type), size=1)    + 
            geom_point(aes(color=type),size=3)    + 
            ggtitle("Total emissions by source type") + 
            ylab("total emission [Mt]") + 
            scale_x_discrete(limit=c(1999,2002,2005,2008)) + 
            theme(legend.text=element_text(size=14)) +  
            theme(axis.text.x = element_text(size=14)) + 
            theme(axis.title.x = element_text( size = 14)) +   
            theme(axis.text.y = element_text(size=14)) + 
            theme(axis.title.y = element_text( size = 14)) + 
            theme(title = element_text(size=14))
print(p)
dev.off()
cat("File plot3.png written.\n")
cat("End of script.\n")

