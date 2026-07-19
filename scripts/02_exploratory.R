# ============================================
# EBOLA DRC 2026 - Exploratory Analysis
# Author: Finho
# Date: June 2026
# Purpose: Explore and visualize outbreak data
# ============================================

library(tidyverse)

# Load the clean data we saved in script 01
ebola_data <- read.csv("data/clean/ebola_cases.csv")
ebola_data$date <- as.Date(ebola_data$date)

# ---- CHART 1: Case Growth Over Time ----
ggplot(ebola_data, aes(x = date, y = confirmed_cases)) +
    geom_line(color = "red", linewidth = 1.5) +
    geom_point(color = "darkred", size = 3) +
    labs(
        title = "Ebola Confirmed Cases Over Time — DRC 2026",
        subtitle = "Source: WHO Situation Reports", # nolint
        x = "Date",
        y = "Confirmed Cases"
    ) +
    theme_minimal()

# Save chart
ggsave("outputs/figures/01_case_growth.png", width = 10, height = 6)
cat("Chart 1 saved!")

# ---- CHART 2: Deaths Over Time ----
ggplot(ebola_data, aes(x = date, y = deaths)) +
    geom_bar(stat = "identity", fill = "darkred") +
    labs(
        title = "Ebola Deaths Over Time — DRC 2026",
        subtitle = "Source: WHO Situation Reports",
        x = "Date",
        y = "Total Deaths"
    ) +
    theme_minimal()

# Save chart
ggsave("outputs/figures/02_deaths.png", width = 10, height = 6)
cat("Chart 2 saved!")
