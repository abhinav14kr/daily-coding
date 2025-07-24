
scores = [
        ("Alice", 85),
        ("Bob", 92),
        ("Charlie", 78),
        ("David", 64),
        ("Eve", 99),
        ("Frank", 55),
        ("Grace", 70),
        ("Hannah", 88),
    ]

groups = {}

for name, number in scores:
    if number >= 90:
        groupkey = 'Excellent'
    elif 75 <= number <= 89:
        groupkey = 'Good'
    elif 60 <= number <= 74:
        groupkey = 'Average'
    else:
        groupkey = 'Poor'

    if groupkey not in groups:
        groups[groupkey] = []
    groups[groupkey].append(name)

print(groups)
