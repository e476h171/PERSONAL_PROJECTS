# Suicide Prevention

## TW: SI, mention of suicide, description of suicide

<details><summary>CLICK ME</summary>
<p>

This is an incredibly complex topic and I by no means want this project to be insulting or degrading to individuals who have experience suicidal thoughts or lost a loved one to suicide. This is a simple machine learning project that is aiming to aid in prevention. Please keep in mind that by nature, suicide data is often biased and inaccurate due to the sensitivity of the topic (see quote by the World Health Organization below).

“Globally, the availability and quality of data on suicide and suicide attempts is poor. Only 80 Member States have good-quality vital registration data that can be used directly to estimate suicide rates. This problem of poor-quality mortality data is not unique to suicide, but given the sensitivity of suicide – and the illegality of suicidal behaviour in some countries – it is likely that under-reporting and misclassification are greater problems for suicide than for most other causes of death.”

</p>
</details>
</details>

Enclosed in this folder is my project built in R to predict the factors that can lead to suicide and aid in awareness and prevention efforts. 

## Table of Contents

1. Project Overview
2. Data Description
3. EDA
4. Building a Model
5. Results
6. Conclusion

## Project Overview
Suicide is a complex issue and therefore suicide prevention efforts require coordination and collaboration among multiple sectors of society, including the health sector and other sectors such as:

* Education 
* Labour 
* Agriculture
* Business 
* Justice 
* Law 
* Defense 
* Politics, and the media 

These efforts must be comprehensive and integrated, as no single approach alone can make an impact on an issue as complex as suicide. Suicides are preventable. There are a number of measures that can be taken at population, sub-population and individual levels to prevent suicide and suicide attempts.

  In this project, real health and socio-economic data has been analyzed in order to build a model that predicts factors that are most attributed to death by suicide. This in turn helps organizations and goverments to identify and target segements of the population with specific resources and support to aid in prevention. 
  
  The main goal is to identify factors from a sample dataset that have the most impact on suicide rate. 
  
  This project is divided into two steps:
  
    1. Data Cleaning and Exploratory Data Analysis. This helps us understand the data
       and determine which factors might impact suicide. 
       
    2. Customer Identification using Supervised Learning. In this part of the project,
       health and socio-economic data with defined targets indicating the factors that lead to suicide
       has been used to train Supervised Learning Algorithms. Then the trained data is used
       to make predictions on the unseen test data to determine whether a person is at risk of suicide. 

## Data Description
The data has been provided by the user 'Rusty' on Kaggle and contains 27,820 rows. This is a compiled dataset pulled from four other datasets linked by time and place, and was built to find signals correlated to increased suicide rates among different cohorts globally, across the socio-economic spectrum. 
		
The dataset contains variables in two seperate cateogories:
* Continuous: Year, Age, Suicides_no, Population, suicides/100k pop, HDI for year, gdp_for_year ($), gdp_per_capita ($)
* Categorical: Country, Sex, Country-year, Generation

## Exploratory Data Analysis

### Preliminary Analysis Bar Plots

#### Quick Note:
<details><summary>CLICK ME</summary>
<p>
  
Before I began the EDA process, I:
* Cleaned the data/renamed variables
* Applied the mean to missing values 

I chose to do EDA on 8 areas:
* Predictors: Country, Year, Sex, Age, Generation, HDI for year, Gdp_for_year ($) , Gdp_per_capita ($)
* Response: Suicide_rate

</p>
</details>
</details>

<details><summary>SEX</summary>
<p>
<img width="552" alt="Screen Shot 2021-03-29 at 2 41 25 PM" src="https://user-images.githubusercontent.com/78304652/112831680-faaef500-909c-11eb-92b8-697cd2968a5f.png"><img width="231" alt="Screen Shot 2021-03-29 at 2 41 39 PM" src="https://user-images.githubusercontent.com/78304652/112831692-fda9e580-909c-11eb-9832-60b319d6ef97.png">

<img width="502" alt="Screen Shot 2021-03-29 at 2 43 04 PM" src="https://user-images.githubusercontent.com/78304652/112831782-187c5a00-909d-11eb-9e2d-aee3a78bea18.png"> 
(Morgan, Liam. Trends Over Time, by Sex).


Globally the suicide rate is nearly ~4x higher for men than it is for women. it has been declining since 1995 for both sexes.

</p>
</details>
</details>

<details><summary>AGE</summary>
<p>
<img width="541" alt="Screen Shot 2021-03-29 at 2 44 46 PM" src="https://user-images.githubusercontent.com/78304652/112831996-5ed1b900-909d-11eb-876a-76ee8c5107e0.png"><img width="236" alt="Screen Shot 2021-03-29 at 2 44 52 PM" src="https://user-images.githubusercontent.com/78304652/112832006-61cca980-909d-11eb-8266-24e9b4461a5f.png">

<img width="461" alt="Screen Shot 2021-03-29 at 2 45 04 PM" src="https://user-images.githubusercontent.com/78304652/112832009-62fdd680-909d-11eb-9d41-e37b89f7493a.png">
(Morgan, Liam. Trends Over Time, by age)

