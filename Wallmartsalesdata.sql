  
  USE [Wallmart_Sales_Analysis];
  GO

    Select * FROM WalmartData;
   /*How many unique cities does the data have?*/
    Select Distinct(City) From WalmartData;

  /*Count no of branches in each city?*/
    Select City,Count(Branch) AS noofbrancheseachcity 
	FROM WalmartData
    GROUP BY City;

   /*How many unique product line does the data have?*/
   Select DISTINCT Product_line 
   FROM WalmartData;

   /*What product_line had the largest revenue?*/
   Select product_line,ROUND(SUM(Total),2) AS Revenue 
   FROM WalmartData
   GROUP BY product_line
   ORDER BY Revenue DESC;

   /*What city had the largest revenue?*/
     Select City,ROUND(SUM(Total),2) AS Revenue 
     FROM WalmartData
     GROUP BY City
     ORDER BY Revenue DESC;

  /*What product line had the largest VAT?*/
   Select product_line,ROUND(SUM(Tax_5),2) AS total_vat
   FROM WalmartData
   GROUP BY product_line
   ORDER BY total_vat DESC;


  /*What is most common payment method?*/
  Select Payment,Count(Payment) as paymed 
  FROM WalmartData
  GROUP BY Payment
  Order BY paymed desc;

  /*What is most selling product?*/
   Select Product_line,Round(count(total ),2) as total
   FROM WalmartData
   GROUP BY Product_line
   ORDER BY total DESC;


  /* What is the most common product line by gender?*/
    SELECT Gender, Product_line, COUNT(*) AS Count
   FROM WalmartData
   GROUP BY Gender, Product_line
   ORDER BY Gender, Count DESC;

   /*What is the average ratings for each product line*/
   Select product_line,ROUND(AVG(Rating),2) AS avg_rat 
   FROM WalmartData
   GROUP BY product_line
   ORDER BY avg_rat DESC;


   /*add column day name*/
   SELECT DATENAME(weekday, Date) AS day_name
   FROM WalmartData;
   /*ADD COLUMN*/
   ALTER TABLE WalmartData ADD day_name VARCHAR(10);
   /*UPDATE COLUMN*/
   UPDATE WalmartData
   SET day_name = DATENAME(weekday, [Date]);
   /* VIEW TABLE*/
   Select * FROM WalmartData;


   /*add column MONTH name*/
   SELECT DATENAME(MONTH, Date) AS month_name
   FROM WalmartData;
   /*ADD COLUMN*/
   ALTER TABLE WalmartData ADD month_name VARCHAR(10);
   /*UPDATE COLUMN*/
   UPDATE WalmartData
   SET month_name= DATENAME(MONTH, [Date]);
   /* VIEW TABLE*/
   Select * FROM WalmartData;

   /*What is revenue by each month?*/
    Select month_name,ROUND(SUM(total),2) AS revenue
    FROM WalmartData
    GROUP BY month_name
	ORDER BY revenue DESC;

  /*What month had the largest cogs?*/
    Select month_name,ROUND(SUM(cogs),2) AS cogs
    FROM WalmartData
    GROUP BY month_name
	ORDER BY cogs DESC;

  /*Which branch sold more project than average product sold*/
   Select Branch, SUM(Quantity) AS total_quantity 
   FROM WalmartData
   GROUP BY Branch
   ORDER BY total_quantity DESC;
