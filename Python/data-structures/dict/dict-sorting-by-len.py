words = ["apple", "dog", "banana", "cat", "apricot", "hat", "grape", "pie"]

groups = {}

for word in words: 
	first_key  = len(word)

	if first_key not in groups:
		groups[first_key] = []
		groups[first_key].append(word)
		sorted_group = sorted(groups.items())

print(sorted_group)
	