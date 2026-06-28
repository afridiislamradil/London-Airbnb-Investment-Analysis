-- Check total rows in raw table
SELECT COUNT(*) AS raw_bigquery_rows
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london`;

-- Check rows with missing price
SELECT COUNT(*) AS missing_price_rows
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london`
WHERE price IS NULL;

-- Check total rows in cleaned table
SELECT COUNT(*) AS clean_rows
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`;

-- Validate price
SELECT COUNT(*) AS invalid_price_rows
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
WHERE price <= 0;

-- Validate minimum nights
SELECT COUNT(*) AS invalid_minimum_nights
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
WHERE minimum_nights <= 0;

-- Validate availability
SELECT COUNT(*) AS invalid_availability
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
WHERE availability_365 < 0
   OR availability_365 > 365;

-- Validate reviews per month
SELECT COUNT(*) AS invalid_reviews_per_month
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
WHERE reviews_per_month < 0;

-- Validate number of reviews
SELECT COUNT(*) AS invalid_number_of_reviews
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
WHERE number_of_reviews < 0;

-- Validate host listing count
SELECT COUNT(*) AS invalid_host_listing_count
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
WHERE calculated_host_listings_count < 0;
