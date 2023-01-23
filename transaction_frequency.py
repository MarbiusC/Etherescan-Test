# Import libraries
import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt

# Connect to MySQL database
cnx = mysql.connector.connect(user='root', password='2RoadsD1v3rg3d*', host='localhost:3306', database='my_database')

# Retrieve data from 'transactions' table
query = 'SELECT timeStamp, blockNumber FROM transactions'
df = pd.read_sql(query, cnx)

# Convert timestamp column to datetime format
df['timeStamp'] = pd.to_datetime(df['timeStamp'], unit='s')

# Extract hour from timestamp and create new column
df['hour'] = df['timeStamp'].dt.hour

# Group data by hour and count number of transactions
transactions_by_hour = df.groupby(['hour']).size().reset_index(name='counts')

# Plot bar chart
plt.bar(transactions_by_hour['hour'], transactions_by_hour['counts'])
