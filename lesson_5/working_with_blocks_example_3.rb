[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# BREAKDOWN
# line 1:
#   action: `map` method called
#   object: the outer array `[[1,2], [3,4]]`
#   side effect: none
#   return value: new array `[1, 3]`
#   return value used?: no
# lines 1-4:
#   a: block execution
#   o: every element of the outer-array
#   se: none
#   rv: element at index 0 of current sub-array
#   rvu?: yes, used by `map` for transforming
# line 2:
#   a: `first` method invoked
#   o: current element of the outer array
#   se: none
#   rv: first element of the sub-array
#   rvu?: yes, used by the `puts` invocation
# line 2:
#   a: `puts` method invoked
#   o: return value of `first` invocation on current sub-array
#   se: output string representation of integer
#   rv: nil
#   rvu?: no
# line 3:
#   a: `first` method invoked
#   o: current element of the outer array
#   se: none
#   rv: first element of the sub-array
#   rvu?: yes, used to determine the return value of the block
