# EDA: Upload and get a general understanding of data
library(tidyverse)
churn.dat<- read_csv("TelcoChurn.csv")
churn.dat

#Transform SeniorCitizen Parameter to numeric value
churn.dat<- mutate(churn.dat, SeniorCitizen=ifelse(SeniorCitizen=="Yes", 1, 0))
churn.dat<- mutate(churn.dat, SeniorCitizen=ifelse(SeniorCitizen== 1, "Yes", "No"))
#Get Parameter Names
names(churn.dat)

# Table view of our data
view(churn.dat)

#Get how many rows and columns the csv contains
dim(churn.dat)

# Gives summary of each parameter
summary(churn.dat)

#Mean value of Churn
mean(churn.dat$Churn=="Yes")

##EDA: I've picked 8 predictors, now lets explore them:
# gender, SeniorCitizen, tenure, PaperlessBilling
# Number of Services, Contract, PaymentMethod, MonthlyCharges


#CONTRACT
##For the 'CHURN' field- No means they stayed with the company (positive result)
Contract.Table=table(churn.dat$Contract,churn.dat$Churn)

#total proportion of values by churn, 73% stayed, 26% left
prop.table(table(churn.dat$Churn))

#Bar Plot showing the break down of churn by contract types: Month-to-Month, One Year and Two Year
churn.dat %>% count(Contract, Churn) %>%
  group_by(Contract)%>%
  mutate(prop = prop.table(n))%>%
  ggplot(aes(x=Contract, y=prop, fill=Churn))+
  geom_bar(stat="identity", position = "fill")+
  geom_text(aes(label=paste(round(prop,3)*100, "%")), position = position_fill(vjust=0.5))

#Gets a table with Churn on X axis and Contract type on Y axis 
tab.contract<- table(churn.dat$Contract, churn.dat$Churn, dnn = c("Contract", "Churn"))
tab.contract
prop.table(tab.contract, 1)

#Chi Squared test- Creates metrics that we can use to compare variables for our model
chisq.test(tab.contract)

## TENURE
#Bar plot showing churn rate by tenure year : 1y, 2y, 3y, >3y
churn.dat %>% 
  mutate(tenure.year= cut(tenure, breaks=c(-Inf, 12, 24, 36, Inf), labels=c("1yr", "2yrs", "3yrs", ">3yrs")))%>%
  group_by(tenure.year, Churn)%>%
  summarise(count=n())%>%
  mutate(prop = prop.table(count))%>%
  ggplot(aes(x=tenure.year, y=prop, fill=Churn))+
  geom_bar(stat="identity", position = "fill")+
  geom_text(aes(label=paste(round(prop,3)*100, "%")), position = position_fill(vjust=0.5))

# chi-square test
churn.dat<- churn.dat %>% 
  mutate(tenure.year= cut(tenure, breaks=c(-Inf, 12, 24, 36, Inf), labels=c("1yr", "2yrs", "3yrs", ">3yrs")))
tab.tenure<- table(churn.dat$tenure.year, churn.dat$Churn, dnn = c("Tenure", "Churn"))
tab.tenure
chisq.test(tab.tenure)

#SENIOR CITIZEN
#Bar plot for whether a customer is a senior citizen or not, dataset did not specific the age cutoff
churn.dat %>% count(Churn, SeniorCitizen) %>%
  group_by(Churn)%>%
  mutate(prop = prop.table(n))%>%
  ggplot(aes(x=Churn, y=prop, fill=SeniorCitizen))+
  geom_bar(stat="identity", position = "fill")+
  geom_text(aes(label=paste(round(prop,3)*100, "%")), position = position_fill(vjust=0.5))

# chi-square test
tab.senior<- table(churn.dat$SeniorCitizen, churn.dat$Churn, dnn = c("SeniorCitizen", "Churn"))
tab.senior
prop.table(tab.senior, 1)
chisq.test(tab.senior)

