# Fetch Rewards Coding Exercise - Data Analyst
Enclosed in this folder is my project built in Oracle SQL/Python.

## Table of Contents
1. Entity Relationship Diagram
2. SQL Queries
3. Data Quality Evaluation
4. Sample Email
5. Conclusion 

## Entity Relationship Diagram
(See Fetch_ERD.vsdx)

![image](https://user-images.githubusercontent.com/78304652/132506922-de53c302-6282-4a11-a3ec-dd301221efbe.png)


## SQL Queries
(See SQL.sql)

I answered the following questions with my query
1. When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?
2. When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

![Capture1](https://user-images.githubusercontent.com/78304652/132505330-cec681c8-2f78-4ec5-8b4f-6a0a0d826f2b.PNG)

## Data Quality Evaluation
(See Fetch_Data_Quality.py)

I cleaned and analyzed the receipts schema using pandas. Specifically, I explored the shape and structure of the data and evaluated the missing and unique values in the data frame. I would definitely look into bonusPointsEarned & bonusPointsEarnedReason as they both have a high number of missing values. However, in this phase of EDA the data seems sound. Moving forward I would defintily utilize the numpy and matplotlib packages to check the normality through a historgram, box-plot etc. 

![Capture](https://user-images.githubusercontent.com/78304652/132500383-4e26f500-8800-4d21-a3c9-cea01634c6a5.PNG)

## Sample Email
Dear Ms. Smith,
	Thank you for taking the time to meet with me later today. There are a few stoppers that we need to discuss in order for me to continue with my work. After cleaning the data in python, I discovered some quality issues. Could you please provide me with the source of xyz data set, and potentially a contact that I could discuss any technical details with? I need to know a bit more about how this quarter’s data is being structured so that I can reason whether or not some missing values make sense. Lastly, I propose a cross-functional meeting with x department in order to discuss some areas in which we could optimize the data pipeline in order to get it ready for production. I have some concerns about how efficient the process will be if it’s overloaded with data. I’ve cc’d the java team and we can discuss mediation at a later date. 
  
With Anticipation,

Emily Hersh 


## Conclusion
Thank you for your time and I hope to have the opportunity to speak with you further about how I can be an asset to your team.
