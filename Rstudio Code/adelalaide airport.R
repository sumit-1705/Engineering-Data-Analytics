library(tidyverse)

# Load CSV file manually
rain_data <- read.csv(file.choose(), na.strings = c("", "NA", "null"))

# Check column names
names(rain_data)

# Prepare data
rain_data <- rain_data %>%
  mutate(
    Year = as.numeric(Year),
    Annual = as.numeric(Annual),
    Rainfall_Level = case_when(
      Annual >= 500 ~ "High",
      Annual >= 300 & Annual < 500 ~ "Medium",
      Annual < 300 ~ "Low",
      TRUE ~ "No Data"
    )
  )

# Calculate outliers using IQR method
Q1 <- quantile(rain_data$Annual, 0.25, na.rm = TRUE)
Q3 <- quantile(rain_data$Annual, 0.75, na.rm = TRUE)
IQR_value <- Q3 - Q1

lower_limit <- Q1 - 1.5 * IQR_value
upper_limit <- Q3 + 1.5 * IQR_value

rain_data <- rain_data %>%
  mutate(
    Outlier_Status = case_when(
      Annual < lower_limit | Annual > upper_limit ~ "Outlier",
      TRUE ~ "Normal"
    )
  )

# Show year labels every 2 years
year_breaks <- unique(rain_data$Year)
year_breaks_show <- year_breaks[seq(1, length(year_breaks), by = 2)]

# Annual rainfall bar chart with grey grid background, outliers, and trend line
ggplot(rain_data, aes(x = Year, y = Annual)) +
  geom_col(
    aes(fill = Rainfall_Level),
    colour = "black",
    alpha = 0.85,
    width = 0.7,
    na.rm = TRUE
  ) +
  geom_point(
    data = rain_data %>% filter(Outlier_Status == "Outlier"),
    aes(colour = Outlier_Status),
    size = 4,
    na.rm = TRUE
  ) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    colour = "blue",
    linewidth = 1.2,
    na.rm = TRUE
  ) +
  scale_fill_manual(
    values = c(
      "High" = "red",
      "Medium" = "orange",
      "Low" = "yellow"
    )
  ) +
  scale_colour_manual(
    values = c(
      "Outlier" = "purple"
    )
  ) +
  scale_x_continuous(
    breaks = year_breaks_show
  ) +
  scale_y_continuous(
    breaks = seq(0, max(rain_data$Annual, na.rm = TRUE) + 100, by = 100)
  ) +
  labs(
    title = "Annual Rainfall by Year with Trend Line",
    subtitle = "Adelaide Airport Station (023034)",
    x = "Year",
    y = "Annual Rainfall (mm)",
    fill = "Rainfall Level",
    colour = "Outlier Status"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8),
    axis.text.y = element_text(size = 10),
    
    # Grey background and easy-to-read grid lines
    panel.background = element_rect(fill = "grey95", colour = NA),
    plot.background = element_rect(fill = "white", colour = NA),
    panel.grid.major.y = element_line(colour = "grey60", linewidth = 0.5),
    panel.grid.minor.y = element_line(colour = "grey80", linewidth = 0.3),
    panel.grid.major.x = element_line(colour = "grey85", linewidth = 0.3),
    panel.grid.minor.x = element_blank(),
    
    legend.position = "right",
    legend.title = element_text(face = "bold")
  )