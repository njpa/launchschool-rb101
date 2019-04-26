[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# BREAKDOWN
# line 1:
#   - action: `map` invoked
#   - object: original array, `[[1,2], [3,4]]`
#   - side effect: none
#   - return value: new transformed array
#   - return value used?: no
# lines 1-5:
#   - action: outer block executed
#   - object: each element of original array, `[1,2]` and `[3,4]`
#   - side effect: none
#   - return value: each new transformed array, `[2,4]` and `[6,8]`
#   - return value used?: yes, used by `map` for transformation
# line 2:
#   - action: method call (`map`)
#   - object: each element of the original array, `[1,2]` and then `[3,4]`
#   - side effect: none
#   - return value: new transformed array for each element, `[2,4]` and `[6,8]`
#   - return value used?: yes, determines the return value of the outer block
# lines 2-4:
#   - action: inner block executed
#   - object: each element of the original array... `[1,2]` and then `[3,4]`
#   - side effect: no
#   - return value: an integer
#   - return value used?: yes, by `map` for transformation
# line 3:
#   - action: `Integer#*` invoked
#   - object: n/a, (the reference to the current element in the array)
#   - side effect: no
#   - return value: new integers resulting from the product of the originals and `2`
#   - return value used?: yes, to determing return value of inner block
