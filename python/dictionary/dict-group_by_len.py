words = [
    "apple", "banana", "pear", "kiwi", "mango",
    "grape", "watermelon", "plum", "pineapple", "fig"
]


groups = {}

for word in words:
    length = len(word)

    if length not in groups:
        groups[length] = []
    groups[length].append(word)

print(groups)


for length, words in sorted(groups.items()):
    print(f"{length}: {words}")
