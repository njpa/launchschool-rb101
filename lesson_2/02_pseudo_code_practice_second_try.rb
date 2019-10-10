=begin

Write out pseudo-code (both casual and formal) that does the following:

EX. 1
=====
A method that returns the sum of two integers

-- CASUAL PSEUDOCODE

Given two integers
Save sum of both integers
Return saved sum

-- FORMAL PSEUDOCODE

Given a pair of numbers
SET sum = sum of numbers
PRINT sum

EX. 2
=====
A method that takes an array of strings, and returns a string that is all
those strings concatenated together.

-- CASUAL PSEUDOCODE

Given an array of strings
Concatenate all strings of array and save into a string
Return saved string

-- FORMAL PSEUDOCODE

START
Given an array of strings
SET result = ''
SET iterator = 1
WHILE iterator <= length of array
  SET current_string = string within array at space 'iterator'
  SET result = result + saved string
  SET iterator = iterator + 1
PRINT result
END

EX 3
====
A method that takes an array of integers, and returns a new array with every
other element

-- CASUAL PSEUDOCODE

Given an array of integers
Save a new empty array
Iterate through the array
  - in the first iteration, copy the element at that position into
    the new array
  - in the next, do nothing,
  - so on and so forth
After iteration, return new array

-- FORMAL PSEUDOCODE

START
Given an array of integers
SET counter = 1
SET result = []
WHILE counter <= size of array
  - push element of array at position "counter" if counter is odd
  - SET counter = counter + 1
PRINT result
END

=end
