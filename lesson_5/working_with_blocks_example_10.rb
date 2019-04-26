[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# BREAKDOWN
# =========
# line 1:
#   action: method call (`map`)
#   object: original array
#   side effect: none
#   return value: new transformed array
#   return value used?: no
# lines 1-11:
#   action: outer block execution
#   object: each element of original array
#   side effect: none
#   return value: new transformed array for each element of original array
#   return value used?: yes, by `map` to determine transformed array
# line 2:
#   action: method call (`map`)
#   object: current element of original array
#   side effect: no
#   return value: new transformed array
#   return value used?: yes, determines values used by outer block
# lines 2-10:
#   action: inner block execution
#   object: each element of each element of the original array
#   side effect: no
#   return value: new transformed array
#   return value used?: used by second `map` invocation to determine new array
# line 3:
#   action: method call (`Array#to_s`)
#   object: current element in current element of original array
#   side effect: no
#   return value: string
#   return value used?: in method call `#size`
# line 3:
#   action: method call `String#size`
#   object: return value of `el.to_s`
#   side effect: no
#   return value: integer
#   return value used?: used in equality comparison in line 3
# line 3:
#   action: comparison (`==`)
#   object: return value of `el.to_s.size`
#   side effect: no
#   return value: boolean
#   return value used?: evaluated by `if` statement
# lines 3-9:
#   action: conditional (`if`)
#   object: boolean return value of comparison
#   side effect: none
#   return value: `nil`
#   return value used?: determines return value of inner block
# line 4:
#   action: method call (`+`)
#   object: current element of the current element of the original array
#   side effect: none
#   return value: integer
#   return value used?: yes, determines return value of inner block
# line 6:
#   action: method call `map`
#   object: current element of the current element of the original array
#   side effect: none
#   return value: transformed array
#   return value used?: yes, determines return value of inner block
# lines 6-9:
#   action: nested inner block execution
#   object: each element of the current element of the current element of the
#           original array
#   side effect: none
#   return value: integer
#   return value used?: yes, determines transformed array for `map`
# line 7:
#   action: method call (`+`)
#   object: current element of the current element of the current elem
#   side effect: none
#   return value: integer
#   return value used?: yes, determines return value of inner block
