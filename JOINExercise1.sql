/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT bp.Name, bc.Name FROM bestbuy.products as bp
LEFT JOIN bestbuy.categories as bc ON bp.CategoryID = bc.CategoryID;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT bp.Name, bp.Price, br.Rating 
FROM bestbuy.products as bp
RIGHT JOIN bestbuy.reviews AS br ON bp.ProductID = br.ProductID
WHERE br.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT be.EmployeeID, be.FirstName AS "First Name", be.LastName AS "Last Name", sum(bs.PricePerUnit * bs.Quantity) AS "Sales Total"
FROM bestbuy.employees as be
RIGHT JOIN bestbuy.sales as bs ON bs.EmployeeID = be.EmployeeID
GROUP BY bs.EmployeeID;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT  bp.Name as ProductName, bd.Name as DepartmentName, bc.Name as CategoryName
FROM bestbuy.products as bp
LEFT JOIN bestbuy.categories as bc ON bp.CategoryID = bc.CategoryID, bestbuy.departments as bd
WHERE bp.CategoryID =  2 OR bp.CategoryID = 8;

/* joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California --You may need to use SUM() */
 SELECT bp.Name AS "Product Name", SUM(bs.Quantity) AS "Total Sold", sum(bs.Quantity * bs.PricePerUnit) AS "Total Cost"
 FROM bestbuy.products AS bp
 INNER JOIN bestbuy.sales AS bs ON bp.ProductID = bs.ProductID
 WHERE bp.Name = 'Eagles: Hotel California';
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT bp.Name, br.Reviewer, br.Rating, br.Comment
FROM bestbuy.products AS bp
INNER JOIN bestbuy.reviews AS br ON bp.ProductID = br.ProductID
WHERE bp.Name = 'Visio TV' AND br.Rating =1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
/* DJP - Sorry, this was my best shot.  Close but no cigar. */
SELECT be.EmployeeID, be.FirstName AS "First Name", be.LastName AS "Last Name", bp.Name, count(bs.Quantity) AS "Quantity"
FROM bestbuy.employees AS be
LEFT JOIN bestbuy.sales AS bs ON be.EmployeeID = bs.EmployeeID, bestbuy.products AS bp
GROUP BY be.EmployeeID, bp.Name;