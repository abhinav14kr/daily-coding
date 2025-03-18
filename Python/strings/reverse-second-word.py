 s = 'one two three four five six'
 s1 = s.split()
 print(s1)

 i = 0
 l1 = []

 while i < len(s1): 
     if i%2 == 0: 

        l1.append(l[i])
    else: 
        l1.append(l[i][::-1])
    i = i+1

output = ' '.join(la)
print(output)
