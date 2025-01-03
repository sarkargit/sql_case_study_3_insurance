-- 1. Select all columns for all patients.
select * from insurance;
-- 2. Display the average claim amount for patients in each region.
select region,Avg(claim) from insurance
group by region;
-- 3. Select the maximum and minimum BMI values in the table.
select max(bmi) as Maximum_Bmi, min(bmi) as Minimum_Bmi
from insurance;
-- 4. Select the PatientID, age, and BMI for patients with a BMI between 40 and 50.
select * from insurance;
select PatientID, age
from insurance where bmi between 40 and 50;
-- 5. Select the number of smokers in each region.
SELECT region, COUNT(PatientID) 
FROM insurance
WHERE smoker = 'Yes' 
GROUP BY region;
-- 6. What is the average claim amount for patients who are both diabetic and smokers?
select avg(claim) as avg_claim  from insurance where smoker = 'Yes' and diabetic = 'yes';
-- 7. Retrieve all patients who have a BMI greater 
-- than the average BMI of patients who are smokers.
select * from insurance where smoker='yes' and bmi >
(select avg(bmi) from insurance where smoker = 'yes');
-- 8. Select the average claim amount for patients in each age group.
select * from insurance;
select Age, avg(claim)
from insurance
group by age;
-- two 
select 
	case when age < 18 then "Under 18"
    when age between 18 and 30 then "18-30"
    when age between 31 and 50 then "31-50"
    else "Over 50"
end as age_group,
round(avg(claim),2) as avg_claim
from insurance
group by age_group;
-- 9. Retrieve the total claim amount for each patient, 
-- along with the average claim amount across all patients.
select *,sum(claim) over(partition by PatientID) as total_claim,
avg(claim) over() as avg_claim from insurance;
-- 10. Retrieve the top 3 patients with the highest claim amount, along with their 
-- respective claim amounts and the total claim amount for all patients.
select PatientID,claim,sum(claim)  over() as  total_claim from insurance
order by claim desc	 limit 3;
















