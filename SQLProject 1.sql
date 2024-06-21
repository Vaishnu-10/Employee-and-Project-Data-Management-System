Create Database NewEmployee

Use NewEmployee

Create Table EmployeeDetail(
EmployeeID int Primary Key,
FirstName char(250),
LastName char(250),
Salary Money,
JoiningDate DateTime,
Department Char(200),
Gender char(200));

INSERT INTO EmployeeDetail (EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender)
VALUES
(1, 'Vikas', 'Ahlawat', 600000, '2013-02-12 11:16:00', 'IT', 'Male'),
(2, 'Nikita', 'Jain', 530000, '2013-02-14 11:16:00', 'HR', 'Female'),
(3, 'Ashish', 'Kumar', 1000000, '2013-02-14 11:16:00', 'IT', 'Male'),
(4, 'Nikhil', 'Sharma', 480000, '2013-02-15 11:16:00', 'HR', 'Male'),
(5, 'Anish', 'Kadian', 500000, '2013-02-16 11:16:00', 'Paroll', 'Male');


Drop TAble EmployeeDetail

Select * from EmployeeDetail

Select FirstName from EmployeeDetail

Select Upper(FirstName) as 'First Name' from EmployeeDetail

Select Upper(LastName) as 'Last Name' from EmployeeDetail

SELECT CONCAT(FirstName, ' ', LastName) AS Name
FROM EmployeeDetail;

Select * from EmployeeDetail
where FirstName ='Vikas'

Select * from EmployeeDetail
where FirstName like 'a%'

Select * from EmployeeDetail
where FirstName like '%a'

Select * from EmployeeDetail
where FirstName like '%h'

Select * from EmployeeDetail
where FirstName like '[a-p]%'

Select * from EmployeeDetail
where FirstName not like '[a-p]%'

Select * from EmployeeDetail
where FirstName like '[a-p]%'

Select * from EmployeeDetail
where Gender like '__le'

Select * from EmployeeDetail
where FirstName like 'a____'

Select * from EmployeeDetail
where FirstName like '%[%]%'

Select Distinct Department from EmployeeDetail

Select max(Salary) as HighestSalary from EmployeeDetail

Select min(Salary) as LowestSalary from EmployeeDetail

Select Format(JOiningDate,'dd MMM yyyy') as JoiningDate from EmployeeDetail

Select Format(JOiningDate,'yyyy/MM/dd') as JoiningDate from EmployeeDetail

SELECT FORMAT(JoiningDate, 'HH:mm:ss') AS JoiningTime FROM EmployeeDetail;

Select Year(JoiningDate) as Years from EmployeeDetail

Select month(JoiningDate) as MonthNo from EmployeeDetail

Select GETDATE() as CurrentDate

Select GETUTCDATE() as UTCDate

Select FirstName, GetDate() as CurrentDate, JoiningDate, DateDiff(Month,JoiningDate,GetDate()) as MonthsSinceJOining from EmployeeDetail

Select FirstName, GetDate() as CurrentDate, JoiningDate, DateDiff(Day,JoiningDate,GetDate()) as MonthsSinceJOining from EmployeeDetail

Select * from EmployeeDetail
where Year(JoiningDate)='2013'

Select * from EmployeeDetail
where Month(JoiningDate)='1'

Select count(*) as TotalEmployees from EmployeeDetail

Select Top 1* from EmployeeDetail

Select * from EmployeeDetail
where FirstName not in ('Vikas','Ashish','Nikhil')

Select RTRIM(FirstName) as FirstNme from EmployeeDetail

Select LTRIM(FirstName) as FirstNme from EmployeeDetail

Select FirstName, 
	Case 
		when Gender='Male' then 'M'
		when Gender='Female' then 'F'
	End as Gender
from EmployeeDetail

Select FirstName from EmployeeDetail
where FirstName like 'Hello%'

Select * from EmployeeDetail where Salary>600000

Select * from EmployeeDetail where Salary<700000

Select * from EmployeeDetail where Salary between 500000 and 600000

