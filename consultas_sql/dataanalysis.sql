-- Analisar o desempenho de vendas por categoria de produto, por mês
-- Analisar esses dados da loja que mais vendeu

-- Descobrir a loja que mais vendeu(em quantidade de itens)
WITH loja_mais_vendeu AS (
SELECT TOP(1)
	StoreName AS 'Nome_Loja',
	SUM(SalesQuantity) AS 'TotalVendido' 
FROM FactSales
LEFT JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY StoreName
ORDER BY TotalVendido DESC),
				cte_ordenada AS(
							SELECT 
								StoreName AS 'NomeLoja',
								ProductCategoryName AS 'Categoria',
								SUM(SalesQuantity) AS 'TotalVendas',
								CalendarYear AS 'Ano'
							FROM FactSales
							LEFT JOIN DimProduct
								ON FactSales.ProductKey = DimProduct.ProductKey
							LEFT JOIN DimProductSubcategory AS sub
								ON sub.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
							LEFT JOIN DimProductCategory AS cat
								ON sub.ProductCategoryKey = cat.ProductCategoryKey
							LEFT JOIN DimStore
								ON FactSales.StoreKey = DimStore.StoreKey
							LEFT JOIN DimDate
								ON FactSales.DateKey = DimDate.Datekey
							WHERE StoreName = (SELECT Nome_Loja FROM loja_mais_vendeu)
							GROUP BY ProductCategoryName,StoreName, CalendarYear)
							
SELECT * FROM cte_ordenada











