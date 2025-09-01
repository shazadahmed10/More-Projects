--Name: Shazad Ahmed
--Date Last updated: 8/31/25


-- STEP 1: Explore the datasets; how to potentially merge them and map out any other manipulations needed. 
PRAGMA table_info(Users);
PRAGMA table_info(Subscriptions);
PRAGMA table_info(Product_Usage);

/*
PREPARE FOR ANALYTICS/METRICS:
Growth & Acquisition
How many new users are signing up each month?
Conversion rate from free → paid → premium?

Revenue & Retention
What is Monthly Recurring Revenue (MRR) and how is it trending?
What is churn rate (users canceling subscriptions)?

Engagement & Product Insights
Do engaged users (more logins/feature clicks) churn less?
Which customer segments (country, channel, plan) are most at risk of churn?
*/


--MERGE users and subscriptions together
CREATE TABLE Merged AS
SELECT s.*, u.signup_date, u.country, u.acquisition_channel, u.plan_type
FROM Subscriptions s
LEFT JOIN Users u ON s.user_id = u.user_id;


--KPI 1: Users Signing up per Month
CREATE VIEW monthly_users AS 
    SELECT 
        strftime('%Y-%m', signup_date) AS signup_month,
        COUNT(DISTINCT user_id) AS new_users
    FROM Users
    GROUP BY signup_month;
	
SELECT * FROM monthly_users
ORDER BY signup_month;

--KPI 2: Conversion rate from free → paid → premium?
CREATE VIEW plan AS
	SELECT COUNT(DISTINCT(user_id)) AS user_count, plan_type
	FROM Merged
	GROUP BY plan_type;
	
SELECT * FROM PLAN
GROUP BY user_count;


--KPI 3: Monthly Recurring Revenue (MRR) on active accounts only
CREATE VIEW monthly_rev AS
SELECT 
    strftime('%Y-%m', start_date) AS start_month, --this is what SQL lite accepts
    SUM(monthly_fee) AS mrr
FROM Subscriptions 
WHERE status = 'active'
GROUP BY strftime('%Y-%m', start_date)
ORDER BY start_month;

--DROP VIEW monthly_rev;


--KPI 4: Churn Rate (by Month)

--first check unique types of status: Only active and cancelled 
SELECT 
DISTINCT(status)
FROM Subscriptions;

CREATE VIEW churn AS
SELECT 
    strftime('%Y-%m', start_date) AS start_month, --this is what SQL lite accepts
	COUNT(*) AS Cancelled_Subs
FROM Subscriptions 
WHERE status = 'canceled'
GROUP BY strftime('%Y-%m', start_date)
ORDER BY start_month;
--DROP VIEW churn;


--KPI 5: Total Active Users with Churn rate by monthly_fee

CREATE VIEW tot_monthly_users AS
WITH tot_users AS(
SELECT 
    strftime('%Y-%m', start_date) AS start_month, --this is what SQL lite accepts
	COUNT(*) AS active_subs
FROM Subscriptions 
WHERE status = 'active'
GROUP BY strftime('%Y-%m', start_date)
ORDER BY start_month)

SELECT  a.start_month, a.active_subs, c.Cancelled_Subs
FROM tot_users a
LEFT JOIN churn c ON a.start_month = c.start_month
ORDER BY a.start_month;
--DROP VIEW tot_monthly_users;



--KPI 6: Top 10 users with Clicks per year

CREATE VIEW clicks_a AS
SELECT 
	user_id,  
	strftime('%Y', date) AS year,
	SUM(feature_a_clicks) AS total_clicks_A 
FROM Product_Usage
GROUP BY user_id, year;

CREATE VIEW clicks_b AS  
SELECT 
	user_id,  
	strftime('%Y', date) AS year,
	SUM(feature_b_clicks) AS total_clicks_B 
FROM Product_Usage
GROUP BY user_id, year;

CREATE VIEW tot_clicks AS 
SELECT a.user_id, a.year, a.total_clicks_A, b.total_clicks_B
FROM clicks_a a
LEFT JOIN clicks_b b ON a.user_id = b.user_id AND a.year = b.year
ORDER BY a.user_id;
--DROP VIEW tot_clicks

-- These views should be imported into PowerBI:
--Merged, plan, monthly_rev, churn, tot_monthly_users, tot_clicks
