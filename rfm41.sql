-- Declare today's date as a variable
SET @TODAY_DATE  = '2006-01-01';

-- Calculate the most recent order date for each customer using a CTE
CREATE TEMPORARY TABLE RECENCY_TABLE AS
WITH recent_orders AS (
    SELECT 
        CUSTOMERNAME,
        MAX(ORDERDATE) AS last_order_date,
        DATEDIFF(@TODAY_DATE,MAX(ORDERDATE)) AS recency
    FROM MOTODATA
    GROUP BY CUSTOMERNAME
)

-- Calculate recency as the difference between today's date and the last order date
SELECT 
    ro.CUSTOMERNAME,
    ro.recency,
    NTILE(5) OVER (ORDER BY ro.recency) AS recency_score
FROM recent_orders ro;

SELECT * FROM RECENCY_TABLE;













