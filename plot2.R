#Read the files

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

#Subset the data appropriately

subset <- NEI[NEI$fips == "24510", ] 

#Specify global graphics parameter(here: the margins for the plot)

par("mar"=c(5.1, 4.5, 4.1, 2.1))

#Launch the graphics device(file device:PNG)

png("plot2.png", width = 480, height = 480, units = "px")

#Use the aggregate function for calculating summary statistics

totalemission <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")

#Create(and annotate) the plot

plot(totalemission, type = "l", xlab = "Year", 
     main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*"Emission"))

#Close the graphics device

dev.off()