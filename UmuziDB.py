import psycopg2

connection = psycopg2.connect(user = 'user', password = 'pass', 
	host = '127.0.0.1', port = 5432, database = 'Umuzi')

cursor = connection.cursor()

create_table_customers = '''CREATE TABLE Customers(CustomerID SERIAL PRIMARY KEY,
FirstName VARCHAR(50), LastName VARCHAR(50), Gender VARCHAR,
Address VARCHAR(200), Phone VARCHAR(15), Email VARCHAR(100), City VARCHAR(20),
Country VARCHAR(50));'''

insert_query_customers = '''INSERT INTO Customers(FirstName, Lastname, Gender,
Address, Phone, Email, City, Country) VALUES('
Thando','Sithole','Female','240 Sect 1','0794445584','thando@gmail.com','Cape Town','South Africa'),
('Leon','Glen','Male','81 Everton Rd,Gillits','0820832830','Leon@gmail.com','Durban','South Africa'),
('Charl','Muller','M￼ale','290A Dorset Ecke','+44856872553','Charl.muller@yahoo.com','Berlin','Germany'),
('Julia','Stein','Female','22 Wernerring','+448672445058','Js234@yahoo.com','Frankfurt','Germany');'''


create_table_employees = '''CREATE TABLE Employees(EmployeeID SERIAL PRIMARY KEY,
FirstName VARCHAR(50), LastName VARCHAR(50), Email VARCHAR(100), JobTitle VARCHAR(20));'''

insert_query_employees = '''INSERT INTO Employees(FirstName, LastName, Email, JobTitle) 
VALUES('Kani','Matthew','mat@gmail.com','Manager'),
('Lesly','Cronje','LesC@gmail.com','Clerk'),
('Gideon','Maduku','m@gmail.com','Accountant');'''


create_table_orders = '''CREATE TABLE Orders(OrderID SERIAL PRIMARY KEY, 
ProductID INT REFERENCES Products(ProductID), PaymentID INT REFERENCES Payments(PaymentID),
FulfilledByEmployeeID INT REFERENCES Employees(EmployeeID), DateRequired DATE, DateShipped DATE,
Status VARCHAR(20));'''

insert_query_orders = '''INSERT INTO Orders(ProductID, PaymentID, FulfilledByEmployeeID, DateRequired, DateShipped, Status)
VALUES('1', '1', '2', '05-09-2018', NULL, 'Not shipped'),
('1', '2', '2', '04-09-2018', '03-09-2018', 'Shipped'),
('3', '3', '3', '06-09-2018', NULL, 'Not shipped');'''



create_table_payments = '''CREATE TABLE Payments(PaymentID SERIAL PRIMARY KEY,
CustomerID INT REFERENCES Customers(CustomerID), PaymentDate DATE, Amount DECIMAL);'''

insert_query_payments = '''INSERT INTO Payments(CustomerID, PaymentDate, Amount)
VALUES('1', '01-09-2018','150.75'),
('5', '03-09-2018', '150.75'),
('4','03-09-2018', '700.60');'''



create_table_products = '''CREATE TABLE Products(ProductID SERIAL PRIMARY KEY,
ProductName VARCHAR(100), Description VARCHAR(300), BuyPrice NUMERIC(6,2));'''


insert_query_products = '''INSERT INTO Products(ProductName, Description, BuyPrice) 
VALUES('Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', '150.75'),
('Classic Car', 'Turnable front wheels, steering function', '550.75'),
('Sports car', 'Turnable front wheels, steering function', '700.60');'''


cursor.execute()
connection.commit()
connection.close()


# Part 2: Querying a database
# All records fro table Customers
records = '''SELECT * FROM Customers;'''

#2 records from name column inthe Customer table
records = '''SELECT FirstName FROM Customers;'''

#3 Name of the Customer whose CustomerID is 1
name = '''SELECT FirstName FROM Customers WHERE CustomerID = 1;'''

#4 UPDATE the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso”
update_record = '''UPDATE Customers SET FirstName='Lerato',LastName='Mabitso' WHERE CustomerID=1;'''

#5 DELETE the record from the Customers table for customer 2 (CustomerID = 2).
 delete_record = '''DELETE FROM Customers WHERE CustomerID=2;'''

#6 Select all unique statuses from the Orders table and get a count of the number of orders for each unique status
unique_statuses = '''SELECT DISTINCT Status, COUNT(DISTINCT Status) Orders GROUP BY Status;'''

#7 MAXIMUM payment made on the PAYMENTS table
maximum_payment = '''SELECT MAX(Amount) FROM Payments;'''

#8 all customers from the “Customers” table, sorted by the “Country” column
sort_by_country = '''SELECT * FROM Customers ORDER BY Country ASC;'''

#9 all products with a price BETWEEN R100 and R600
price_between = '''SELECT * FROM Products WHERE BuyPrice BETWEEN 100 AND 600;'''

#10 all fields from “Customers” where country is “Germany” AND city is “Berlin”
Germany_Berlin = '''SELECT * FROM Customers WHERE Country='Germany' and City='Berlin';'''

#11 all fields from “Customers” where city is “Cape Town” OR “Durban”
CapeTown_or_Durban = '''SELECT * FROM Customers WHERE City='Cape Town' OR 'Durban';'''

#12 all records from Products where the Price is GREATER than R500
price_greater = '''SELECT * FROM Products WHERE Buyprice > 500;'''

#13 return the sum of the Amounts on the Payments table.
sum_amount = '''SELECT SUM(Amount) FROM Payments;'''

#14 number of shipped orders in the Orders table
shipped_orders = '''SELECT COUNT(Status) FROM Orders WHERE Status='Shipped';'''

#15 average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to the Dollar)
average_price = '''SELECT AVG(BuyPrice) AS RAND, AVG(BuyPrice/12) AS DOLLARS FROM Products;'''

#16 INNER JOIN create a query that selects all Payments with Customer information.
join_payments_customer = '''SELECT 
								Customers.CustomerID,
								Customers.FirstName,
								Customers.Lastname,
								Customers.Gender,
								Customers.Address,
								Customers.Phone,
								Customers.Email,
								Customers.City,
								Customers.Country,
								Payments.PaymentDate,
								Payments.Amount
							FROM
								Customers
							INNER JOIN Payments ON Customers.CustomerID=Payments.PaymentID;'''

#17 all products that have turnable front wheels
turnable_wheels = '''SELECT * FROM Products WHERE Description LIKE 'Turnable front wheels%';'''
