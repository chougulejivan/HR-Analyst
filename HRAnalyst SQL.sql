use project3;
select count(*) from hrdata;
select * from hrdata;

/*KPI-1 Average Attrition rate for all Department */
SELECT Department, 
       ROUND(AVG(CASE WHEN Attrition_Y = 'Yes' THEN 1 ELSE 0 END) * 100,2) AS Avg_Attrition_Rate
FROM hrdata
GROUP BY Department;

/*KPI-2 Average Hourly rate of Male Research Scientist */
SELECT Gender,JobRole,
    ROUND(AVG(HourlyRate),2) As Avg_Hourly_Rate
    FROM hrdata
    WHERE Gender = "Male" AND JobRole="Research Scientist";
    
    
/*KPI-3 Attrition rate Vs Monthly income stats */

SELECT 
    ROUND(AVG(CASE WHEN Attrition_Y = 'Yes' THEN 1 ELSE 0 END) * 100,2) AS Avg_Attrition_Rate,
	ROUND(AVG(MonthlyIncome),2) As Avg_Monthly_Income
	FROM hrdata;
    
    
/*KPI-4 Average working years for each Department */

SELECT Department,
	ROUND(AVG(TotalWorkingYears),2) As Avg_Working_Year
	FROM hrdata
	GROUP BY Department
    ORDER BY 1;
    
 
 /*KPI-5 Job Role Vs Work life balance */
 
 SELECT JobRole, 
       ROUND(AVG(WorkLifeBalance),2) AS Avg_WorkLife_Balance
       FROM hrdata
	   GROUP BY JobRole
       ORDER BY 1;

    
  /*KPI-6 Attrition rate Vs Year since last promotion relation */ 
  
  SELECT JobRole,
       ROUND(AVG(YearsSinceLastPromotion),2) As Avg_YearsSinceLastPromotion,
       ROUND(AVG(CASE WHEN Attrition_Y = 'Yes' THEN 1 ELSE 0 END) * 100,2) AS Avg_Attrition_Rate
       FROM hrdata
       GROUP BY JobRole;


                            /*Additional KPI's*/
  /*KPI-7 Overtime Rate by Job Role */ 
  
  SELECT 
    JobRole,
    COUNT(CASE WHEN OverTime = 'Yes' THEN 1 END) AS OvertimeYesCount,
    COUNT(*) AS TotalCount,
    ROUND((COUNT(CASE WHEN OverTime = 'Yes' THEN 1 END) * 100.0 / COUNT(*)),2) AS OvertimeRatePercentage
FROM hrdata
GROUP BY JobRole
ORDER BY 1;

/*KPI-8 Average Age of Employees by Department */ 

SELECT 
    Department,
ROUND(AVG(Age),2) AS AvgAge
FROM hrdata
GROUP BY Department
ORDER BY 1;
