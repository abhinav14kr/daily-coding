sales = [
    ("Laptop", "Electronics", 5),
    ("Mouse", "Electronics", 20),
    ("Keyboard", "Electronics", 12),
    ("Shampoo", "Personal Care", 30),
    ("Toothpaste", "Personal Care", 10),
    ("Soap", "Personal Care", 25),
    ("Notebook", "Stationery", 15),
    ("Pen", "Stationery", 50),
    ("Marker", "Stationery", 35),
    ("Monitor", "Electronics", 7),
]

groups = {}

for products, category, units in sales:
    if category not in groups or units > groups[category][1]:
        groups[category] = (products, units)

for category, (products, units) in groups.items():
    print(f"{category}: {products} ({units} units)")



