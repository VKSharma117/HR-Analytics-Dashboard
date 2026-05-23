import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv("HR Analytics Dashboard\IBM_HR_analytics_employee_attrition_&_performance.csv")

df.info()
print(df.describe())
print(df.shape)
print(df.columns)
print(df.isnull().sum())
print(df.duplicated().sum())


# Unique Values

print("\nAttrition Unique Values:")
print(df['Attrition'].unique())

print("\nDepartment Unique Values:")
print(df['Department'].unique())

print("\nGender Unique Values:")
print(df['Gender'].unique())

print("\nOver Time Unique Values:")
print(df['Over Time'].unique())

# Attrition Count

print("\nAttrition Count:")
print(df['Attrition'].value_counts())

# Attrition Visualization

df['Attrition'].value_counts().plot(kind='bar')
plt.title("Attrition Count")
plt.xlabel("Attrition")
plt.ylabel("Number of Employees")
plt.show()

# Department Wise Employee Count

print("\nDepartment Wise Employee Count:")
print(df['Department'].value_counts())

# Department Wise Employee Distribution

df['Department'].value_counts().plot(kind='bar')
plt.title("Department Wise Employees")
plt.xlabel("Department")
plt.ylabel("Employee Count")
plt.xticks(rotation=45)
plt.show()

# Job Role Wise Employee Count

print("\nJob Role Wise Employee Count:")
print(df['Job Role'].value_counts())

# Salary Analysis

print("\nAverage Salary:")
print(df['Monthly Income'].mean())

print("\nHighest Salary:")
print(df['Monthly Income'].max())

print("\nLowest Salary:")
print(df['Monthly Income'].min())

# Average Age

print("\nAverage Age:")
print(round(df['Age'].mean(), 2))

# Gender Distribution

df['Gender'].value_counts().plot(kind='pie', autopct='%1.1f%%')
plt.title("Gender Distribution")
plt.ylabel("")
plt.show()

# Monthly Income Distribution

plt.hist(df['Monthly Income'], bins=20)
plt.title("Monthly Income Distribution")
plt.xlabel("Monthly Income")
plt.ylabel("Employee Count")
plt.show()

# Age Distribution

plt.hist(df['Age'], bins=15)
plt.title("Age Distribution")
plt.xlabel("Age")
plt.ylabel("Employee Count")
plt.show()

# Overtime Distribution

df['Over Time'].value_counts().plot(kind='bar')
plt.title("Overtime Distribution")
plt.xlabel("OverTime")
plt.ylabel("Employee Count")
plt.show()

# Job Satisfaction Distribution

df['Job Satisfaction'].value_counts().plot(kind='bar')
plt.title("Job Satisfaction")
plt.xlabel("Satisfaction Level")
plt.ylabel("Employee Count")
plt.show()

# Work Life Balance Distribution

df['Work Life Balance'].value_counts().plot(kind='bar')
plt.title("Work Life Balance")
plt.xlabel("Work Life Balance Rating")
plt.ylabel("Employee Count")
plt.show()

# Top 10 Highest Paid Employees

top_salary = df[['Employee ID', 'Job Role', 'Monthly Income']].sort_values(
    by='Monthly Income',
    ascending=False
)
print("\nTop 10 Highest Paid Employees:")
print(top_salary.head(10))

# Employees With Over Time and Low Work Life Balance

filtered_df = df[
    (df['Over Time'] == 'Yes') &
    (df['Work Life Balance'] == 1)
]

print("\nEmployees With Over Time and Low Work Life Balance:")
print(filtered_df[['Employee ID', 'Job Role', 'Department']])

# Attrition Percentage

attrition_rate = ((df['Attrition'].value_counts()['Yes']) / len(df)) * 100
print("\nAttrition Rate:")
print(round(attrition_rate, 2), "%")

print("\n Project Complete")
