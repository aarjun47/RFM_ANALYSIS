-- Identify the formats in ORDERDATE
SELECT ORDERDATE, 
       STR_TO_DATE(ORDERDATE, '%m/%d/%Y') AS parsed_mm_dd_yyyy,
       STR_TO_DATE(ORDERDATE, '%d-%m-%Y') AS parsed_dd_mm_yyyy,
       STR_TO_DATE(ORDERDATE, '%Y-%m-%d') AS parsed_yyyy_mm_dd
FROM MOTODATA
LIMIT 10;

-- Update dates in MM/DD/YYYY format to YYYY-MM-DD
UPDATE MOTODATA
SET ORDERDATE = DATE_FORMAT(STR_TO_DATE(ORDERDATE, '%m/%d/%Y'), '%Y-%m-%d')
WHERE ORDERDATE REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$';

-- Update dates in DD-MM-YYYY format to YYYY-MM-DD
UPDATE MOTODATA
SET ORDERDATE = DATE_FORMAT(STR_TO_DATE(ORDERDATE, '%d-%m-%Y'), '%Y-%m-%d')
WHERE ORDERDATE REGEXP '^[0-9]{1,2}-[0-9]{1,2}-[0-9]{4}$';