#PAYMENT
#Bar pLot for churn rate by payment method: Bank transfer, credit card, electronic check, mailed check
churn.dat %>% count(PaymentMethod, Churn) %>%
  group_by(PaymentMethod)%>%
  mutate(prop = prop.table(n))%>%
  ggplot(aes(x=PaymentMethod, y=prop, fill=Churn))+
  geom_bar(stat="identity", position = "fill")+
  geom_text(aes(label=paste(round(prop,3)*100, "%")), position = position_fill(vjust=0.5))

# chi-square test
tab.peyment<- table(churn.dat$PaymentMethod, churn.dat$Churn, dnn = c("Payment", "Churn"))
tab.peyment
chisq.test(tab.peyment)

#GENDER
#Barplot for churn rate by gender: Male and Female
churn.dat %>% count(Churn, gender) %>%
  group_by(Churn)%>%
  mutate(prop = prop.table(n))%>%
  ggplot(aes(x=Churn, y=prop, fill=gender))+
  geom_bar(stat="identity", position = "fill")+
  geom_text(aes(label=paste(round(prop,3)*100, "%")), position = position_fill(vjust=0.5))

# chi-square test
tab.gender<- table(churn.dat$gender, churn.dat$Churn, dnn = c("Gender", "Churn"))
tab.gender
prop.table(tab.gender, 1)
chisq.test(tab.gender)

#MONTHLY CHARGES
#EDA to see the max and min of monthly charges
names(churn.dat)
max(churn.dat$MonthlyCharges)
min(churn.dat$MonthlyCharges)

#Bar plot for churn rate by monthly charges, I created the categories low, medium and high
#by implementing breaks between 0-50, 50-100 and 100-120
churn.dat %>% 
  mutate(monthly.cat= cut(MonthlyCharges, breaks=c(-Inf, 50,100,120), labels=c("Low", "Medium", "High")))%>%
  group_by(monthly.cat, Churn)%>%
  summarise(count=n())%>%
  mutate(prop = prop.table(count))%>%
  ggplot(aes(x=monthly.cat, y=prop, fill=Churn))+
  geom_bar(stat="identity", position = "fill")+
  geom_text(aes(label=paste(round(prop,3)*100, "%")), position = position_fill(vjust=0.5))

# chi-square test
churn.dat<- churn.dat %>% 
  mutate(monthly.cat= cut(MonthlyCharges, breaks=c(-Inf, 50,100,120), labels=c("Low", "Medium", "High")))
tab.monthly<- table(churn.dat$monthly.cat, churn.dat$Churn, dnn = c("Monthly", "Churn"))
tab.monthly
chisq.test(tab.monthly)


#PAPERLESS BILLING
#Bar plot for churn rate by paperless billing (yes or no)
churn.dat %>% count(Churn, PaperlessBilling) %>%
  group_by(Churn)%>%
  mutate(prop = prop.table(n))%>%
  ggplot(aes(x=Churn, y=prop, fill=PaperlessBilling))+
  geom_bar(stat="identity", position = "fill")+
  geom_text(aes(label=paste(round(prop,3)*100, "%")), position = position_fill(vjust=0.5))

# chi-square test
tab.PaperlessBilling<- table(churn.dat$PaperlessBilling, churn.dat$Churn, dnn = c("PaperlessBilling", "Churn"))
tab.PaperlessBilling
prop.table(tab.PaperlessBilling, 1)
chisq.test(tab.PaperlessBilling)

###########PART 2

