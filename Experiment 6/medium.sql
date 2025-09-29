
CREATE TABLE Employee (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    salary NUMERIC(10,2) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO Employee (id, name, gender, salary, city)
VALUES
(1, 'Alok', 'Male', 50000.00, 'Delhi'),
(2, 'Priya', 'Male', 60000.00, 'Mumbai'),
(3, 'Rajesh', 'Female', 45000.00, 'Bangalore'),
(4, 'Sneha', 'Male', 55000.00, 'Chennai'),
(5, 'Anil', 'Male', 52000.00, 'Hyderabad'),
(6, 'Sunita', 'Female', 48000.00, 'Kolkata'),
(7, 'Vijay', 'Male', 47000.00, 'Pune'),
(8, 'Ritivik', 'Male', 62000.00, 'Ahmedabad'),
(9, 'Amrita', 'Female', 51000.00, 'Jaipur');


create or replace procedure count_employee(in gender varchar(50), out tCount int)
language plpgsql as

$$

	Begin
	select count(*) into tCount
	from 
	Employee as e
	where e.gender = count_employee.gender;

	raise notice 'Total number of % : %',gender,tCount;

	end;
$$

call count_employee('Male',0);