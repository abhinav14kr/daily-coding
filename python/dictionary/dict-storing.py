'''
You're given a list of names:
names = ["Alice", "Bob", "Amanda", "Brian", "Charlie", "Cara"]

Your goal is to group them by their starting letter, and store them in a dictionary like this:
{
  "A": ["Alice", "Amanda"],
  "B": ["Bob", "Brian"],
  "C": ["Charlie", "Cara"]
}

'''

names = ["Alice", "Bob", "Amanda", "Brian", "Charlie", "Cara"]

dict = {}

for name in names: 
    first_letter = name[0]

    if first_letter not in dict:
        dict[first_letter] = []
    dict[first_letter].append(name)

print(dict)



# alternate way to solve this 

from collections import defaultdict

names = ["Alice", "Bob", "Amanda", "Brian", "Charlie", "Cara"]
groups = defaultdict(list)

for name in names:
    first_letter = name[0]
    groups[first_letter].append(name)

print(dict(groups))  # optional: convert to regular dict for display