#CREATING NEW VARIABLES-NUMBER OF SERVICES
#Converting variables to 1's and 0's
churn.dat= mutate(churn.dat,InternetService = ifelse(InternetService%in% c("DSL", "Fiber optic"),1 ,0))
churn.dat= mutate(churn.dat,PhoneService = ifelse(PhoneService == "Yes",1,0))
churn.dat= mutate(churn.dat,OnlineSecurity = ifelse(OnlineSecurity== "Yes",1,0)) 
churn.dat= mutate(churn.dat,OnlineBackup = ifelse(OnlineBackup== "Yes",1,0))
churn.dat= mutate(churn.dat,DeviceProtection = ifelse(DeviceProtection== "Yes",1,0)) 
churn.dat= mutate(churn.dat,TechSupport = ifelse(TechSupport== "Yes",1,0))  
churn.dat= mutate(churn.dat,StreamingTV = ifelse(StreamingTV== "Yes",1,0)) 
churn.dat= mutate(churn.dat,StreamingMovies = ifelse(StreamingMovies== "Yes",1,0))

#suming columns
churn.dat<- mutate(churn.dat,number.services=(InternetService+PhoneService+OnlineSecurity+OnlineBackup+DeviceProtection+TechSupport+StreamingTV+StreamingMovies))

#EDA for this variable
#Barplot for churn rate by total number of monthly services by subscriber (1-8)
churn.dat %>% 
  mutate(number.services.new= cut(number.services, breaks=c(-Inf, 1, 2, 3, 4, 5, 6, 7 ,8), labels=c("1", "2", "3", "4", "5", "6", "7", "8")))%>%
  group_by(number.services.new, Churn)%>%
  summarise(count=n())%>%
  mutate(prop = prop.table(count))%>%
  ggplot(aes(x=number.services.new, y=count, fill=Churn))+
  geom_bar(stat="identity", position = "fill")+
  geom_text(aes(label=paste(round(prop,3)*100, "%")), position = position_fill(vjust=0.5))

# chi-square test
churn.dat<- churn.dat %>% 
  mutate(number.services.new= cut(number.services, breaks=c(-Inf, 1, 2, 3, 4, 5, 6, 7 ,8), labels=c("1", "2", "3", "4", "5", "6", "7", "8")))
tab.services<- table(churn.dat$number.services.new, churn.dat$Churn, dnn = c("Number of Services", "Churn"))
tab.services
chisq.test(tab.services)

#####PART 3
#Reuploading original data
library(tidyverse)
churn.dat<- read_csv("TelcoChurn.csv")

#converting characters to factors
names(churn.dat)
class(churn.dat$customerID)
churn.dat$customerID<- as.factor(churn.dat$customerID)

class(churn.dat$gender)
churn.dat$gender<- as.factor(churn.dat$gender)

class(churn.dat$SeniorCitizen)
churn.dat$SeniorCitizen<- as.factor(churn.dat$SeniorCitizen)

class(churn.dat$Dependents)
churn.dat$Dependents<- as.factor(churn.dat$Dependents)

class(churn.dat$Partner)
churn.dat$Partner<- as.factor(churn.dat$Partner)

class(churn.dat$PhoneService)
churn.dat$PhoneService<- as.factor(churn.dat$PhoneService)

class(churn.dat$MultipleLines)
churn.dat$MultipleLines<- as.factor(churn.dat$MultipleLines)

class(churn.dat$InternetService)
churn.dat$InternetService<- as.factor(churn.dat$InternetService)

class(churn.dat$OnlineSecurity)
churn.dat$OnlineSecurity<- as.factor(churn.dat$OnlineSecurity)

class(churn.dat$OnlineBackup)
churn.dat$OnlineBackup<- as.factor(churn.dat$OnlineBackup)

class(churn.dat$DeviceProtection)
churn.dat$DeviceProtection<- as.factor(churn.dat$DeviceProtection)

class(churn.dat$TechSupport)
churn.dat$TechSupport<- as.factor(churn.dat$TechSupport)

class(churn.dat$StreamingTV)
churn.dat$StreamingTV<- as.factor(churn.dat$StreamingTV)

class(churn.dat$StreamingMovies)
churn.dat$StreamingMovies<- as.factor(churn.dat$StreamingMovies)

class(churn.dat$Contract)
churn.dat$Contract<- as.factor(churn.dat$Contract)

