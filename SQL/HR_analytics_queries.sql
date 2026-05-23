CREATE DATABASE hr_analytics;

USE hr_analytics;

SELECT * FROM ibm_hr_analytics Limit 10;

-- 1. Total Employees
SELECT COUNT(*) AS Total_Employees
FROM ibm_hr_analytics;

-- 2. Total Attrition Employees
SELECT COUNT(*) AS Attrition_Count FROM ibm_hr_analytics
WHERE Attrition = 'Yes';

-- 3. Attrition Rate %
SELECT ROUND((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0)/ COUNT(*), 3) AS Attrition_Rate
FROM ibm_hr_analytics;

-- 4. Department Wise Attrition
SELECT Department , COUNT(*) AS Total_Employees , COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count
FROM ibm_hr_analytics
GROUP BY Department
ORDER BY Attrition_Count DESC;

-- 5. Job Role Wise Attrition
SELECT `Job Role` , COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count
FROM ibm_hr_analytics
GROUP BY `Job Role`
ORDER BY Attrition_Count DESC;

-- 6. Overtime Impact on Attrition
SELECT `Over Time` , COUNT(*) AS Total_Employees , COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*),2) AS Attrition_Rate
FROM ibm_hr_analytics
GROUP BY `Over Time`;

-- 7. Average Salary by Department
SELECT Department , ROUND(AVG(`Monthly Income`), 2) AS Avg_Salary
FROM ibm_hr_analytics
GROUP BY Department
ORDER BY Avg_Salary DESC;

-- 8. Low Salary Employees Leaving Company
SELECT 
    CASE
        WHEN `Monthly Income` < 5000 THEN 'Low Salary'
        WHEN `Monthly Income` BETWEEN 5000 AND 10000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS Salary_Category,
    
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count

FROM ibm_hr_analytics
GROUP BY Salary_Category
ORDER BY Attrition_Count DESC;

-- 9. Work Life Balance vs Attrition
SELECT `Work Life Balance` , COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count
FROM ibm_hr_analytics
GROUP BY `Work Life Balance`
ORDER BY `Work Life Balance`;

-- 10. Promotion Delay Analysis
SELECT `Years Since Last Promotion` , COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count
FROM ibm_hr_analytics
GROUP BY `Years Since Last Promotion`
ORDER BY `Years Since Last Promotion` DESC;

-- 11. Gender Wise Attrition Rate
SELECT Gender , COUNT(*) AS Total_Employees, COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*),2) AS Attrition_Rate
FROM ibm_hr_analytics
GROUP BY Gender;

-- 12. Age Group Analysis
SELECT 
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS Age_Group,

    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count
FROM ibm_hr_analytics
GROUP BY Age_Group
ORDER BY Attrition_Count DESC;

-- 13. Employees Not Promoted for Long Time
SELECT `Employee ID` , `Job Role` , Department, `Years Since Last Promotion`
FROM ibm_hr_analytics
WHERE `Years Since Last Promotion` >= 10
ORDER BY `Years Since Last Promotion` DESC;

-- 14. High Performing Employees Leaving
SELECT `Performance Rating` , COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count
FROM ibm_hr_analytics
GROUP BY `Performance Rating`;

-- 15. Most Experienced Employees
SELECT `Employee ID` , `Job Role` , `Total Working Years` , `Monthly Income`
FROM ibm_hr_analytics
ORDER BY `Total Working Years` DESC
LIMIT 10;

-- 16. Attrition by Business Travel
SELECT `Business Travel` , COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count
FROM ibm_hr_analytics
GROUP BY `Business Travel`
ORDER BY Attrition_Count DESC;

-- 17. Job Satisfaction vs Attrition
SELECT `Job Satisfaction` , COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count
FROM ibm_hr_analytics
GROUP BY `Job Satisfaction`
ORDER BY `Job Satisfaction`;

-- 18. Top 5 Highest Paid Employees
SELECT `Employee ID` , `Job Role` , Department , `Monthly Income`
FROM ibm_hr_analytics
ORDER BY `Monthly Income` DESC
LIMIT 5;

-- 19. Average Years at Company by Department
SELECT Department , ROUND(AVG(`Years At Company`),2) AS Avg_Years
FROM ibm_hr_analytics
GROUP BY Department
ORDER BY Avg_Years DESC;

-- 20. Employees Working Overtime with Low Work-Life Balance
SELECT `Employee ID` , `Job Role` , `Over Time` , `Work Life Balance`
FROM ibm_hr_analytics
WHERE `Over Time` = 'Yes'
AND `Work Life Balance` = 1;
