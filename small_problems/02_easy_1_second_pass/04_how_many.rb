# PROBLEM
# =======
# Write a method that counts the number of occurrences of each element in a
# given array.
# Mental model: iterate through a list of words, and populate a hash in the
# meantime with the word as a key (if it doesn't already exist).  At the same
# time, keep count of the times that the word appears in the list and update
# that key in the hash accordingly
# assumptions: none

# EXAMPLES
# ========
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# DATA STRUCTURES
# ===============

# ANSWER
# ======

def count_occurrences(vehicles)
  occurrences = {}
  vehicles.each do |vehicle|
    if occurrences.has_key?(vehicle)
      occurrences[vehicle] = occurrences[vehicle] + 1
    else
      occurrences[vehicle] = 1
    end
  end
  occurrences
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

p count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.

# higher level solution
def count_occurrences(vehicles)
  vehicles.uniq.each_with_object({}) do |vehicle, hsh|
    hsh[vehicle] = vehicles.count(vehicle)
  end
end
p count_occurrences(vehicles)
