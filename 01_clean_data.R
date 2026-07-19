# ============================================
# EBOLA DRC 2026 - Data Cleaning Script
# Author: Finho
# Date: June 2026
# Purpose: Load and clean WHO outbreak data
# ============================================

options(repos = c(CRAN = "https://cloud.r-project.org"))

library(tidyverse)
library(lubridate)
library(janitor)

ebola_data <- data.frame(
    date = as.Date(c(
        "2026-05-15", "2026-05-16", "2026-05-18",
        "2026-05-21", "2026-06-08", "2026-06-14", "2026-07-08"
    )),
    confirmed_cases = c(8, 8, 12, 85, 598, 808, 1759),
    suspected_cases = c(246, 246, 528, 746, NA, NA, NA),
    deaths = c(4, 4, 10, 10, 115, 192, 600),
    recovered = c(NA, NA, NA, NA, NA, NA, 285),
    hospitalized = c(NA, NA, NA, NA, NA, 363, 750),
    country = c("DRC", "DRC", "DRC+Uganda", "DRC+Uganda", "DRC+Uganda", "DRC+Uganda", "DRC+Uganda")
)
print(ebola_data)

write.csv(ebola_data, "data/clean/ebola_cases.csv", row.names = FALSE)
cat("Data saved successfully!\n")
