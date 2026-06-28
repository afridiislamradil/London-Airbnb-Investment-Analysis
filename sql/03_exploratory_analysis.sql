-- Top neighbourhoods by historical demand
SELECT
    neighbourhood,
    SUM(number_of_reviews) AS total_reviews
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
GROUP BY neighbourhood
ORDER BY total_reviews DESC
LIMIT 10;

-- Top neighbourhoods by average nightly price
SELECT
    neighbourhood,
    AVG(price) AS avg_price
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
GROUP BY neighbourhood
ORDER BY avg_price DESC
LIMIT 10;

-- Neighbourhoods with highest market competition
SELECT
    neighbourhood,
    COUNT(*) AS total_listings
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
GROUP BY neighbourhood
ORDER BY total_listings DESC
LIMIT 10;

-- Neighbourhoods with lowest average availability
SELECT
    neighbourhood,
    AVG(availability_365) AS avg_availability
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
GROUP BY neighbourhood
ORDER BY avg_availability ASC
LIMIT 10;

-- Room type demand
SELECT
    room_type,
    SUM(number_of_reviews) AS total_reviews
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
GROUP BY room_type
ORDER BY total_reviews DESC;

-- Room type average price
SELECT
    room_type,
    AVG(price) AS avg_price
FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
GROUP BY room_type
ORDER BY avg_price DESC;
