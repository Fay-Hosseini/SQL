use data_new;

-- 1 Retrieve all columns for all employees:
SELECT * FROM salaries;

-- 2 Retrieve only the EmployeeName and JobTitle columns for all employees:
select EmployeeName, JobTitle from salaries;



-- 3 Retrieve the total number of employees:
select count(Id) from salaries;


-- 4 Retrieve the average BasePay for all employees:
select avg(BasePay) as AverageBasePay from salaries;
select avg(TotalPayBenefits) as AverageTotalPayBenefitsy from salaries;
-- 5 Retrieve the average BasePay for all employees:
select max(TotalPay) as HighestTotalPay from salaries;

-- 6 Retrieve the lowest TotalPay:
select min(TotalPay) as LowestTotalPay from salaries;

-- 7 Retrieve the list of unique job titles:
select distinct JobTitle from salaries;

-- 8 Retrieve employees with a BasePay greater than $50000:
select * from salaries where BasePay > 50000;

-- 9 Retrieve employees hired in a specific year (e.g., 2013):
select * from salaries where Year=2013;

-- 10 Retrieve employees with a specific JobTitle (e.g., 'Manager'):
select EmployeeName,JobTitle from salaries where JobTitle like '%Manager%' ;

-- 11 Retrieve employees with TotalPayBenefits greater than BasePay:
select EmployeeName,BasePay,TotalPayBenefits from salaries where TotalPayBenefits > BasePay;

-- 12 Retrieve employees with TotalPayBenefits between a specific range (e.g., $50000 to $60000):
select EmployeeName,TotalPayBenefits from salaries where TotalPayBenefits between 50000 and 60000;

-- 13 Retrieve the top 10 highest TotalPayBenefits earners:
select EmployeeName,TotalPayBenefits from salaries order by  TotalPayBenefits desc limit 10;

-- 14 Retrieve employees whose EmployeeName starts with 'A':
select EmployeeName from salaries where EmployeeName like 'A%';

-- 15 Retrieve employees with null values in the Benefits column:
select * from salaries where Benefits is NULL;


-- 16 Retrieve employees with TotalPayBenefits greater than the average TotalPayBenefits:
-- select EmployeeName,TotalPayBenefits, avg(TotalPayBenefits) as Avg_TotalPayBenefits  from salaries ;

SELECT * FROM salaries WHERE TotalPayBenefits > (SELECT AVG(TotalPayBenefits) FROM salaries);

-- 17 Retrieve employees grouped by JobTitle with their average BasePay:
SELECT JobTitle, AVG(BasePay) AS AverageBasePay from salaries group by JobTitle;


-- 18 Update BasePay for employees with a specific JobTitle (e.g., 'Engineer'):
SELECT * FROM salaries ;
SET SQL_SAFE_UPDATES = 0;
update salaries set BasePay = 134013.20 where JobTitle = 'FIREFIGHTER' and EmployeeName = 'MICHAEL THOMPSON';
SELECT JobTitle,BasePay FROM salaries where JobTitle = 'FIREFIGHTER' and EmployeeName = 'MICHAEL THOMPSON' ;
SET SQL_SAFE_UPDATES = 1;


-- 19 Insert a new employee record:
INSERT INTO salaries (EmployeeName, JobTitle, BasePay, TotalPayBenefits, Year)
VALUES ('John Smith', 'FIREFIGHTER', 155966.02, 245131.88, 2013);

SELECT * FROM salaries where EmployeeName = 'John Smith' ;

-- 20 Delete employees hired before or after a specific year (e.g., 2020):
SET SQL_SAFE_UPDATES = 0;

DELETE FROM salaries WHERE JobTitle='FIREFIGHTER';
SELECT * FROM salaries where EmployeeName = 'John Smith' ;

SET SQL_SAFE_UPDATES = 1;

-- 21 Calculate the total BasePay, OvertimePay, and OtherPay for each year:

SELECT 
    Year,
    SUM(BasePay) AS TotalBasePay,
    SUM(OvertimePay) AS TotaOvertimePay,
    SUM(OtherPay) AS TotalOtherPay
FROM
    salaries
GROUP BY Year;


-- 22 Calculate the average TotalPayBenefits for each job title:
select JobTitle, avg(TotalPayBenefits) as AverageTotalPayBenefits from salaries  group by JobTitle;

-- 23 Find the employee with the highest TotalPayBenefits for each year:
SELECT 
    Year, EmployeeName, TotalPayBenefits
FROM
    salaries
WHERE
    (Year , TotalPayBenefits) IN (SELECT 
            Year, MAX(TotalPayBenefits) AS HighestTotalPayBenefits
        FROM
            salaries
        GROUP BY Year);

-- 24 Determine the number of employees for each JobTitle with a TotalPayBenefits greater than $100,000:
select JobTitle, count(*) as NumberOfEmployees from salaries where TotalPayBenefits > 100000 group by JobTitle;


-- 25 Calculate the total BasePay and TotalPayBenefits for each job title and year combination:

select Year, JobTitle, sum(BasePay) as TotalBasePay, sum(TotalPayBenefits) from salaries group by Year, JobTitle;

