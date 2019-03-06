# Write out pseudo-code (both casual and formal) that does the following

# PROBLEM 1
# =========
# A method that returns the sum of two integers
#
# CASUAL PSEUDO-CODE
# ------------------
# Given two integers
# save the sum of the two integers as a sum
# return the sum value
#
# FORMAL PSEUDO-CODE
# ------------------
# START
# SET sum = sum of two integers
# RETURN sum
# END

# PROBLEM 2
# =========
# A method that takes an array of strings, and returns a string that is all 
# those strings concatenated together
#
# CASUAL PSEUDO-CODE
# ------------------
# Given an array of strings
# concatenate all of the strings and save it in variable
# output the concatenation
#
# FORMAL PSEUDO-CODE
# ------------------
# START
# SET iterator = 1
# SET concatenated = ""
# WHILE iterator <= number of elements in array
#   SET concatenated = concatenated + value in array at position `iterator`
#   iterator = iterator + 1
# 
# PRINT concatenated
# END

# PROBLEM 3
# =========
# a method that takes an array of integers, and returns a new array with every 
# other element
#
# CASUAL PSEUDO-CODE
# ==================
# Given an array of integers
# create a new array with every other element of the given array
# output the new array
#
# FORMAL PSEUDO-CODE
# ==================
# START
# SET new_array = []
# SET iterator - 1
# WHILE iterator <= number of elements in array
#   IF iterator is odd
#     UPDATE new_array with element of given array at this index
#
#   iterator = iterator + 1
#
# PRINT new_array
# END
