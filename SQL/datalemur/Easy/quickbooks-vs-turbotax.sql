'''
Intuit provides a range of tax filing products, including TurboTax and QuickBooks, available in various versions.
Write a query to determine the total number of tax filings made using TurboTax and QuickBooks. Each user can file taxes once a year using only one product.

'''
WITH turbotax_count_cte AS (
    SELECT count(product) as total_count 
    FROM filed_taxes
    WHERE product LIKE '%TurboTax%'
),
quickbooks_count_cte AS ( 
  SELECT count(product) as total_count 
    FROM filed_taxes
    WHERE product LIKE '%QuickBooks%'
)
SELECT
    (SELECT total_count FROM turbotax_count_cte) as turbotax_total, 
    (SELECT total_count FROM quickbooks_count_cte) as quickbooks_total; 


# or with CASE STATEMENT you can do this 


SELECT
    COUNT(CASE WHEN product LIKE '%TurboTax%' THEN 1 END) AS turbotax_total,
    COUNT(CASE WHEN product LIKE '%QuickBooks%' THEN 1 END) AS quickbooks_total
FROM
    filed_taxes;