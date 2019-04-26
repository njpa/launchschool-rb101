# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

# ANSWER
# ======
sorted = arr.sort do |element1, element2|
  element2.to_i <=> element1.to_i
end

p sorted
