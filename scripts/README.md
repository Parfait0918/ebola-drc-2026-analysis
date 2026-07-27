DR CONGO EBOLA BUNDIBUGYO OUTBREAK 20226 - EPIDEMIC MODELING

## OVERVIEW

This project analyzes the 2026 Ebola Bundibugyo virus outbreak, which was a major cause of the denial of many Congolese visas to attend the 2026 FIFA World Cup in the U.S. As of July 8, 2026 there were 1759 confirmed cases including 600 deaths across
of 37 health zones affected. 

## Research Questions

1. Where and how fast is the outbreak spreading?
2. What does the Case Fatality tell us about the outbreak response?
3. What is the transmission rate and is the outbreak slowing?

## Key Findings

* Cases increased from 8 to 1759 in under 2 months
* Case Fatality Rates(CFR), calculated as CFR = (Deaths / Confirmed Cases) x 100, peaked at 83% in the chaos phase before dramatically dropping to 11% after World Health Organization(WHO) response.
* CFR is rising again toward 30%.
* The transmission rate(Rt) dropped from 11.39 to 1.82 showing the response is working but the outbreak is not over
* Ituri province accounts for 91% of all cases or about 1601 of 1759.

## Visualizations

* Case growth vs. Time 

![Case Growth](assets/01_case_growth.png)

* Deaths vs. time

![Deaths](assets/02_deaths.png)

* Cases Fatality Rate vs. Historical Bundibugyo Baseline(30%)

![CFR](assets/03_cfr.png)

* Confirmed cases vs deaths. comparison

![Cases vs Deaths](assets/04_cases_vs_deaths.png)

* New cases per reported period

![New Cases](assets/05_new_cases.png)

* Transmission Rate(Rt) vs Time

![Rt](assets/06_rt.png)

* Interactive map of the provinces affected

## Tools

* R : data cleaning, analysis, modeling, visualizations (ggplot2 for charts and graphs)
* Leaflet package for interactive map 
* VSCode 
* GitHub

## Data Sources

* WHO Disease Outbreak News DON602 (May 16, 2026)
* WHO Disease Outbreak News DON603 (May 22, 2026)
* ECDC Ebola Outbreak Tracker (updated July 9, 2026)
* WHO PHEIC Declaration (May 17, 2026)

## Interactive Map of Affected ProvinceS

The clickable map shows the affected provinces sized by case count. Ituri Province is leading all of DRC with 91% of confirmed cases. Although this is severe and concerning, it is important to note that the entire country is not infected but only a small region of eastern DRC is currently affected by the outbreak.

(https://rawcdn.githack.com/Parfait0918/ebola-drc-2026-analysis/main/outputs/figures/ebola_map.html)

## Author

Ngandu Parfait, Summer 2026.
