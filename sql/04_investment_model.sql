-- Weighted investment scoring model
-- Metrics:
-- Demand = 40%
-- Average price = 30%
-- Availability = 20%
-- Competition = 10%

WITH summary_table AS (
    SELECT
        neighbourhood,
        SUM(number_of_reviews) AS demand,
        AVG(price) AS avg_price,
        COUNT(*) AS total_listings,
        AVG(availability_365) AS avg_availability
    FROM `airbnb-case-study-london-2025.airbnb_london_analysis.airbnb_london_clean`
    GROUP BY neighbourhood
),

ranked_table AS (
    SELECT
        *,
        RANK() OVER (ORDER BY demand DESC) AS demand_rank,
        RANK() OVER (ORDER BY avg_price DESC) AS price_rank,
        RANK() OVER (ORDER BY total_listings ASC) AS competition_rank,
        RANK() OVER (ORDER BY avg_availability ASC) AS availability_rank
    FROM summary_table
)

SELECT
    neighbourhood,
    demand,
    avg_price,
    total_listings,
    avg_availability,
    demand_rank,
    price_rank,
    competition_rank,
    availability_rank,
    ROUND(
        ((35 - demand_rank) * 0.40) +
        ((35 - price_rank) * 0.30) +
        ((35 - competition_rank) * 0.10) +
        ((35 - availability_rank) * 0.20),
        2
    ) AS investment_score
FROM ranked_table
ORDER BY investment_score DESC;
