people = [
    ("Alice", 24),
    ("Bob", 35),
    ("Charlie", 17),
    ("David", 45),
    ("Eva", 52),
    ("Frank", 29),
    ("Grace", 68),
    ("Hannah", 34),
    ("Ian", 15),
    ("Jack", 73)
]


groups = {}

for name, age in people:
    if age <= 18:
        group = 'minor'
    elif 19 <= age <= 35:
        group = 'Young adult'
    elif 36 <= age <= 60:
        group = 'Adult'
    else:
        group = 'senior'

    if group not in groups:
        groups[group] = []
    groups[group].append(name)

print(groups)