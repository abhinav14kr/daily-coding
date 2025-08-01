purchases = [
    ("Alice", "Laptop"),
    ("Bob", "Mouse"),
    ("Alice", "Keyboard"),
    ("Charlie", "Shampoo"),
    ("Bob", "Mouse"),
    ("Alice", "Laptop"),
    ("Charlie", "Toothpaste"),
    ("Bob", "Mouse"),
    ("Alice", "Notebook"),
    ("Charlie", "Shampoo"),
    ("Bob", "Tablet"),
    ("Alice", "Laptop"),
]



groups = {}

for name, item in purchases: 
    if name not in groups: 
        groups[name] = []
    groups[name].append(item)

print(groups)

results = {}


for customer, items in groups.items():
    results[customer] = max(items, key=items.count)

print(results)


# alternate solution using defaultdict without manually checking if dictionary key exists

from collections import defaultdict, Counter

groups = defaultdict(list)
for name, item in purchases:
    groups[name].append(item)


results = {}
for customer, items in groups.items():
    most_common = Counter(items).most_common(1)[0][0]  # Top product
    results[customer] = most_common

print(results)
