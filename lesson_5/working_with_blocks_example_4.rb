my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# BREAKDOWN
# Line 1:
#   a: assignment of a variable
#   o: n/a
#   se: none
#   rv: `[18,7], [3, 12]]`
#   rvu?: no
# Line 1:
#   a: `each` invocation
#   o: outer array `[[18,7], [3,12]]`
#   se: none
#   rv: same object as the caller
#   rvu?: yes, `my_var` will reference this return value
# Lines 1-7:
#   a: block execution (outer block)
#   o: every element of the outer array
#   se: none
#   rv: every [current] element of the outer array
#   rvu?: no
# Line 2:
#   a: `each` invocation
#   o: the current element of the outer block
#   se: none
#   rv: same current element as caller
#   rvu?: yes, used to determine the return value of the outer block
# Lines 2-6:
#   a: inner block execution
#   o: current element of outer block
#   se: none
#   rv: every [current] element of the outer block
#   rvu? no
# Line 3:
#   a: comparison (>)
#   o: block parameter referencing current element
#   se: no
#   rv: `true` if current element is greater than `5`, otherwise `false`
#   rvu?: yes, evaluated by `if`
# Lines 3-5:
#   a: conditional (if)
#   o: element of the sub-array in that iteration
#   se: none
#   rv: `nil`
#   rvu?: `puts` invocation will only occur return value is `true`,
#      more importantly, used to determine the return value of the inner block
# Line 4:
#   a: `puts` invocation
#   o: block parameter referencing current element
#   se: outputs string representation of integer
#   rv: `nil`
#   rvu?: yes, used to determine the return value of the inner block
