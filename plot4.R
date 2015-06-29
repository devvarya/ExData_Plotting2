#Read the files

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

#Merge both files by source of PM2.5 emission 
NEISCC <- merge(NEI, SCC, by="SCC")

#Match and then subset for coal combustion realted sources of emission

match <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subset <- NEISCC[match, ]

#Specify global graphics parameter(here: the margins for the plot)

par("mar"=c(5.1, 4.5, 4.1, 2.1))

#Launch the graphics device(file device:PNG)

png(filename = "plot4.png", width = 480, height = 480, units = "px")

#Use the aggregate function for calculating summary statistics

coalemission <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")

#Create(and annotate) the plot

plot(coalemission, type = "l", xlab = "Year", 
     main = "Total Emissions from Coal sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

#Close the graphics device

dev.off()