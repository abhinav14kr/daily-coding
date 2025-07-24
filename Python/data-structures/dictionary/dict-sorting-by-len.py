'''
words = ["apple", "dog", "banana", "cat", "apricot", "hat", "grape", "pie"]

Group the words by their length, so the output looks like this:

{
  3: ["dog", "cat", "hat", "pie"],
  5: ["apple", "grape"],
  6: ["banana"],
  7: ["apricot"]
}

'''


words = ["apple", "dog", "banana", "cat", "apricot", "hat", "grape", "pie"]

groups = {}

for word in words: 
	first_key  = len(word)

	if first_key not in groups:
		groups[first_key] = []
		groups[first_key].append(word)
		sorted_group = sorted(groups.items())

print(sorted_group)
