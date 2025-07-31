from collections import defaultdict

purchases = [
    ("Alice", "Laptop", "Electronics"),
    ("Bob", "Mouse", "Electronics"),
    ("Alice", "Keyboard", "Electronics"),
    ("Charlie", "Shampoo", "Personal Care"),
    ("David", "Soap", "Personal Care"),
    ("Charlie", "Toothpaste", "Personal Care"),
    ("Eve", "Pen", "Stationery"),
    ("Alice", "Notebook", "Stationery"),
    ("Frank", "Marker", "Stationery"),
    ("Eve", "Monitor", "Electronics"),
    ("Bob", "Tablet", "Electronics"),
]

groups = {}

# Step 1: Group products by category
for name, product, category in purchases:
    if category not in groups:
        groups[category] = []
    groups[category].append(product)

result = {}

# Step 2: For each category, count first letters
for category, products in groups.items():
    letter_counts = defaultdict(int)

    for product in products:
        first_letter = product[0].upper()
        letter_counts[first_letter] += 1

    # Step 3: Find the most common letter
    top_letter = max(letter_counts, key=letter_counts.get)
    result[category] = top_letter

# Step 4: Print result
print(result)
