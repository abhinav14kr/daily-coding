"""
Write a function to get the intersection of two lists.

For example:
If A = [1, 2, 3, 4, 5] and B = [0, 1, 3, 7]
Then the function should return [1, 3]
"""

def intersection(a, b):
  answer = []
  for value in a: 
    if value in b: 
      answer.append(value)
  return [answer]