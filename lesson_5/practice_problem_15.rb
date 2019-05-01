# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# ANSWER
# ======
# algo
# - for each element in the array
#   - instantiate boolean `all_even` = true
#   - for each k/v pair in the element
#     - check if all numbers in the value array are even (hint: use `Hash#all?`)
#     - if they are not even, set `all_even` to false
#   - keep element in array if `all_even`

new_arr = arr.select do |hsh|
  all_even = true
  hsh.each do |key, val|
    all_even = false unless val.all? { |number| number.even? }
  end
  all_even
end

p new_arr

# ALTERNATIVE
# ===========
new_arr = arr.select do |hsh|
  hsh.all? do |_, val|
    val.all? { |num| num.even? }
  end
end

p new_arr
