# Title:   Engineering Data Analytics Project
# Purpose: Monthly Total Rainfall Analysis - Adelaide Airport(023034)
# Run this code 

# Load Packages
library(tidyverse)
library(ggplot2)

# setting up the directory
setwd("C:/Users/Admin/OneDrive/Desktop/University/EDA/Project/Data files")

# To confirm the directory
getwd()

# Loading the Data
Data3 = read.csv("IDCJAC0001_023034_Monthly.csv", na="null")

# To view the data
view(Data3)

# To check column names
names(Data3)

# To convert Months column in calendar order
month_order <- c("January","February","March","April","May","June","July","August","September","October","November","December")

# Define MONTHS column to ordered factor
Data3$MONTHS <- factor(Data3$MONTHS, levels = month_order)

# Calculate monthly total rainfall for all years
Data3_sum <- Data3 %>%
  group_by(MONTHS) %>%
  summarise(TOTAL_RAINFALL = sum( RAINFALL.MM., na.rm = TRUE))

# Data visulaisation for Data3
Data3_sum %>%
  ggplot(aes(x = MONTHS, y = TOTAL_RAINFALL , fill = TOTAL_RAINFALL)) +
  geom_col(width = 0.5) +
  scale_fill_gradient(low = "lightblue", high = "steelblue4", name = "Rainfall(mm)") +
  scale_y_continuous(breaks = seq(0, 2500, by = 250), limits = c(0, 2500)) +
  labs(x = "Month",y = "Total Rainfall (mm)",title = "Total Monthly Rainfall Adelaide Airport(023034) for 1981–2020") +
  theme_classic() +
  theme(plot.title = element_text(size = 10, face = "bold", hjust = 0.3),
        axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title = element_text(size = 10, face = "bold"))

# To save the plot
ggsave("Project Report 1.png", width = 7 , height = 5 )

