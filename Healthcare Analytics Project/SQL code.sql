--Coder: Shazad Ahmed
--Purpose: To take mock healthcare data from a mid-size health insurance org and find insights
--Date: 8/31/25


--STEP 0: Look at the schema of the imported datasets
PRAGMA table_info(providers);
PRAGMA table_info(prescriptions);
PRAGMA table_info(members);

SELECT COUNT(*) AS total_members FROM members;
SELECT COUNT(*) AS total_providers FROM providers;
SELECT COUNT(*) AS total_prescriptions FROM prescriptions;

SELECT COUNT(DISTINCT member_id) FROM members;
SELECT COUNT(DISTINCT provider_id) FROM providers;


--STEP 1: Join all datasets together for full set. Then create metric views from this. 
--Prescriptions is base.  Join members to it first using LEFT JOIN and then providers to it too using LEFT JOIN

CREATE VIEW merged AS 
SELECT p.*, m.age, m.gender, m.state, m.plan_type, m.enrollment_date
FROM prescriptions p
LEFT JOIN members m ON p.member_id = m.member_id
ORDER BY p.member_id;

CREATE VIEW merged2 AS 
SELECT m.*, pr.provider_name, pr.specialty, pr.state AS provider_state, pr.years_experience
FROM merged m
LEFT JOIN providers pr ON m.provider_id = pr.provider_id
ORDER BY m.member_id; 

 
 /*
 --STEP 2: Start Building Metric Views for PowerBI:
Spends per memeber
Average prescription cost per provider, top 10 highest cost providers
drug_costs and claims by month 
Drug Usage Trends
Member plan type breakdown, by age

Exploratory: 
Average drug cost vs age of customer
age of cusomter vs average age of provider
State breakdown of members by age
 */
 
 
 --Spends per memeber
 CREATE VIEW drug_costs AS 
 SELECT 
	member_id, age, gender, state, plan_type,
	ROUND(AVG(drug_cost), 0) AS avg_drug_cost,
	ROUND(SUM(drug_cost), 0) AS tot_drug_cost,
	ROUND(AVG(quantity), 0) AS avg_quantity,
	COUNT(drug_name) AS drug_count,
	COUNT(claim_id) AS total_rx
FROM merged2
GROUP BY member_id;

 
 
 --Average prescription cost per provider, top 10 highest cost providers
 CREATE VIEW rx_costs AS 
 SELECT 
	ROUND(SUM(drug_cost), 0) AS total_drug_cost, 
	ROUND(AVG(drug_cost), 0) AS avg_drug_cost, 
	ROUND(AVG(quantity), 0) AS avg_quantity,
	ROUND(AVG(age), 0) AS avg_px_age, 
	provider_id, provider_name, provider_state, specialty, years_experience --other parameters
FROM merged2
GROUP BY provider_id; 


 
 --Drug_costs and claims by month 
 CREATE VIEW drug_costs_permonth AS
 SELECT
	COUNT(claim_id) AS claims,
	strftime('%Y-%m', fill_date) AS fill_month, --to get month dimension
	ROUND(SUM(drug_cost), 0) AS total_drug_cost, 
	ROUND(AVG(drug_cost), 0) AS avg_drug_cost, 
	drug_name,
	days_supply,
	age, 
	plan_type
FROM merged2
GROUP BY drug_name, fill_month;


--Drug Spend per state
CREATE VIEW drug_costs_state AS 
SELECT
	ROUND(SUM(drug_cost), 0) AS total_drug_cost, 
	ROUND(AVG(drug_cost), 0) AS avg_drug_cost, 
	drug_name, 
	ROUND(AVG(age), 0) AS avg_age,
	state
FROM merged2
GROUP BY drug_name, state;
	
	
--Member Plan Breakdown (overall, by state, by age)
CREATE VIEW plans AS
SELECT 
	plan_type,
	COUNT(claim_id) AS claims,
	ROUND(AVG(drug_cost), 0) AS avg_drug_cost
FROM merged2
GROUP BY plan_type;

	
	
/*
Import these views into PowerBI:
merged2, drug_costs, drug_costs_permonth, rx_costs, drug_costs_state, plans
*/
	
