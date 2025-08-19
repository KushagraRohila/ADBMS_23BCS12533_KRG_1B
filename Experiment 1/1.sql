--------------------Medium Problem--------------------
CREATE TABLE TBL_AUTHOR(
AUTHOR_ID INT PRIMARY KEY,
AUTHOR_NAME VARCHAR(30));
 
CREATE TABLE TBL_BOOK(
BOOK_ID INT PRIMARY KEY, 
BOOK_TITLE VARCHAR(30), 
AUTHOR_ID INT, 
FOREIGN KEY (AUTHOR_ID) REFERENCES TBL_AUTHOR(AUTHOR_ID));

INSERT INTO TBL_AUTHOR (AUTHOR_ID, AUTHOR_NAME) VALUES
(1, 'C.J. Date'),
(2, 'Silberschatz'),
(3, 'A. Tanenbaum');

INSERT INTO TBL_BOOK (BOOK_ID, BOOK_TITLE, AUTHOR_ID) VALUES
(101, 'Database Systems', 1),
(102, 'Operating Systems', 2),
(103, 'Computer Networks', 3),
(104, 'Advanced Databases', 1),  
(105, 'Modern OS', 2);

SELECT * FROM TBL_BOOK;
SELECT * FROM TBL_AUTHOR;

SELECT B.BOOK_TITLE , A.AUTHOR_NAME
FROM TBL_BOOK AS B
INNER JOIN
TBL_AUTHOR AS A
ON 
B.AUTHOR_ID = A.AUTHOR_ID;







---------------------Hard Problem--------------------
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Civil Engineering'),
(5, 'Mathematics');

INSERT INTO Courses (course_id, course_name, department_id) VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Machine Learning', 1),
(104, 'Thermodynamics', 2),
(105, 'Fluid Mechanics', 2),
(106, 'Circuits and Systems', 3),
(107, 'Control Systems', 3),
(108, 'Structural Analysis', 4),
(109, 'Linear Algebra', 5),
(110, 'Calculus', 5),
(111, 'Probability Theory', 5);

SELECT 
    department_name,
    (SELECT COUNT(*) 
     FROM Courses c 
     WHERE c.department_id = d.department_id) AS course_count
FROM Departments d;

SELECT 
    department_name,
    (SELECT COUNT(*) 
     FROM Courses c 
     WHERE c.department_id = d.department_id) AS course_count
FROM Departments d
WHERE (SELECT COUNT(*) 
       FROM Courses c 
       WHERE c.department_id = d.department_id) > 2;
