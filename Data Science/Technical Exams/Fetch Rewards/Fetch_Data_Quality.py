#this code was run in pycharm
#please be sure to 'pip install pandas' to continue

#Convert JSON File to CSV
import pandas as pd
df = pd.read_json('receipts.json', lines = True)
df.to_csv (r'C:\Users\e.hersh\Desktop\receipts.csv', index = None)

#Next I explored the csv file manually and then reuploaded it as a data frame using pandas
data_file = 'receipts.csv'
data = pd.read_csv(
    data_file,
    sep=','
)
#then I got the shape of the data
print(f'''
shape : {df.shape}
''')
#evaluated the data type for each column
data_types = pd.DataFrame(
    data.dtypes,
    columns=['Data Type']
)

#evaluated the number of missing values in each column, I'm curious about bonusPointsEarned & bonusPointsEarnedReason
missing_data = pd.DataFrame(
    data.isnull().sum(),
    columns=['Missing Values']
)
#evaluted the number of unique values, im happy to see that that id has all unique values since that's our PK
unique_values = pd.DataFrame(
    columns=['Unique Values']
)
for row in list(data.columns.values):
    unique_values.loc[row] = [data[row].nunique()]

# created a mini report to display our findings
dq_report = data_types.join(missing_data).join(unique_values)
dq_report