text = "apple banana apple orange banana apple grape grape orange apple"

text = text.split(" ")
groups = {}
for word in text:
    if word not in groups:
        groups[word] = 0 
    groups[word] += 1

print(groups)
