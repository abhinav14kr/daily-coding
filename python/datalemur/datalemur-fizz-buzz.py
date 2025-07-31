"""
Write a function fizz_buzz_sum to find the sum of all multiples of 3 or 5 below a target value.

For example:
If the target value is 10, the multiples of 3 or 5 below 10 are:
3, 5, 6, and 9

Since 3 + 5 + 6 + 9 = 23, the function should return 23.
"""

def fizz_buzz_sum(target):
  sum = 0
  for i in range(target):
    if (i % 3 == 0) or (i % 5==0):
      sum += i
  return sum