Create Table ProjectDetail(
ProjectDetailID int Primary Key,
EmployeeDetailID int Foreign Key references EmployeeDetail(EmployeeID),
ProjectName char(250));

Drop Table ProjectDetail

INSERT INTO ProjectDetail (ProjectDetailID, EmployeeDetailID, ProjectName)
VALUES
(1, 1, 'Task Track'),
(2, 1, 'CLP'),
(3, 1, 'Survey Management'),
(4, 2, 'HR Management'),
(5, 3, 'Task Track'),
(6, 3, 'GRS'),
(7, 3, 'DDS'),
(8, 4, 'HR Management'),
(9, 5, 'GL Management');

Select * from ProjectDetail
Select * from EmployeeDetail

Select Department, Sum(Salary) as TotalSalary from EmployeeDetail
Group by Department

Select Department, Sum(Salary) as TotalSalary from EmployeeDetail
Group by Department
Order by TotalSalary

Select Department, Sum(Salary) as TotalSalary from EmployeeDetail
Group by Department
Order by TotalSalary Desc

Select Department, count(*) as 'Total Departments', Sum(Salary) from EmployeeDetail
group by Department

Select Department, AVG(Salary) as 'Average Salary' from EmployeeDetail
Group by Department 
Order by 'Average Salary'

Select Department, Max(Salary) as 'Max Salary' from EmployeeDetail
Group by Department 
Order by 'Max Salary'

Select Department, Min(Salary) as 'Min Salary' from EmployeeDetail
Group by Department 
Order by 'Min Salary'

Select Department, Min(Salary) as 'Min Salary' from EmployeeDetail
Group by Department 
Order by 'Min Salary' Desc

Select * from EmployeeDetail E
Join ProjectDetail P on E.EmployeeId= P.EmployeeDetailID

Select E.FirstName as EmployeeName, P.ProjectName from EmployeeDetail E
Join ProjectDetail P on E.EmployeeId= P.EmployeeDetailID
order by E.FirstName




Select E.FirstName as EmployeeName,Coalesce( P.ProjectName,'-No Project Assigned')as ProjectName from EmployeeDetail E
Join ProjectDetail P on E.EmployeeId= P.EmployeeDetailID
order by E.FirstName

SELECT 
    E.FirstName AS EmployeeName, 
    P.ProjectName
FROM 
    EmployeeDetail E
LEFT JOIN 
    ProjectDetail P ON E.EmployeeID = P.EmployeeDetailID
UNION
SELECT 
    NULL AS EmployeeName, 
    P.ProjectName
FROM 
    ProjectDetail P
WHERE 
    NOT EXISTS (SELECT 1 FROM EmployeeDetail WHERE EmployeeID = P.EmployeeDetailID)
ORDER BY 
    EmployeeName;


SELECT 
    E.FirstName AS EmployeeName, 
    P.ProjectName
FROM 
    EmployeeDetail E
FULL JOIN 
    ProjectDetail P ON E.EmployeeID = P.EmployeeDetailID
ORDER BY 
    EmployeeName;




SELECT 
    E.FirstName AS EmployeeName, 
    MIN(P.ProjectName) AS ProjectName
FROM 
    EmployeeDetail E
JOIN 
    ProjectDetail P ON E.EmployeeID = P.EmployeeDetailID
GROUP BY 
    E.FirstName
HAVING 
    COUNT(P.ProjectDetailID) > 1;


Select E.EmployeeID, Count(P.ProjectDetailID) as TotalProjectsAssigned from EmployeeDetail E
Join ProjectDetail P on E.EmployeeId= P.EmployeeDetailID
Group by E.EmployeeID

SELECT 
    E.FirstName AS EmployeeName, 
    MIN(P.ProjectName) AS ProjectName
FROM 
    EmployeeDetail E
JOIN 
    ProjectDetail P ON E.EmployeeID = P.EmployeeDetailID
GROUP BY 
    E.FirstName
HAVING 
    COUNT(DISTINCT P.ProjectDetailID) > 1;


SELECT 
    E.FirstName AS EmployeeName, 
    P.ProjectName
FROM 
    EmployeeDetail E
CROSS JOIN 
    ProjectDetail P;
