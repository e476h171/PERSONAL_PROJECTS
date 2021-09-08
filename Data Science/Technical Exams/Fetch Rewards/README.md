# Fetch Rewards Coding Exercise - Data Analyst
Enclosed in this folder is my project built in SQL/Python that demonstrates my ability to reason and communicate my understanding of data sets to others.

## Table of Contents
1. Project Overview
2. Entity Relationship Diagram
3. SQL Queries
4. Data Quality Evaluation
5. Communicate with Stakeholders
6. Conclusion

## Project Overview
I, like most people, have a difficult time remembering my passwords and refraining from recycling the same 2 passwords out of sheer convience. There are countless methods to store  passwords, ranging from simple pen + paper to using password keychains. This project highlights the process of database develop from start to finish. I started by creating two tables, a master table and a history log and populated them with *random data* (dont even think about stealing my Github password lol). From there I created a package that includes 1 function and 3 procedures. They make use of techniques like triggers, sequences and calling procedures/functions inside another procedure.  

## Entity Relationship Diagram

## SQL Queries

## Data Quality Evaluation
I cleaned and analyzed the receipts schema using pandas. Specifically, I explored the shape and structure of the data and evaluated the missing and unique values in the data frame. I would definitely look into bonusPointsEarned & bonusPointsEarnedReason as they both have a high number of missing values. However, in this phase of EDA the data seems sound. Moving forward I would defintily utilize the numpy and matplotlib packages to check the normality through a historgram, box-plot etc. 

![Capture](https://user-images.githubusercontent.com/78304652/132500383-4e26f500-8800-4d21-a3c9-cea01634c6a5.PNG)

## Communicate with Stakeholders
Dear Ms. Smith,
	Thank you for taking the time to meet with me later today. There are a few stoppers that we need to discuss in order for me to continue with my work. After cleaning the data in python, I discovered some quality issues. Could you please provide me with the source of xyz data set, and potentially a contact that I could discuss any technical details with? I need to know a bit more about how this quarter’s data is being structured so that I can reason whether or not some missing values make sense. Lastly, I propose a cross-functional meeting with x department in order to discuss some areas in which we could optimize the data pipeline in order to get it ready for production. I have some concerns about how efficient the process will be if it’s overloaded with data. I’ve cc’d the java team and we can discuss mediation at a later date. See you later today, the meeting should only last around 30 minutes.
  
With Anticipation,

Emily Hersh 


## Conclusion
Thank you for your time and I hope to have the opportunity to speak with you further about how I can be an asset to your team.
