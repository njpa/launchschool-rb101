# Given the following data structure, return a new array containing the
# same sub-arrays as the original but ordered logically by only taking into
# consideration the _odd_ numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# The sorted array should look like this:

# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# ANSWER
# ======
sorted = arr.sort do |a,b|
  a.select { |elem| elem.odd? } <=> b.select { |elem| elem.odd? }
end

p sorted
