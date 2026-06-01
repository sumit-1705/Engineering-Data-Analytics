library(tidyverse)

# Load Adelaide Airport file first
adelaide_airport <- read.csv(file.choose(), na.strings = c("", "NA", "null"))

# Load Kent Town file second
kent_town <- read.csv(file.choose(), na.strings = c("", "NA", "null"))

# Prepare Adelaide Airport data
adelaide_airport <- adelaide_airport %>%
  mutate(
    Year = as.numeric(Year),
    Annual = as.numeric(Annual),
    Station = "Adelaide Airport (023034)"
  ) %>%
  select(Year, Annual, Station)

# Prepare Kent Town data
kent_town <- kent_town %>%
  mutate(
    Year = as.numeric(Year),
    Annual = as.numeric(Annual),
    Station = "Kent Town (023090)"
  ) %>%
  select(Year, Annual, Station)

# Combine both stations
combined_rainfall <- bind_rows(adelaide_airport, kent_town)

# Line graph: Year on x-axis, Annual Rainfall on y-axis
ggplot(combined_rainfall, aes(x = Year, y = Annual, colour = Station)) +
  geom_line(linewidth = 1.1, na.rm = TRUE) +
  geom_point(size = 2.2, na.rm = TRUE) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    linewidth = 1.1,
    linetype = "dashed",
    na.rm = TRUE
  ) +
  labs(
    title = "Annual Rainfall Comparison by Year",
    subtitle = "Adelaide Airport (023034) and Kent Town (023090)",
    x = "Year",
    y = "Annual Rainfall (mm)",
    colour = "Station"
  ) +
  scale_x_continuous(
    breaks = seq(min(combined_rainfall$Year, na.rm = TRUE),
                 max(combined_rainfall$Year, na.rm = TRUE),
                 by = 2)
  ) +
  scale_y_continuous(
    breaks = seq(0, max(combined_rainfall$Annual, na.rm = TRUE) + 100, by = 100)
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8),
    axis.text.y = element_text(size = 10),
    legend.position = "right",
    legend.title = element_text(face = "bold"),
    
    # Grey background and grid lines
    panel.background = element_rect(fill = "grey95", colour = NA),
    panel.grid.major.y = element_line(colour = "grey60", linewidth = 0.5),
    panel.grid.minor.y = element_line(colour = "grey80", linewidth = 0.3),
    panel.grid.major.x = element_line(colour = "grey85", linewidth = 0.3),
    panel.grid.minor.x = element_blank()
  )