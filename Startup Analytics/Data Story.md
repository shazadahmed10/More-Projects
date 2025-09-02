
# 📊 Data Story: 'Startup X' Subscription Analytics

## Business Context

This SaaS company operates on a subscription model with monthly recurring revenue (MRR). Leadership is interested in three key areas:

1. Revenue health – Is MRR growing or declining?
2. Customer retention – What is our churn rate over time?
3. User engagement – Do active users’ product interactions correlate with revenue outcomes?


## Data Sources

- Users: customer details and subscription start dates
- Subscriptions: subscription status (active, cancelled) and monthly amounts
- Product_Usage: counts of user product interactions
- Views created:
  - monthly_rev → Monthly Recurring Revenue
  - churn → Monthly churn rate
  - plan → Plan breakdown 
  - tot_clicks → Total user clicks across platforms
  - tot_monthly_users → new users gained over time
  - Merged → silver layer dataset that has all relevant columns for any further custom work
 
## Approach

1. SQL Wrangling
   - Built views mentioned above
   - Joined usage and subscription data to enrich customer profiles.
   - Exported all view into CSV files since OBDC connection in PowerBI was broken

2. Power BI Visualization
   - Created time-series visuals for revenue and churn.
   - Added key cards for high level metrics like total revenue
   - Added other KPIs for quick executive review.
   - Added slicers for slicing/segmenting data

3. Analysis & Storytelling
   - Interpreted results to identify risks, opportunities and areas for follow-up deep dives.
  
## Findings/Insights
1. Revenue Growth is positive overall, but seasonal pdrop in Q2 signals potential risk.
2. Churn is decreasing and is concentrated in low-engagement cohorts (<50 clicks/month).
3. Engagement is stronger with Feature A than Feature B, suggesting a need for RCA
4. Most users in US, with smaller base in Asia and Latin America. Need for learning more about foreign markets

## Next Steps/Deep Dives
1. Segment the data by geography, engagement cohorts and plan types for more insight
2. Look at lifetime value (LTV) = average monthly revenue per user × average lifespan (months)
3. Is churn happening in certain segments over others?

## Recommendations
1. Commence deeper dive analyses with specific questions in mind.
2. Either drop feature B or enhance it with lessons learned from Feature A engagement success. 
3. Mitigate seasonal Q2 churn spike with retention promos or product enhancements.

## Impact
Reducing churn by a few % points can increase revenue by thousands of $. 