class(churn.dat$PaperlessBilling)
churn.dat$PaperlessBilling<- as.factor(churn.dat$PaperlessBilling)

class(churn.dat$PaymentMethod)
churn.dat$PaymentMethod<- as.factor(churn.dat$PaymentMethod)

class(churn.dat$Churn)
churn.dat$Churn<- as.factor(churn.dat$Churn)

(l <- sapply(churn.dat, function(x) is.factor(x)))
m <- churn.dat[, l]
ifelse(n <- sapply(m, function(x) length(levels(x))) == 1, "DROP", "NODROP")


####Training and Testing 
churn.dat= mutate(churn.dat,Churn = ifelse(Churn == "Yes",1,0))
set.seed(2019)
#Creating testing and training sets with 70/30 split
index <- sample(nrow(churn.dat),nrow(churn.dat)*0.70)
churn.train <- churn.dat[index,] 
churn.test <- churn.dat[-index,] 

#First logistic regression model
myglm1= glm(Churn~ gender+ Partner+ tenure + SeniorCitizen + PaymentMethod + PhoneService + InternetService + MonthlyCharges,data=churn.train, family= "binomial")
summary(myglm1)

#Finding deviance for model 1
myglm1$deviance

#AIC and BIC for model 1
AIC(myglm1)
BIC(myglm1)

###PART 4
mypredict1=predict(myglm1, newdata = churn.test,type="response")

#ROC
library(ROCR)
pred=prediction(mypredict1,churn.test$Churn)
perf=performance(pred,"tpr","fpr")
#This plot is the ROC curve
plot(perf, colorize=T)
#AUC
unlist(slot(performance(pred,"auc"),"y.values"))

## binary classification
#churn.dat= mutate(churn.dat,Churn = ifelse(Churn == "Yes",1,0))
table(churn.dat$Churn)
head(churn.dat)
cutoff=mean(churn.train$Churn)
yhat= as.numeric(mypredict1>cutoff)

#confusion matrix
table(churn.test$Churn,yhat, dnn=c("TURE","PRED"))

#misclassification rate
mean(churn.test$Churn!=yhat)

#fpr
sum(churn.test$Churn==0 & yhat==1)/sum(churn.test$Churn==0)
#fnr
sum(churn.test$Churn==1 & yhat==0)/sum(churn.test$Churn==1)

######PART 5
colSums(is.na(churn.dat))
churn.train$TotalCharges[which(is.na(churn.train$TotalCharges))]<- median(churn.train$TotalCharges, na.rm = T)
nullmodel<- glm(Churn~1 , data=churn.train, family = binomial)
fullmodel<- glm(Churn~SeniorCitizen+Partner+Dependents+tenure+PhoneService+MultipleLines+InternetService+OnlineSecurity+OnlineBackup+DeviceProtection+TechSupport+StreamingTV+StreamingMovies+ Contract+PaperlessBilling+PaymentMethod+MonthlyCharges+TotalCharges+number.services ,data=churn.train, family = binomial)
model2<- step(nullmodel, scope = list(lower=nullmodel, upper=fullmodel), direction = "both", trace = 0)

summary(model2)
model2$deviance
AIC(model2); BIC(model2)
#-----------------
mypredict2<- predict(model2, newdata = churn.test, type = "response")
#ROC
pred <- prediction(mypredict2, churn.test$Churn) 
perf <- performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)

#AUC
unlist(slot(performance(pred, "auc"), "y.values"))

## binary classification
cutoff=mean(churn.train$Churn)
yhat= as.numeric(mypredict2>cutoff)

#confusion matrix
table(churn.test$Churn,yhat, dnn=c("TURE","PRED"))

#misclassification rate
mean(churn.test$Churn!=yhat, na.rm = T)

#fpr
sum(churn.test$Churn==0 & yhat==1, na.rm = T)/sum(churn.test$Churn==0, na.rm = T)
#fnr
sum(churn.test$Churn==1 & yhat==0)/sum(churn.test$Churn==1)



