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

insert_query_employees = '''INSERT INTO Employees(FirstName, LastName, Email, JobTitle) VALUES('
Kani','Matthew','mat@gmail.com','Manager'),
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

cursor.execute(insert_query_orders)
connection.commit()
connection.close()