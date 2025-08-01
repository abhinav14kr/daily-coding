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

for name, product, category in purchases: 
	if category not in groups: 
		groups[category] = set()
	groups[category].add(name)


results = {}
for category, name in groups.items():
	results[category] = len(name)
	

print(results)


