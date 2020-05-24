import psycopg2

connection = psycopg2.connect(user = 'user', password = 'pass', 
	host = '127.0.0.1', port = 5432, database = 'Umuzi')

cursor = connection.cursor()

create_table_query = '''CREATE TABLE Customers(CustomerID INT PRIMARY KEY NOT NULL,
FirstName VARCHAR(50), LastName VARCHAR(50), Gender VARCHAR,
Address VARCHAR(200), Phone VARCHAR(15), Email VARCHAR(100), City VARCHAR(20),
Country VARCHAR(50));'''

create_table_employees = '''CREATE TABLE Employees(EmployeeID INT PRIMARY KEY NOT NULL,
FirstName VARCHAR(50), LastName VARCHAR(50), Email VARCHAR(100), JobTitle VARCHAR(20));'''

cursor.execute(create_table_employees)
connection.commit()
connection.close()