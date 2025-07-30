# Task: Count number of products purchased by each customer in the "Electronics" category.



""" 
import pandas as pd

data = {
    'Customer': ['Alice', 'Bob', 'Alice', 'Charlie', 'David', 'Charlie', 'Eve', 'Alice', 'Frank', 'Eve', 'Bob'],
    'Product': ['Laptop', 'Mouse', 'Keyboard', 'Shampoo', 'Soap', 'Toothpaste', 'Pen', 'Notebook', 'Marker', 'Monitor', 'Tablet'],
    'Category': ['Electronics', 'Electronics', 'Electronics', 'Personal Care', 'Personal Care', 'Personal Care',
                 'Stationery', 'Stationery', 'Stationery', 'Electronics', 'Electronics'],
    'Price': [1000, 50, 80, 10, 5, 6, 1.5, 3, 2, 300, 400]
}

df = pd.DataFrame(data)
filtered_df = df[df['Category'] == 'Electronics']
result = filtered_df.groupby('Customer')['Product'].count().reset_index()
result.columns = ['Customer', 'Product_Count']

print(result)
 """

# Task: Aggregate total revenue and average price by product category.

""" 
import pandas as pd
data = {
    'Customer': ['Alice', 'Bob', 'Alice', 'Charlie', 'David', 'Charlie', 'Eve', 'Alice', 'Frank', 'Eve', 'Bob'],
    'Product': ['Laptop', 'Mouse', 'Keyboard', 'Shampoo', 'Soap', 'Toothpaste', 'Pen', 'Notebook', 'Marker', 'Monitor', 'Tablet'],
    'Category': ['Electronics', 'Electronics', 'Electronics', 'Personal Care', 'Personal Care', 'Personal Care',
                 'Stationery', 'Stationery', 'Stationery', 'Electronics', 'Electronics'],
    'Price': [1000, 50, 80, 10, 5, 6, 1.5, 3, 2, 300, 400]
}
df = pd.DataFrame(data)


agg_df = df.groupby('Category').agg(
    Total_Revenue=('Price', 'sum'),
    Average_Price=('Price', 'mean')
).reset_index()

print(agg_df) 
"""