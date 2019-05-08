# PROBLEM
# =======
# Write a method named `include?` that takes an Array and a search value
# as arguments. This method should return `true` if the search value is in the
# array, `false` if it is not. You may not use the `Array#include?` method in
# your solution.

# include?([1,2,3,4,5], 3) == true
# include?([1,2,3,4,5], 6) == false
# include?([], 3) == false
# include?([nil], nil) == true
# include?([], nil) == false

# ANSWER
# =======
# Problem:
#   input: array, and search value
#   output: boolean
#   rules:
#   - return value indicates if search value is in the array
#   - cannot use `Array#include?`
#   questions:
#   - can we assume values in array and search value will be of same type?
#     We'll assume so
# Example:
#  include?([1,2,3,4,5], 3) == true
#  include?([1,2,3,4,5], 6) == false
#  include?([], 3) == false
#  include?([nil], nil) == true
#  include?([], nil) == false
# Data structures:
#   - nothing fancy
# Algorithm:
#   - given `items`, `search_value`
#   - instantiate `include` and set to `false`
#   - for each `item` in `items`
#     - if `search_value` equals `item`
#       set `include` to `true`
#   - return `include`
# Code:

def include?(items, search_value)
  included = false
  items.each do |item|
    included = true if item == search_value
  end
  included
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# REFACTOR
# ========
# We can also invoke `Array#index` on the argument array and pass in the
# search value as parameter to obtain either an index number, if the
# argument is within the array, or `nil` if no match is found.

def include_index?(items, search_value)
  items.index(search_value) == nil ? false : true
end

puts '-- Refactor'
p include_index?([1,2,3,4,5], 3) == true
p include_index?([1,2,3,4,5], 6) == false
p include_index?([], 3) == false
p include_index?([nil], nil) == true
p include_index?([], nil) == false

# ALTERNATIVE
# ===========
# Let's remember that `nil` evaluates as falsy in conditional statments.
# Furthermore, `!nil` evaluates to `true` and `!!nil` evaluates to `false`.
# We can therefore use the `!!` operator to force the method to return
# `true` when the method invocation returns a truthy value (such as an index
# number) or `false`, when the invocation returns `nil`.

def include_falsy?(items, search_value)
  !!items.index(search_value)
end

puts '-- Alternative'
p include_falsy?([1,2,3,4,5], 3) == true
p include_falsy?([1,2,3,4,5], 6) == false
p include_falsy?([], 3) == false
p include_falsy?([nil], nil) == true
p include_falsy?([], nil) == false
