# ============================================
# EBOLA DRC 2026 - Interactive Map
# Author: Finho
# Date: July 2026
# Purpose: Map affected provinces in DRC
# ============================================

library(leaflet)
library(tidyverse)

# Province level data from ECDC July 8 report
province_data <- data.frame(
    province = c("Ituri", "North Kivu", "South Kivu", "Kampala (Uganda)"),
    lat = c(1.8722, -0.5167, -2.5000, 0.3476),
    lng = c(30.0888, 29.2167, 28.8333, 32.5825),
    cases = c(1601, 155, 3, 20),
    deaths = c(511, 88, 1, 2),
    health_zones_affected = c(25, 11, 1, NA),
    country = c("DRC", "DRC", "DRC", "Uganda")
)

# Add CFR column
province_data <- province_data %>%
    mutate(cfr = round((deaths / cases) * 100, 1))

# Create color palette based on case count
pal <- colorNumeric(
    palette = c("yellow", "orange", "red", "darkred"),
    domain = province_data$cases
)

# Build interactive map
map <- leaflet(province_data) %>%
    addTiles() %>%
    setView(lng = 29.5, lat = 0.5, zoom = 6) %>%
    addCircleMarkers(
        lat = ~lat,
        lng = ~lng,
        radius = ~ sqrt(cases) * 1.5,
        color = ~ pal(cases),
        fillOpacity = 0.8,
        popup = ~ paste0(
            "<b>", province, "</b><br>",
            "Country: ", country, "<br>",
            "Confirmed Cases: ", cases, "<br>",
            "Deaths: ", deaths, "<br>",
            "CFR: ", cfr, "%<br>",
            "Health Zones Affected: ",
            ifelse(is.na(health_zones_affected),
                "N/A", health_zones_affected
            )
        )
    ) %>%
    addLegend(
        position = "bottomright",
        pal = pal,
        values = ~cases,
        title = "Confirmed Cases",
        opacity = 0.8
    ) %>%
    addControl(
        "<b>Ebola Bundibugyo Outbreak — DRC & Uganda 2026</b><br>
     Source: ECDC & WHO | Click circles for details",
        position = "topright"
    )

# Save as interactive HTML file
install.packages("htmlwidgets")
library(htmlwidgets)
saveWidget(map, "outputs/figures/ebola_map.html", selfcontained = FALSE)
cat("Interactive map saved!\n")
