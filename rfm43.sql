
CREATE TEMPORARY TABLE monetory_table AS
WITH monetory AS (
    SELECT CUSTOMERNAME, sum(SALES) AS TOTAL_MONEY
    FROM MOTODATA 
    GROUP BY CUSTOMERNAME
)
SELECT  
    m.CUSTOMERNAME,
    m.TOTAL_MONEY,
    NTILE(5) OVER (ORDER BY m.TOTAL_MONEY) AS monetory_score
FROM monetory m;

select * from monetory_table;




