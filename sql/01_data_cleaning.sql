-- Create cleaned Airbnb London table
-- Removes listings with missing price values

CREATE TABLE `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean` AS
SELECT *
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london`
WHERE price IS NOT NULL;
