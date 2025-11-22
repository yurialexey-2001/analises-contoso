WITH vendas AS (
	SELECT 
	StoreName AS 'Nome_Loja',
	SUM(SalesAmount) AS 'Vendas_ano',
	CalendarYear AS 'Ano'
FROM FactSales AS f
JOIN DimStore AS d
	ON f.StoreKey = d.StoreKey
JOIN DimDate AS dd
	ON f.DateKey = dd.Datekey
GROUP BY CalendarYear,StoreName)

SELECT 
	Nome_Loja,
	Ano,
	Vendas_ano,
	FORMAT((Vendas_ano - LAG(Vendas_ano) OVER(ORDER BY Ano)) / LAG(Vendas_ano) OVER(ORDER BY Ano),'P2','pt-br') AS 'YoY'
FROM vendas
WHERE Nome_Loja ='Contoso Buffalo Store'