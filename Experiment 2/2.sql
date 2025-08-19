----------Medium Problem----------
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT NULL 
);


ALTER TABLE Employee
ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmpID);


INSERT INTO Employee (EmpID, EmpName, Department, ManagerID)
VALUES
(1, 'Alice', 'HR', NULL),       
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT', 1),
(4, 'David', 'Finance', 2),
(5, 'Eve', 'IT', 3),
(6, 'Frank', 'HR', 1);

SELECT 
E.EmpName AS [EmployeeName], 
E.Department AS [EmployeeDept], 
M.EmpName AS [Manager Name], 
M.Department AS [ManagerDept]
FROM Employee AS E
JOIN Employee AS M 
ON E.ManagerId = M.EmpID;









----------------------Hard Problem--------------------

CREATE TABLE YEARS_TBL(
 ID INT,
 YEAR INT,
 NPV INT
)
INSERT INTO YEARS_TBL(ID, YEAR, NPV) 
VALUES
(1,2018,100),
(7,2020,30),
(13,2019,40),
(1,2019,113),
(2,2008,121),
(3,2002,12),
(11,2020,99),
(7,2019,0);

CREATE TABLE QUERIES_TBL(
ID INT,
YEAR INT
);
INSERT INTO QUERIES_TBL(ID, YEAR) 
VALUES
(1,2019),
(2,2008),
(3,2009),
(7,2018),
(7,2019),
(7,2020),
(13,2019);

SELECT Q.*,ISNULL(Y.NPV,0) AS [NPV]
FROM
YEARS_TBL AS Y
RIGHT OUTER JOIN
QUERIES_TBL AS Q
ON 
Y.ID = Q.ID 
AND
Y.YEAR = Q.YEAR