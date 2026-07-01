CREATE DATABASE university;
USE university ;

CREATE TABLE student(
rollno INT PRIMARY KEY ,
name VARCHAR(50) ,
marks INT NOT NULL,
grade VARCHAR(50) ,  
city VARCHAR(50)
);

-- CREATE TABLE dept(
-- id INT PRIMARY KEY ,
-- name VARCHAR(50) 
-- );

-- INSERT INTO dept
-- VALUES 
-- (101,"ENGLISH"),
-- (103,"IT");

-- SELECT*FROM dept;


-- UPDATE dept       -- ----- in this we update in dept table and changes perform automatically in tacher1 table
-- SET id = 104
-- WHERE id = 103;



-- CREATE TABLE teacher1(
-- id INT PRIMARY KEY ,       
-- name VARCHAR(50) ,
-- dept_id INT,
-- FOREIGN KEY (dept_id) REFERENCES dept(id)   -- ---CASCADE USE WHEN USE FOREIGN KEY IF CHANGE ONE DATA THEN THE CHANGES REFLECT EVERYWHERE
-- ON UPDATE CASCADE
-- ON DELETE CASCADE
-- );

--  
-- INSERT INTO teacher1
-- (id,name ,dept_id)
-- VALUES 
-- (101,"aditi",101),
-- (104,"neha",103);
--  
--  SELECT*FROM teacher1;
 
 
 INSERT INTO student
 (rollno,name,marks,grade,city)
 VALUES 
(101,"SHIVAM",78,"A","NOIDA"),
(102,"VISAHL",73,"B","GHAZIABAD"),
(103,"KARAN",78,"C","DELHI"),
(104,"MANISHA",78,"A","AGRA"),
(105,"AKASH",78,"D","GOA"),
(106,"MAJOR",78,"C","PUNE");


SELECT DISTINCT name,marks,city,rollno FROM student;      -- (DISTINCT) PROVIDE DIFFERENT DATA

SELECT * FROM student WHERE marks>=78;   -- (WHERE is used for apply condition in rows----> NAME OF OBJECT AFTER used (BETWEEN),(IN),(NOT IN)) TO DEFINE SOME CONDITION

SELECT * FROM student;


SELECT * FROM student ORDER BY city ASC;      -- ---- Its used for ordering the data in ascending or descending order (ASC) (DESC)

-- LIMIT 3;   ----- Its is used for limit

SELECT COUNT(city)FROM student;       -- ----> its have a multiple value and retun single value
SELECT MAX(marks)FROM student;
SELECT MIN(marks)FROM student;     -- ------> its is aggregate function 
SELECT SUM(marks)FROM student;
SELECT AVG(marks)FROM student;


SELECT city FROM student GROUP BY city;          -- ---> its used for grouping CLAUSE

SELECT city,name,COUNT(marks) FROM student GROUP BY city,name;   -- ----->   its used for aggregate inside the grouping CLAUSE

SELECT city,COUNT(marks) FROM student GROUP BY city;     -- ------>   its used for aggregate inside the GROUPING CLAUSE




-- HAVING CLAUSE IS USED FOR APPLYING CONDITION AFTER GROUPING CLAUSE

-- KEY POINT WE CANT USED WHERE CLAUSE AFTER GROUP CLAUSE , WE CAN USE BEFORE GROUP CLAUSE

SELECT name,COUNT(marks) FROM student
WHERE name = "SHIVAM"
GROUP BY name
HAVING MAX(marks)>76
ORDER BY name ASC; 



-- Its mainly used for safe mode on & off and its useful when we did any uncertainly changes in table


--          0 is used for off safe mode & 1 is used for on safe mode



SET SQL_SAFE_UPDATES=0;

UPDATE student           --  ------Its mainly used for UPDATE
SET city ="DELHI"
WHERE city ="GOA" ; 

SELECT*FROM student;



CREATE TABLE student2(
rollno INT PRIMARY KEY ,
name VARCHAR(50) ,
marks INT NOT NULL,
grade VARCHAR(50) ,  
city VARCHAR(50)
); 


INSERT INTO student2
(rollno,name,marks,grade,city)
VALUES
(101,"SHIVAM",78,"A","NOIDA");


DELETE from student2;  --  -----> its is used for deleted the data from table

DELETE from student2
WHERE marks<79;


SELECT*FROM student2;



ALTER TABLE student2     -- ---- its mainly used if any change ae required in schemas and for add column after create table
ADD COLUMN age INT ;


ALTER TABLE student2     -- ---- its mainly used for remove column after create table
DROP COLUMN age ;


ALTER TABLE student2     -- ---- its mainly used for RENAME TABLE NAME after create table
RENAME TO STUDENT3;



ALTER TABLE student2     -- ---- its mainly used for RENAME COLUMN AND DATA TYPE NAME after create table
CHANGE COLUMN age new INT;


ALTER TABLE student2       --  --------- its mainly used for MODIFY COLUMN DATA TYPE NAME after create table
MODIFY COLUMN new FLOAT;

SELECT*FROM student2;



-- -------> DROP IS USED FOR DELETED ENTIRE DATA TABLE 

