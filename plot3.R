library (dplyr)
library (ggplot2)

install.packages('ggplot2', dep = TRUE)

plot3 <- function() {
  setwd("d:/Coursera/Module04/CourseProject03/exdata_data_NEI_data")
  
  ##Read data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  # Subset data
  baltimore_NEI <- subset(NEI, NEI$fips == "24510")
  
  # plot3
  with(baltimore_NEI, {
    
    png("plot3.png", width=480, height=480, units="px") 
    
    plot_data <- ddply(baltimore_NEI, .(year, type), numcolwise(sum))
    #plot_data <- transform(plot_data, type = factor(type))
    
    plot <- ggplot(plot_data) + aes(x = factor(year), y = Emissions, group = type, col = type) + geom_line() + geom_point() + labs(title = expression('Emissions of PM'[2.5] ~ ' in Baltimore'), x = "Year", y = expression("Total PM"[2.5] ~ "emission (tons)"), fill = "Year")
    
    print(plot)
    
    dev.off()
    
  })
}