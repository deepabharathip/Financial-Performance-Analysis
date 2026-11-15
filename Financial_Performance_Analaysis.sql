CREATE DATABASE Financial_Analysis;
USE Financial_Analysis;
SHOW TABLES;
SELECT COUNT(*)
FROM financial_performance_50000;
SELECT*FROM financial_performance_50000
LIMIT 5;
SELECT
    SUM(Revenue) AS Total_Revenue,
    SUM(Total_Expense) AS Total_Expenses,
    SUM(Profit) AS Total_Profit
FROM financial_performance_50000;

SELECT
    Region,
    SUM(Revenue) AS Total_Revenue,
    SUM(Total_Expense) AS Total_Expenses,
    SUM(Profit) AS Total_Profit
FROM financial_performance_50000
GROUP BY Region
ORDER BY Total_Profit DESC;
SELECT
    Product_Category,
    SUM(Revenue) AS Total_Revenue,
    SUM(Total_Expense) AS Total_Expenses,
    SUM(Profit) AS Total_Profit
FROM financial_performance_50000
GROUP BY Product_Category
ORDER BY Total_Profit DESC;

SELECT
    Year,
    SUM(Revenue) AS Total_Revenue,
    SUM(Total_Expense) AS Total_Expenses,
    SUM(Profit) AS Total_Profit
FROM financial_performance_50000
GROUP BY Year
ORDER BY Year;

SELECT
    Month_No,
    Month,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM financial_performance_50000
GROUP BY Month_No, Month
ORDER BY Month_No;

SELECT
    Product_Category,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM financial_performance_50000
GROUP BY Product_Category
ORDER BY Profit_Margin_Percentage DESC;

SELECT
    Product,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM financial_performance_50000
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 5;

SELECT
    Sales_Channel,
    SUM(Revenue) AS Total_Revenue,
    SUM(Total_Expense) AS Total_Expenses,
    SUM(Profit) AS Total_Profit
FROM financial_performance_50000
GROUP BY Sales_Channel
ORDER BY Total_Profit DESC;

SELECT
    Payment_Method,
    COUNT(*) AS Total_Transactions,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM financial_performance_50000
GROUP BY Payment_Method
ORDER BY Total_Revenue DESC;


SELECT
    Transaction_ID,
    Date,
    Region,
    Product_Category,
    Revenue,
    Total_Expense,
    Profit
FROM financial_performance_50000
WHERE Total_Expense > Revenue
   OR Profit < 0
ORDER BY Profit ASC;

SELECT COUNT(*) AS Total_Records
FROM financial_performance_50000;

SELECT
    SUM(Revenue IS NULL) AS Missing_Revenue,
    SUM(Total_Expense IS NULL) AS Missing_Expense,
    SUM(Profit IS NULL) AS Missing_Profit,
    SUM(Date IS NULL) AS Missing_Date
FROM financial_performance_50000;

SELECT
    Transaction_ID,
    COUNT(*) AS Duplicate_Count
FROM financial_performance_50000
GROUP BY Transaction_ID
HAVING COUNT(*) > 1;