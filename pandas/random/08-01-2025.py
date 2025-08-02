import pandas as pd

# Sample DataFrame
data = {
    'Customer': ['Alice', 'Bob', 'Alice', 'Charlie', 'David', 'Charlie', 'Eve', 'Alice', 'Frank', 'Eve', 'Bob', 'Alice'],
    'Product': ['Laptop', 'Mouse', 'Keyboard', 'Shampoo', 'Soap', 'Toothpaste', 'Pen', 'Notebook', 'Marker', 'Monitor', 'Tablet', 'Laptop'],
    'Category': ['Electronics', 'Electronics', 'Electronics', 'Personal Care', 'Personal Care', 'Personal Care',
                 'Stationery', 'Stationery', 'Stationery', 'Electronics', 'Electronics', 'Electronics'],
    'Price': [1000, 50, 80, 10, 5, 6, 1.5, 3, 2, 300, 400, 1000]
}

df = pd.DataFrame(data)
print(df)


# Group by Category and Product, count frequency

grouped_counts = df.groupby(['Category', 'Product']).size().reset_index(name='Count')
print(grouped_counts)


# Sort within each category and get top product

idx = grouped_counts.groupby('Category')['Count'].idxmax()
most_frequent_products = grouped_counts.loc[idx].reset_index(drop=True)

print(idx)
print(most_frequent_products)