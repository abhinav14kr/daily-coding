The Bloomberg terminal is the go-to resource for financial professionals, offering convenient access to a wide array of financial datasets. As a Data Analyst at Bloomberg, you have access to historical data on stock performance.

Currently, you're analyzing the highest and lowest open prices for each FAANG stock by month over the years.

For each FAANG stock, display the ticker symbol, the month and year ('Mon-YYYY') with the corresponding highest and lowest open prices (refer to the Example Output format). Ensure that the results are sorted by ticker symbol.

stock_prices Example Input:
Note that the table below displays randomly selected AAPL data.

date	ticker	open	high	low	close
01/31/2023 00:00:00	AAPL	142.28	142.70	144.34	144.29
02/28/2023 00:00:00	AAPL	146.83	147.05	149.08	147.41
03/31/2023 00:00:00	AAPL	161.91	162.44	165.00	164.90
04/30/2023 00:00:00	AAPL	167.88	168.49	169.85	169.68
05/31/2023 00:00:00	AAPL	176.76	177.33	179.35	177.25
Example Output:
ticker	highest_mth	highest_open	lowest_mth	lowest_open
AAPL	May-2023	176.76	Jan-2023	142.28
Apple Inc. (AAPL) achieved its highest opening price of $176.76 in May 2023 and its lowest opening price of $142.28 in January 2023.

SOLUTION: 


WITH FIRST_CTE AS (
 SELECT 
  ticker,
  TO_CHAR(date, 'Mon-YYYY') AS highest_mth,
  MAX(open) AS highest_open,
  ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open DESC) AS row_num
FROM stock_prices
GROUP BY 1,2,open
)
, 
SECOND_CTE AS (
 SELECT 
  ticker,
  TO_CHAR(date, 'Mon-YYYY') AS lowest_mth,
  MIN(open) AS lowest_open,
  ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open ASC) AS row_num
FROM stock_prices
GROUP BY 1,2, open
)

SELECT 
  f.ticker, 
  f.highest_mth,
  f.highest_open,
  s.lowest_mth,
  s.lowest_open
FROM FIRST_CTE F 
JOIN SECOND_CTE S 
ON f.ticker = s.ticker
AND F.row_num = 1 AND S.row_num = 1
ORDER BY f.ticker
; 

