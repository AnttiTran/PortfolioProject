SELECT * from  Products;

SELECT firstname, lastname, birthdate FROM Employees;

SELECT DISTINCT Country FROM Customers;

SELECT * FROM Customers WHERE city = 'Helsinki';

SELECT * FROM Customers where city = 'Helsinki';

SELECT * FROM Customers Where city = 'Helsinki' OR city ='London'; 

SELECT * FROM Suppliers Where city = 'London';

SELECT suppliername, contactname, address, city from Suppliers where country IN ('UK', 'Sweden', 'Finland');

SELECT firstname, lastname, birthdate FROM Employees;

SELECT firstname, lastname, birthdate FROM Employees ORder By birthdate DESC

SELECT suppliername, city FROM Suppliers Where country = 'USA' Order by city 

SELECt COUNT (*) AS Number_Of_US_Customers FROM customers where country = 'USA';

SELECT COUNT (*) AS Full_Address from Customers where country  = 'Finland';

SELECT SUM(quantity) AS Tofujen_lkm FROM OrderDetails where productid = '14';

SELECT categoryid, SUM(price) from Products GROUP BY categoryid;

SELECT country, COUNT (country) AS customer_count from Customers GROUP BY country;

SELECT CategoryID, SUM(Price), COUNT(Price), SUM(Price) / COUNT(Price) AS Average
FROM Products GROUP BY CategoryID

#6
#1 Select * from Products, Categories where Products.CategoryID = Categories.CategoryID;

#2 SELECT Products.ProductName, Categories.CategoryName FROM Products, Categories where products.CategoryID = Categories.categoryID

#3 SELECT Products.ProductName, Products.Price from Products, Categories 
where categories.CategoryID = 'confecitons' 
and categories.CategoryID = products.CategoryID 
Order By Products.Price DESC

#7
#1  Mitkä ovat tuotteiden nimet, jotka kuuluvat Seafood-kategoriaan ja jotka on tuotettu Saksassa.

SELECT Products.ProductName from Products, Categories, Suppliers 
WHERE Products.CategoryID = Categories.CategoryID
and Products.SupplierID = Suppliers.SupplierID
And Categories.CategoryName = 'Seafood'
and Suppliers.Country = 'Germany'

#11

SELECT Products.ProductName, Categories.CategoryName 
from Products
Inner JOIN Categories
ON Products.CategoryID = Categories.CategoryID
where Categories.CategoryName = 'Dairy Products'

#JOIN: asiakkaan tilaukset

Select Customers.CustomerName, Orders.OrderID
From Customers 
inner JOin Orders
on Customers.customerID = Orders.CustomerID
Order by customername

#Leftjoin

SELECT Customers.customername,COUNT(Orders.OrderID) as Ordercount
from Customers
LEFT JOIN Orders
On customers.CustomerID = Orders.CustomerID
Group BY Customers.CustomerName
Order BY Ordercount DESC

#DATA-Business raportointi Categories

#1 Selvitä kuinka monta tilausta kuin työntekijä on hoittanut

#Eniten tilaus: Select employeeid, COUNT(orderid) as ordercount
FROM Orders
GROUP BY employeeid
Order by ordercount DESC

# Vähiten tilaus: SELECT employeeid, Count(orderid) As ordercount
from Orders
Group by employeeid
Order by ordercount DESC

# TOP 3-kärki 

SELECT employeeid, Count(orderid) As ordercount
from Orders
Group by employeeid
LIMIT 3

#2 mikä on asikas ostanut eniten js ostosten yhteisarvo

Select Customers.CustomerID, Customers.CustomerName, SUM(OrderDetails.quantity*Products.price) as Totalspent
FRom Customers
JOIN Orders On Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails on Orders.OrderID = OrderDetails.OrderID
JOIN Products On OrderDetails.ProductID = Products.ProductID
GROUP BY Customers.CustomerID, Customers.CustomerName
Order BY Totalspent DESC 
LIMIT 1;

# sama myös tuotteiden lukumäärän osalta 

Select Customers.CustomerID, Customers.CustomerName, 
SUM(OrderDetails.Quantity) as Totalquantity
FRom Customers
JOIN Orders On Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails on Orders.OrderID = OrderDetails.OrderID
GROUP BY Customers.CustomerID, Customers.CustomerName
Order BY Totalquantity DESC 
LIMIT 1;


