CREATE DATABASE RDBMS_Java;

USE rdbms_java;

CREATE TABLE Emp_table
(
   Empno INT(4) PRIMARY KEY,
   Ename VARCHAR(10) NOT NULL,
   Job VARCHAR(9) NOT NULL,
   Mgr INT(4) NOT NULL,
   Hiredate DATE NOT NULL,
   Sal DECIMAL(7,2) NOT NULL,
   Comm DECIMAL(7,2) NOT NULL,
   Deptno INT(2) NOT NULL
);

CREATE TABLE Dept_Table
(
   Deptno INT(2) PRIMARY KEY,
   Dname VARCHAR(14) NOT NULL,
   Loc VARCHAR(13) NOT NULL
);

CREATE TABLE Student_Table
(
  Rno INT(2) PRIMARY KEY,
  Sname VARCHAR(14) NOT NULL,
  City VARCHAR(20)NOT NULL,
  State VARCHAR(20) NOT NULL
);

CREATE TABLE Emp_Log_Table
(
  Emp_id INT(5),
  Log_date DATE NOT NULL,
  New_Salary INT(10) NOT NULL,
  ACTION VARCHAR(20) NOT NULL
);

INSERT INTO Dept_table VALUES(10,"Accounting","New York");
INSERT INTO Dept_table VALUES(20,"Research","Dallas");
INSERT INTO Dept_table VALUES(30,"Sales","Chicago");
INSERT INTO Dept_table VALUES(40,"Operations","Boston");

INSERT INTO Emp_table VALUES(7369,"Smith","Clerk",7902,'1980-12-17',800.00,NULL,20);
INSERT INTO Emp_table VALUES(7499,"Allen","Salesman",7698,'1981-02-20',1600.00,300.00,30);
INSERT INTO Emp_table VALUES(7521,"Ward","Salesman",7698,'1981-02-22',1250.00,500.00,30);
INSERT INTO Emp_table VALUES(7566,"Jones","manager",7839,'1981-04-02',2975.00,NULL,20);
INSERT INTO Emp_table VALUES(7654,"Martin","Salesman",7698,'1981-09-28',1250.00,1400.00,30);
INSERT INTO Emp_table VALUES(7698,"Blake","Manager",7839,'1981-05-01',2850.00,NULL,30);
INSERT INTO Emp_table VALUES(7782,"Clark","Manager",7839,'1981-06-09',2450.00,NULL,10);
INSERT INTO Emp_table VALUES(7788,"Scott","Analyst",7566,'1987-06-11',3000.00,NULL,20);
INSERT INTO Emp_table VALUES(7839,"King","President",NULL,'1981-11-17',5000.00,NULL,10);
INSERT INTO Emp_table VALUES(7844,"Turner","Salesman",7698,'1981-08-09',1500.00,0.00,30);
INSERT INTO Emp_table VALUES(7876,"Adams","Clerk",7788,'1987-07-13',1100.00,NULL,20);
INSERT INTO Emp_table VALUES(7900,"James","Clerk",7698,'1981-03-12',950.00,NULL,30);
INSERT INTO Emp_table VALUES(7902,"Ford","Analyst",7566,'1981-03-12',3000.00,NULL,20);
INSERT INTO Emp_table VALUES(7934,"Miller","Clerk",7782,'1982-01-23',1300.00,NULL,10);
--1 Question
SELECT DISTINCT job FROM emp_table WHERE Job="President";
--2 Question
SELECT * FROM emp_table ORDER BY deptno ASC, job DESC;
--3 Question
SELECT DISTINCT job FROM emp_table ORDER BY job DESC;
--4 Question
SELECT * FROM Emp_table WHERE hiredate < '1981-01-01';
--5 Question
SELECT empno,ename,sal,(sal/30) AS Daily_sal,(sal*12) AS Annaul_sal FROM emp_table ORDER BY annaul_sal ASC;
--6 Question
SELECT empno,ename,sal,ROUND((CURRENT_DATE - hiredate)/365) AS EXP FROM emp_table WHERE mgr=7369;
--7 Question
SELECT * FROM emp_table WHERE comm > sal;
--8 Question
SELECT * FROM emp_table WHERE job="Clerk" OR job="Analyst" ORDER BY job DESC;
--9 Question
SELECT * FROM emp_table WHERE (sal*12) BETWEEN 22000 AND 45000;
--10 Question
SELECT ename FROM emp_table WHERE ename LIKE 's____%';
--11 Question
SELECT * FROM emp_table WHERE empno NOT LIKE '78%';
--12 Question
SELECT * FROM emp_table WHERE job="Clerk" AND deptno=20;
--14 Question
SELECT * FROM emp_table WHERE deptno=20 AND job IN(SELECT DISTINCT job FROM emp_table WHERE deptno=10);
--15 Question
SELECT * FROM emp_table WHERE sal=(SELECT sal FROM emp_table WHERE ename="Ford") OR sal=(SELECT sal FROM emp_table WHERE ename="Smith") ORDER BY sal DESC;
--16 Question
SELECT * FROM emp_table WHERE job=(SELECT job FROM emp_table WHERE ename="Smith") OR job=(SELECT job FROM emp_table WHERE ename="Allen");
--17 Question
SELECT * FROM emp_table WHERE deptno=10 AND job NOT IN(SELECT DISTINCT job FROM emp_table WHERE deptno=20);
--18 Question
SELECT MAX(sal) AS Highest_Salary FROM emp_table;
--19 Question
SELECT * FROM emp_table WHERE sal=5000.00;
--20 Question
SELECT SUM(sal) AS total_sal FROM emp_table WHERE empno IN (SELECT DISTINCT mgr FROM emp_table WHERE mgr IS NOT NULL);
--21 Question 
SELECT * FROM emp_table WHERE ename LIKE 'A%';
--22 Question 
SELECT * FROM Emp_table e WHERE sal=(SELECT MIN(sal) FROM emp_table WHERE job=e.job) ORDER BY job ASC;
--23 Question
SELECT * FROM emp_table WHERE sal > (SELECT sal FROM emp_table WHERE ename="Blake");
--24 Question
CREATE VIEW v1 AS SELECT e.ename,e.job,d.dname,d.loc FROM emp_table e JOIN dept_table d WHERE e.deptno=d.deptno;