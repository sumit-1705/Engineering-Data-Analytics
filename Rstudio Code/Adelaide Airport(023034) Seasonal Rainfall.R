# Title: Engineering Data Analytics Project
# Purpose: Seasonal Rainfall Analysis - Adelaide Airport(023034)
# Run this code 

# Load Packages
library(tidyverse)
library(ggplot2)

# setting up the directory
setwd("C:/Users/Admin/OneDrive/Desktop/University/EDA/Project/Data files")

# To confirm the directory
getwd()

# Loading the Data
Data1 = read.csv("IDCJAC0001_023034_Seasonality.csv", na="null")

# To view the data
view(Data1)

# To check column names
names(Data1)

# Data visulaisation for Data1
Data1 %>%
  ggplot(aes(x = SEASON, y = RAINFALL.mm., fill = SEASON)) +
  geom_boxplot(width = 0.5, colour = "black") + 
  stat_boxplot(geom ="errorbar" , width = 0.5) + 
  labs(x = "SEASONS", y = "RAINFALL (mm)") + 
  labs(title = "Adelaide Airport(023034) Seasonal Rainfall") + 
  theme_bw() +
  theme(plot.title = element_text(size = 10, face = "bold", hjust = 0.5))

# To save the plot
ggsave("Project Report 1.png", width = 7 , height = 5 )
   

  