'''
You're given a list of student scores:
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

Group students into categories based on their score:

Score Range	Category
90 and above	"Excellent"
75 to 89	"Good"
60 to 74	"Average"
Below 60	"Poor"

Your final output should be a dictionary like this:

{
    "Excellent": ["Bob", "Eve"],
    "Good": ["Alice", "Charlie", "Hannah"],
    "Average": ["Grace", "David"],
    "Poor": ["Frank"]
}

'''

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
