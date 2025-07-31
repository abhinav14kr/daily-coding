purchases = [
    ("Alice", "Laptop"),
    ("Bob", "Mouse"),
    ("Alice", "Keyboard"),
    ("Charlie", "Shampoo"),
    ("Bob", "Monitor"),
    ("Alice", "Notebook"),
    ("Charlie", "Toothpaste"),
    ("Alice", "Pen"),
    ("Bob", "Tablet"),
]


groups = {}

for customer, product in purchases: 
    if customer not in groups: 
        groups[customer] = 0
    groups[customer] += 1


for customer, number in groups.items():
    print(f"{customer} purchased {number} items")

