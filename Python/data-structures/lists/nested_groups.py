products = [
    ("Laptop", "Electronics"),
    ("Mouse", "Electronics"),
    ("Shampoo", "Personal Care"),
    ("Toothpaste", "Personal Care"),
    ("Keyboard", "Electronics"),
    ("Notebook", "Stationery"),
    ("Pen", "Stationery"),
    ("Soap", "Personal Care"),
    ("Monitor", "Electronics"),
    ("Marker", "Stationery")
]

groups = {}

for product, category in products:
    if category not in groups:
        groups[category] = []
    groups[category].append(product)

for category, products in groups.items():
	print(f"{category} : {len(products)} items -> {products}")

print(groups)
