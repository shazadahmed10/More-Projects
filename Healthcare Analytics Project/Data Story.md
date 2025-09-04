# 📊 Data Story: Mid Size Healthcare Firm Analytics

## Business Context

This mid-size healthcare company wants to analyze data from their first 50 members over a 1 year period. Leadership wants a deeper understanding of prescription usage, provider patterns, and member spend on medications to identify cost-saving opportunities and improve member outcomes. Leadership is interested in three key areas:

1. Average member spend on drugs - is this rising or not?
2. Prescription Usage - what is being prescribed the most and what is the cost?
3. Provider Prescribing Patterns – how much are providers prescribing and what are their prices compared to one another? 


## Data Sources

- Members: demographic data on members
- Prescriptions: claims data on drugs like quantity prescribed, cost, provider and member
- Providers: demographic data on providers and drugs they are prescribinhg 
   
### Views created:
  - Several views on drug costs, drug costs over time month to month, provider insights, drug usage, and member insights
 
## Approach

1. SQL Wrangling
   - Joined members and providers to poresctiptions table for one standardized silver layer dataset
   - Built views mentioned above for specific metrics
   - Exported all view into CSV files since OBDC connection in PowerBI was broken

2. Power BI Visualization
   - Page 1: Executive Summary
   - Page 2: Member insights
   - Page 3: Provider insights
   - Page 4: Drug usage insights 

3. Analysis & Storytelling
   - Interpreted results to identify risks, opportunities and areas for follow-up deep dives.
  
## Findings/Insights
1. Overall Trends (Summary Page)
   - Total drug spend for the sample population reached $76,689 over 12 months.
   - Average Rx cost is $154, with members averaging $1,534/year in prescription spend.
   - Monthly trend analysis shows costs and claim volume remain fairly stable, though spikes occur in Sep 2024 and Mar 2025, which may indicate seasonal demand (e.g., flu season, chronic medication renewals).
   - Top drugs prescribed include Metformin, Amoxicillin, and Lisinopril, suggesting high prevalence of diabetes, infections, and hypertension in the population.
   - State-level differences: California and Pennsylvania show higher average Rx costs, while Ohio and Texas show lower utilization but similar costs, indicating potential inefficiencies.

2. Member Insights
   - High-cost members: A small number of members (top 10) drive disproportionately higher spend ($2–3K each vs. ~$1.5K average).
   - Plan types: Members in POS plans drive the most spend ($35K), followed by HMO and PPO. This suggests that plan design (out-of-network access in POS) may contribute to higher overall costs.
   - Age vs. spend: There is a positive correlation between age and Rx spend, but younger members still show some high-cost outliers (possibly due to chronic conditions requiring expensive medications).
   - Medication utilization: The average prescription contains 58 pills, but ranges widely — suggesting variation in therapy type (short-term antibiotics vs. long-term chronic medications).

3. Provider Insights
   - Cardiology and Pulmonology providers prescribe at higher average Rx costs ($180–225), reflecting treatment for complex chronic diseases (e.g., heart failure, COPD).
   - Primary Care providers show lower average costs but serve older patients, reinforcing their role in managing chronic conditions more cost-effectively.
   - Variability in prescribing: Some providers prescribe significantly more pills per prescription (60–70 vs. average 55), raising questions about dosing consistency and adherence strategies.
   - Provider experience: There is no strong correlation between years of experience and patient age or prescription cost — indicating prescribing behavior may be more influenced by specialty and patient mix than tenure.
  
4. Drug Usage Insights
   - Metformin is the most commonly prescribed drug and albuterol is least commonly prescribed. The total costs follow the same pattern. 
   - Women are prescrbied to more than men for all drugs. 
   - For the top 3 most prescribed drugs, there is seasonality to when they are prescribed. Higher claims in January and June, lowest in March and December. Same pattern for all three drugs.
   - Pennsylvania's most common drugs prescribed follows a completely different profile than the other states.  



## Recommendations
1. Targeted Care Management
   - Focus interventions on the top-spend members. Case management or pharmacy outreach for adherence support could reduce avoidable costs.
3. Plan Design Review
   - Investigate why POS plans incur higher costs. Consider incentivizing HMO enrollment or adjusting network design to control spend.
3. Provider Engagement
   - Share prescribing benchmarks with Cardiology and Pulmonology providers to encourage cost-effective prescribing (e.g., use of generics where appropriate).
   - Provide feedback on pill quantity variation to reduce unnecessary variation in prescribing patterns.
4. Geographic Focus
   - Conduct deeper analysis in California and Pennsylvania, where average drug costs are highest. Explore whether formulary differences, pharmacy pricing, or member demographics are driving spend.
6. Preventive Focus
   - Since diabetes and hypertension drugs dominate utilization, invest in preventive health programs (nutrition, lifestyle management) to reduce long-term prescription dependency and costs.