-- -------> TRUNCATE IS USED FOR DELETED DATA OF TABLE


TRUNCATE TABLE student2;

SELECT*FROM student2;




-- INNER JOIN 
-- SYNTAX ----             
-- SELECT*FROM Table1 name  (as (give any short name like a,b,z,x etc )used for give a short name to a table name )
-- INNER JOIN TABLE2 name 
-- ON TABLE1 NAME.COLUMN NAME = TABLE2 NAME . COLUMN NAME ; 


CREATE TABLE student3(
id INT PRIMARY KEY,
name VARCHAR(50)
);


INSERT INTO student3 (id,name)
VALUES
(101,"SHIVAM"),
(102,"VISAHL"),
(103,"KARAN"),
(104,"MANISHA"),
(105,"AKASH");


CREATE TABLE course3(
id INT PRIMARY KEY,
course VARCHAR(50)
);



INSERT INTO course3(id,course)
VALUES
(102,"hindi"),
(103,"englishg"),
(104,"MAth"),
(105,"science");


SELECT*FROM student3;

SELECT*FROM course3; 



SELECT*FROM student3
INNER JOIN course3
ON student3.id=course3.id;


-- LEFT JOIN 
-- SYNTAX ----
-- SELECT*FROM Table1 name 
-- LEFT JOIN TABLE2 name 
-- ON TABLE1 NAME.COLUMN NAME = TABLE2 NAME . COLUMN NAME ; 


SELECT*FROM student3
LEFT JOIN course3
ON student3.id=course3.id;



-- RIGHT JOIN 
-- SYNTAX ----
-- SELECT*FROM Table1 name 
-- RIGHT JOIN TABLE2 name 
-- ON TABLE1 NAME.COLUMN NAME = TABLE2 NAME . COLUMN NAME ; 



SELECT*FROM student3
RIGHT JOIN course3
ON student3.id=course3.id;


-- full JOIN 
-- SYNTAX ----
-- SELECT*FROM Table1 name 
-- RIGHT JOIN TABLE2 name 
-- ON TABLE1 NAME.COLUMN NAME = TABLE2 NAME . COLUMN NAME ;
-- UNION 
-- SELECT*FROM Table1 name 
-- LEFT JOIN TABLE2 name 
-- ON TABLE1 NAME.COLUMN NAME = TABLE2 NAME . COLUMN NAME ; 




SELECT*FROM student3 as a
RIGHT JOIN course3 as b
ON a.id = b.id
UNION
SELECT*FROM student3 as x
LEFT JOIN course3 as y
ON x.id = y.id;



-- SQL CMD TO DISPLAY RIGHT OR LEFT EXCLUSIVE(DON'T WANT COOMAN DATA ) USE WHERE TABLE NAME .COLUMN NAME IS NULL



SELECT*FROM student3 as a
LEFT JOIN course3 as b
ON a.id = b.id
WHERE b.id IS NULL;

SELECT*FROM student3 as a
RIGHT JOIN course3 as b
ON a.id = b.id
WHERE a.id IS NULL;




-- SELF JOIN------------- 


CREATE TABLE employee(
id INT PRIMARY KEY ,
name VARCHAR(50),
manager_id INT 
);

INSERT INTO employee (id,name,manager_id)
VALUES
(101,"SHIVAM",103),
(102,"VISAHL",099),
(103,"KARAN",103),
(104,"MANISHA",099),
(105,"AKASH",NULL);



SELECT*
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;                                                                 


SELECT a.name as manager_name,b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id; 

-- UNION ----------

SELECT name FROM employee
UNION   --  ------------------- if we add ALL ITS PROVIDE ALL DATA WITHOUT REMOVING DUPLICATE DATA 
SELECT name FROM employee;
 
 
 
 
--  -----SUB QUERY ------


CREATE TABLE student32(
rollno INT PRIMARY KEY ,
name VARCHAR(50) ,
marks INT NOT NULL,
grade VARCHAR(50) ,  
city VARCHAR(50)
);


 INSERT INTO student32
 (rollno,name,marks,grade,city)
 VALUES 
(101,"SHIVAM",78,"A","NOIDA"),
(102,"VISAHL",73,"B","GHAZIABAD"),
(103,"KARAN",78,"C","DELHI"),
(104,"MANISHA",78,"A","AGRA"),
(105,"AKASH",78,"D","GOA"),
(106,"MAJOR",78,"C","PUNE");


SELECT * FROM student32;

SELECT AVG(marks)
FROM student32;

SELECT name,marks
FROM student32
where marks>77.1667;


-- its is used for DYNAMICALLY CHANGES IN  sub query-----

SELECT name,marks
FROM student32
where marks>(SELECT AVG(marks)
FROM student32);


-- TO FIND THE ROLL NO EVEN WITH STUDENTS NAME 

SELECT rollno
FROM student32
WHERE rollno % 2 = 0;


SELECT rollno,name
FROM student32
WHERE rollno % 2 = 0;

-- ITS ONLY USED FOR NAME THOSE STUDENTS HAVE EVEN ROLL NO 

SELECT name
FROM student32
WHERE rollno IN (102,104,106)
 

-- further CODE in SQL LEARNNIG NOTES 2
 
