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
1. 
2. 
3. 


## Next Steps/Deep Dives
1. Segment the data by geography, engagement cohorts and plan types for more insight
2. 
3. 

## Recommendations
1. Commence deeper dive analyses with specific questions in mind.
2.  
3. 

## Impact

