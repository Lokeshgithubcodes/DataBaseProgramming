use BikeStores

select *
from products;

create index priceRange
on products(price asc);

execute sp_helpindex products

---created Employees table

-- Create the updated Employees table with the Email column
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),  -- Adding the Email column
    Salary DECIMAL(10, 2),
    Department VARCHAR(50)
);

-- Insert values into the updated table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary, Department)
VALUES 
    (1, 'John', 'Doe', 'john.doe@example.com', 50000.00, 'IT'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', 60000.00, 'HR'),
    (3, 'Bob', 'Johnson', 'bob.johnson@example.com', 55000.00, 'Finance'),
    (4, 'Alice', 'Williams', 'alice.williams@example.com', 70000.00, 'IT'),
    (5, 'Charlie', 'Brown', 'charlie.brown@example.com', 48000.00, 'Marketing');




--clustered Index:



CREATE CLUSTERED INDEX IX_Employees_EmployeeID
ON Employees(EmployeeID);

--Non clustered Index:

CREATE NONCLUSTERED INDEX IX_Employees_LastName
ON Employees(LastName);

--Composite Index

CREATE NONCLUSTERED INDEX IX_Employees_Department
ON Employees(Department, Salary);

--Unique Index

CREATE UNIQUE NONCLUSTERED INDEX IX_Employees_Email
ON Employees(Email);

select *
from Employees;