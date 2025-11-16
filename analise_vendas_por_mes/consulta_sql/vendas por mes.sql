
SELECT 
	RIGHT(CalendarMonth,2) AS 'Mês',
	CalendarYear AS 'Ano',
	(SUM(SalesAmount) - SUM(DiscountAmount)) AS 'Total Faturado'
FROM FactSales AS f
LEFT JOIN DimDate AS d
	ON f.DateKey = d.Datekey
GROUP BY
	CalendarMonth,
	CalendarYear
ORDER BY 
	CalendarYear,
	CalendarMonth 




