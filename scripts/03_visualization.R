# ============================================
# EBOLA DRC 2026 - Advanced Visualizations
# Author: Finho
# Date: June 2026
# Purpose: CFR analysis + combined charts
# ============================================

library(tidyverse)

# Load clean data
ebola_data <- read.csv("data/clean/ebola_cases.csv")
ebola_data$date <- as.Date(ebola_data$date)

# CFR = deaths divided by confirmed cases x 100
ebola_data <- ebola_data |>
    mutate(cfr = round((deaths / confirmed_cases) * 100, 1))

print(ebola_data)

# CHART 3: Case Fatality Rate Over Time 
ggplot(ebola_data, aes(x = date, y = cfr)) +
    geom_line(color = "orange", linewidth = 1.5) +
    geom_point(color = "darkorange", size = 3) +
    geom_hline(yintercept = 30, linetype = "dashed", color = "red") +
    annotate("text",
        x = min(ebola_data$date), y = 32,
        label = "Historical Bundibugyo CFR floor (30%)",
        hjust = 0, color = "red", size = 3.5) +
    labs(title = "Case Fatality Rate Over Time — DRC Ebola 2026",
        subtitle = "Dashed line = historical Bundibugyo minimum CFR",
        x = "Date",
        y = "CFR (%)") + theme_minimal()

ggsave("outputs/figures/03_cfr.png", width = 10, height = 6)
cat("Chart 3 saved!\n")

# CHART 4: Cases vs Deaths Combined 
ggplot(ebola_data) +
    geom_line(aes(x = date, y = confirmed_cases, color = "Confirmed Cases"),
        linewidth = 1.5) +
    geom_line(aes(x = date, y = deaths, color = "Deaths"),
        linewidth = 1.5) +
    geom_point(aes(x = date, y = confirmed_cases, color = "Confirmed Cases"),
        size = 3) +
    geom_point(aes(x = date, y = deaths, color = "Deaths"), size = 3) +
    scale_color_manual(values = c("Confirmed Cases" = "red", "Deaths" = "darkred")) +
    labs(title = "Confirmed Cases vs Deaths — DRC Ebola 2026",
        subtitle = "Source: WHO Situation Reports",
        x = "Date",
        y = "Count",
        color = "Legend") + theme_minimal()

ggsave("outputs/figures/04_cases_vs_deaths.png", width = 10, height = 6)
cat("Chart 4 saved!\n")
