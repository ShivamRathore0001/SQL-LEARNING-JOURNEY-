-- -------  ITS IS USED FOR DYNAMICALLY CHANGES IN  DATA TO WRITE SUB QUERY 
 
SELECT name 
from student32
WHERE rollno IN (
SELECT rollno
FROM student32
WHERE rollno % 2 = 0 );

 
; 
 
CREATE TABLE student21(
rollno INT PRIMARY KEY ,
name VARCHAR(50) ,
marks INT NOT NULL,
grade VARCHAR(50) ,  
city VARCHAR(50)
);   



;

 INSERT INTO student21
 (rollno,name,marks,grade,city)
 VALUES 
(101,"SHIVAM",78,"A","NOIDA"),
(102,"VISAHL",73,"B","GHAZIABAD"),
(103,"KARAN",78,"C","DELHI"),
(104,"MANISHA",78,"A","AGRA"),
(105,"AKASH",68,"D","GOA"),
(106,"MAJOR",71,"C","DELHI");

SELECT * FROM student21;

SELECT MAX(marks)
FROM ( SELECT * FROM student21 
WHERE city = "Delhi" ) AS temp;          -- (AS temp) use basically , can we also write the query inside the FROM 

SELECT MAX(marks)
FROM student21
WHERE city = "Delhi";

;

SELECT (SELECT MAX(marks)  FROM student21), name
FROM student21;               -- extra usually sub query write in where and use where clause 





-- MY SQL VIEWS is virtual tables , not real but reflects in schemas but does not effect overall data cuz table different  ------------------

CREATE VIEW view1 AS 
SELECT rollno, name , marks FROM student21;

SELECT  * FROM view1
WHERE marks >73;

DROP VIEW view1;


SELECT * FROM view1;