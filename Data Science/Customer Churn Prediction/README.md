# Customer Churn Prediction

Enclosed in this folder is my project built in R to predict customer churn rates for telecommunication providers.

## Table of Contents

1. TL;DR
2. Project Overview
3. Data Description
4. EDA
5. Building a Model
6. Results

## TL;DR
* EDA / Supervised Learning Project using telecom data 
* Goal: to predict behavior to retain customers. 


## Project Overview
  In this project, customer data has been analyzed in order to build a model that predicts customers who are more likely to churn. This in turn helps telecommunication companies identify and target customers with specific marketing and promotions to prevent them from switching to a competitor. 
  
  The main goal is to identify factors from a sample dataset that have the most impact on customer churn. 
  
  This project is divided into two steps:
  
    1. Data Cleaning and Exploratory Data Analysis. This helps us understand the data
       and determine which factors might impact customer churn. 
       
    2. Customer Identification using Supervised Learning. In this part of the project,
       customer data with defined targets indicating the past behavior of the customers 
       has been used to train Supervised Learning Algorithms. Then the trained data is used
       to make predictions on the unseen test data to determine whether the customer will churn or not. 

## Data Description
The data has been provided by IBM and contains 7,043 rows. The dataset contains one csv file, each row represents a customer with each column containing customer attributes described on the column metadata. 
		
The dataset contains information about:
* Customers who left within the last month - 'Churn"
* Services that each customer has signed up for: PhoneService, MultipleLines,	InternetService,	OnlineSecurity,	OnlineBackup,	DeviceProtection,	TechSupport,	     StreamingTV,	StreamingMovies, (I created an additional column called “Number of Services” which counts how many additionally services a customer had signed up for)
* Customer account information: tenure, Contract,	PaperlessBilling,	PaymentMethod,	MonthlyCharges,	TotalCharges
* Demographic information: gender,	SeniorCitizen,	Partner,	Dependents

***Please note that the criteria for "Senior Citizen" was not defined,
for the purposes of this project we will define senior citizen as > 65

## Exploratory Data Analysis

### Preliminary Analysis Bar Plots

<img width="476" alt="Screen Shot 2021-03-28 at 3 05 08 PM" src="https://user-images.githubusercontent.com/78304652/112751700-01276900-8fd8-11eb-80b5-bfac9037c441.png"><img width="466" alt="Screen Shot 2021-03-28 at 3 05 24 PM" src="https://user-images.githubusercontent.com/78304652/112751704-05ec1d00-8fd8-11eb-807e-12ac2d4fc170.png">
<img width="461" alt="Screen Shot 2021-03-28 at 3 06 13 PM" src="https://user-images.githubusercontent.com/78304652/112751708-0e445800-8fd8-11eb-8117-9bfea68fca8a.png"><img width="483" alt="Screen Shot 2021-03-28 at 3 05 34 PM" src="https://user-images.githubusercontent.com/78304652/112751712-113f4880-8fd8-11eb-9e60-355bb286a5d9.png">
<img width="427" alt="Screen Shot 2021-03-28 at 3 06 02 PM" src="https://user-images.githubusercontent.com/78304652/112751743-2e741700-8fd8-11eb-964d-a3fae1ff61c8.png"><img width="470" alt="Screen Shot 2021-03-28 at 3 05 48 PM" src="https://user-images.githubusercontent.com/78304652/112752060-c8888f00-8fd9-11eb-9e88-b62b2acf1ad6.png">
<img width="478" alt="Screen Shot 2021-03-28 at 3 05 55 PM" src="https://user-images.githubusercontent.com/78304652/112751741-2caa5380-8fd8-11eb-98a7-1e355078b0ee.png"><img width="436" alt="Screen Shot 2021-03-28 at 3 27 38 PM" src="https://user-images.githubusercontent.com/78304652/112752125-2d43e980-8fda-11eb-9682-8b681d438563.png">

### Chi Squared Goodness of Fit

<img width="657" alt="Screen Shot 2021-03-28 at 3 31 45 PM" src="https://user-images.githubusercontent.com/78304652/112752554-49e12100-8fdc-11eb-9a2b-1f1cf2662fdb.png">

Insights: Both the barplots and Chi squared test show us that all variables but Gender are viable predictors for churn. 

## Building a Model
### Model 1:
I used the 70 train/ 30 test split to create my datasets. To begin with, I fitted a basic logistic regression model with our variables. It is important to use logistic rather than linear since our outcome is either 1 or 0 and therefore not continuous. 

myglm1= glm(Churn~ gender+ Partner+ tenure + SeniorCitizen + PaymentMethod + PhoneService + InternetService + MonthlyCharges,data=churn.train, family= "binomial")

From the model output I discovered that  Payment with Credit Cards was the only insignificant variable. The tenure coefficient means that the log odds that a customer will churn decreases by 0.026982 for every unit increase in tenure. Similarly, the log odds that a customer will churn increases by 0.151946 for every additional service. 

Then I tested the sample predictions by calculating the ROC and the area under the curve (0.832)

<img width="470" alt="Screen Shot 2021-03-28 at 4 00 09 PM" src="https://user-images.githubusercontent.com/78304652/112753038-b52bf280-8fde-11eb-9ad8-d3ab428530ab.png">

From there, I calculated the cutoff and y hat for our data.  I used these new binary classifications to create a confusion matrix and  calculate the misclassification rate. And finally the False Positive Rate and False Negative Rate. 

### Model 2:
Finally, I used variable selection techniques to form a new model. I used stepwise by creating a null and full model, and then let R do the stepwise selection. It choose:

  glm(formula = Churn ~ Contract + MonthlyCharges + tenure + MultipleLines + number.services + TotalCharges + PaymentMethod + PaperlessBilling + TechSupport +     SeniorCitizen + OnlineSecurity + OnlineBackup, family = binomial, data = churn.train),  as the model. 
  
The new model has a few statistically insignificant predictors: OnlineBackup, PaymentMethodMailed check , PaymentMethodCredit card and MultipleLinesYes.

Here I visualized the ROC and AUC (0.861), and calculated the cutoff and y hat for our data.  I used these new binary classifications to create a confusion matrix and  calculate the misclassification rate. And finally the False Positive Rate and False Negative Rate. 

<img width="393" alt="Screen Shot 2021-03-28 at 4 03 28 PM" src="https://user-images.githubusercontent.com/78304652/112753172-2c618680-8fdf-11eb-8d4c-a0ea20896a12.png">

## Results

My final recommendation would be the stepwise variable selection model (model 2). Overall, Model 2 has a higher area under the curve and a lower rate of misclassification. Similarly, AIC and BIC are lower, which is exactly what we want from our model. 

Here is the comparison between the two models:

<img width="736" alt="Screen Shot 2021-03-28 at 4 05 35 PM" src="https://user-images.githubusercontent.com/78304652/112753274-a1cd5700-8fdf-11eb-92ff-256b841fee96.png">

In the end, variables such as: Contract + MonthlyCharges + tenure + MultipleLines + number.services + TotalCharges + PaymentMethod + PaperlessBilling + TechSupport +     SeniorCitizen + OnlineSecurity + OnlineBackup, have the biggest impact on customer churn. These factors should be the main focus of customer rentention programs within the telecommunications industry. 

