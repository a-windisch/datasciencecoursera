######################################################
#           Plot 6 for EDA project                   #
#    Andreas Windisch, andreas.windisch@yahoo.com    #
######################################################

cat("######################################################\n")
cat("#       Preparing Plot 6 for EDA project             #\n")
cat("#    Andreas Windisch, andreas.windisch@yahoo.com    #\n")
cat("######################################################\n")

cat("Loading ggplot2 and dplyr.\n")
library(ggplot2)
library(dplyr)

setwd("./course_project_2")
source("load_data.R")

cat("Collecting data.\n")
vehcodes <- SCC$SCC[grep("Veh",SCC$Short.Name)]

sub1 <- NEI[ NEI$fips == "24510" | NEI$fips == "06037"  , ]
sub2 <- sub1[ sub1$SCC %in% vehcodes, ]
data <- sub2 %>% group_by(year, fips)  %>% 
  summarise( total = sum(Emissions))

data$total <- data$total/1000


cat("Creating plot.\n")
png("plot6.png")
p <- ggplot(data, aes(x=year,y=total, group=fips)) +
  geom_line(aes(color=fips), size=1)    +
  geom_point(aes(color=fips),size=3)    +
  ggtitle("Total emissions for motor vehicle sources") +
  ylab("total emission [kt]") +
  scale_x_discrete(limit=c(1999,2002,2005,2008)) +
  theme(legend.text=element_text(size=14)) +
  theme(axis.text.x = element_text(size=14)) +
  theme(axis.title.x = element_text( size = 14)) +
  theme(axis.text.y = element_text(size=14)) +
  theme(axis.title.y = element_text( size = 14)) +
  theme(title = element_text(size=14)) +
  scale_color_manual(labels = c("LA County", "Baltimore City"), values = c("red", "blue")) +
  guides(color=guide_legend("location"))

print(p)
dev.off()
cat("File plot6.png written.\n")
cat("End of script.\n")
