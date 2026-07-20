# ============================================
# EBOLA DRC 2026 - Epidemic Modeling
# Author: Finho
# Date: June 2026
# Purpose: Model transmission rate (Rt) and
#          build a SIR epidemic model
# ============================================

library(tidyverse)

# Load clean data
ebola_data <- read.csv("data/clean/ebola_cases.csv")
ebola_data$date <- as.Date(ebola_data$date)

# ---- PART 1: Calculate Growth Rate ----
# How fast are cases doubling?
ebola_data <- ebola_data |>
    mutate(
        new_cases = confirmed_cases - lag(confirmed_cases),
        growth_rate = round((confirmed_cases / lag(confirmed_cases)), 2)
    )

print(ebola_data)

# ---- PART 2: Estimate Rt ----
# Rt = how many people does 1 infected person spread it to
# Bundibugyo serial interval = ~12 days (time between cases)
# Simple Rt estimate = growth rate ^ serial interval

serial_interval <- 12

ebola_data <- ebola_data |>
    mutate(Rt = round(growth_rate^(serial_interval / as.numeric(difftime(date, lag(date), units = "days"))), 2))

cat("\n--- Rt Estimates ---\n")
print(ebola_data %>% select(date, confirmed_cases, new_cases, Rt))

# CHART 5: New Cases Per Reporting Period
ggplot(ebola_data |> filter(!is.na(new_cases)), aes(x = date, y = new_cases)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    labs(title = "New Confirmed Cases Per Reporting Period — DRC Ebola 2026",
        subtitle = "Source: WHO Situation Reports",
        x = "Date",
        y = "New Cases") +
    theme_minimal()

ggsave("outputs/figures/05_new_cases.png", width = 10, height = 6)
cat("Chart 5 saved!\n")

#CHART 6: Rt Over Time 
ggplot(ebola_data |>
    filter(!is.na(Rt) & Rt < 20), aes(x = date, y = Rt)) +
    geom_line(color = "purple", linewidth = 1.5) +
    geom_point(color = "purple", size = 3) +
    geom_hline(yintercept = 1, linetype = "dashed", color = "red") +
    annotate("text",
        x = min(ebola_data$date, na.rm = TRUE),
        y = 1.2, label = "Rt = 1 (outbreak threshold)",
        hjust = 0, color = "red", size = 3.5) +
    labs(title = "Estimated Transmission Rate (Rt) — DRC Ebola 2026",
        subtitle = "Rt > 1 means outbreak is growing. Rt < 1 means it is slowing.",
        x = "Date",
        y = "Rt") +
    theme_minimal()

ggsave("outputs/figures/06_rt.png", width = 10, height = 6)
cat("Chart 6 saved!\n")