Globally the suicides committed increases with age, but it has been declining over time, as shown in this figure.

</p>
</details>
</details>

<details><summary>GENERATION</summary>
<p>
<img width="529" alt="Screen Shot 2021-03-29 at 2 47 25 PM" src="https://user-images.githubusercontent.com/78304652/112832490-0fd85380-909e-11eb-914c-95614de97bf7.png"><img width="262" alt="Screen Shot 2021-03-29 at 2 47 34 PM" src="https://user-images.githubusercontent.com/78304652/112832493-11a21700-909e-11eb-969a-d37d4814d84d.png">

 
</p>
</details>
</details>

<details><summary>AGE AND GENERATION</summary>
<p>
  
The Association between Age and Generation is very important to consider in our linear regression.
  * The chi-square test gave us a P-value of 2.2e-16.

Generation Breakdown:
  * Gen Z, iGen, or Centennials: Born 1996 +
  * Millennials or Gen Y: Born 1977 – 1995
  * Generation X: Born 1965 – 1976
  * Baby Boomers: Born 1946 – 1964
  * Traditionalists or Silent Generation: Born 1925 -1945
  * G.I. Generation: Born 1901–1924

</p>
</details>
</details>


<details><summary>HUMAN DEVELOPMENT INDEX</summary>
<p>
<img width="527" alt="Screen Shot 2021-03-29 at 2 51 11 PM" src="https://user-images.githubusercontent.com/78304652/112832686-58900c80-909e-11eb-9f5a-dbbdbea57ff4.png">

This was an insignficant variable with r = 0.037

</p>
</details>
</details>

<details><summary>GDP FOR YEAR</summary>
<p>
 <img width="531" alt="Screen Shot 2021-03-29 at 2 53 30 PM" src="https://user-images.githubusercontent.com/78304652/112832886-a0169880-909e-11eb-8d5e-03585f785b8f.png">
 
This was an insignficant variable with r = 0.027
  
</p>
</details>
</details>

<details><summary>GDP PER CAPITA</summary>
<p>

<img width="537" alt="Screen Shot 2021-03-29 at 2 54 44 PM" src="https://user-images.githubusercontent.com/78304652/112832960-b886b300-909e-11eb-8ea2-7ac300ef5fbf.png">

This was an insignficant variable with r = 0.0018
  
</p>
</details>
</details>

#### Insights: From the visualizations and chi-squared tests, it is evident that Age, Sex and Generation are the most impactful predictors. 

## Building a Model
### Model 1:
I used the 90 train/ 10 test split to create my datasets. To begin with, I fitted a basic linear regression model with all 3 variables (sex, age and generation)

lm.fit1= lm(suicide_rate~age + sex + generation,data=suicide.train)

* Adjusted R squared: 0.296
* AIC: 209,604.8
* BIC: 209,710.5
* MSPE: 257.4544

<img width="609" alt="Screen Shot 2021-03-29 at 3 15 50 PM" src="https://user-images.githubusercontent.com/78304652/112835387-e02b4a80-90a1-11eb-8716-84d000f2c912.png">


### Model 2:
I used the 90 train/ 10 test split to create my datasets. Model 2 was a basic linear regression model with the variables Age and Sex

lm.fit2= lm(suicide_rate~age + sex,data=suicide.train)

* Adjusted R squared: 0.2945
* AIC: 209,654.2
* BIC: 209,719.2
* MSPE: 258.4258

<img width="641" alt="Screen Shot 2021-03-29 at 3 19 50 PM" src="https://user-images.githubusercontent.com/78304652/112835659-3c8e6a00-90a2-11eb-8818-e6150aafa7fb.png">


### Model 3:
I used the 90 train/ 10 test split to create my datasets. Model 3 was a basic linear regression model with the variables Generation and Sex

lm.fit3= lm(suicide_rate~generation + sex,data=suicide.train)

* Adjusted R squared: 0.2665
* AIC: 210,628.4
* BIC: 210,693.4
* MSPE: 266.4873

<img width="656" alt="Screen Shot 2021-03-29 at 3 22 16 PM" src="https://user-images.githubusercontent.com/78304652/112835908-92631200-90a2-11eb-8919-33266d5509c5.png">


## Results

I believe that Model 1 (Age, Sex and Generation) is the best for the following reasons:
  * The Adjusted R Squared for this model was the highest at 0.296. As a reminder this measures the proportion of variation in the dependent variable that can be   attributed to the independent variable. 
  * The AIC and BIC were virtually the same across all models.
  * It has the lower MSPE out of the two stronger models. 
  * Most importantly, the plot of Model 1 exhibits the lowest influence of the constant variance assumption.

## Conclusion

Obviously this project did not amount to any new discoveries about factors that lead to suicide. However, it DID teach me a lot about what data science is really like. Sometimes you derive meaningful insights from data which in turn adds value to the world, but often times the data is messy and after hours of analysis you find nothing. The main thing is perfecting the process and sticking to the ethical foundation which must always be followed, to test a hypothesis and gain insights rather than manipulating the data to get the result YOU want.   
