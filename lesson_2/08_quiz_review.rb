# QUESTION 5
# A flowchart uses shapes and components to map out the logical sequence of a
# program or algorithm in a visual way.

# Pseudocode is a human-readable, high-level description of a program or
# algorithm which helps us formulate a solution at the logical problem domain level.

# Rubocop is a static code analyzer.  It analyzes code and offers advice based
# on style format and possible logical errors.

# `pry` is a debugging tool featuring syntax highlighting, a flexible plugin
# architecture, runtime invocation, and source and documentation browsing.

# QUESTION 7
# In ruby, a `!!` preceding a 'truthy' value would return `true`

puts 'hello' if !!'truthy'

# QUESTION 8
# The 'scope' of a variable determines where in a program a variable is
# available for use. In other words, where it can be accessed.

# QUESTION 9
# The following statement is not always true:
#   "Any code delimited by either curly braces {} or do/end defines
#    a new scope."
# This statement is true in the case of blocks, which are always delimited
# by either '{}' or 'do'/'end'.  However, not only blocks are delimited by
# 'do'/'end'.  For example, the code following a 'while'/'do' statement
# is not a block.  Thus the code inside of it does not define a new scope.

while true do
  a = 5
  break
end

a # => 5

# QUESTION 11
# Variable shadowing occurs when we name two local variables with the same
# name (with one variable being instantiated at a block-scope level, and
# the other one at the outer-scope level).

# This is variable shadowing:
x = 1
4.times { |x| puts x }
# The code in the block cannot access the `x` variable defined in the outer
# scope because of the variable in the block having the same name.

# Since methods create their own scope, variables inside of a method
# can have the same name as variables in the outer scope.  This, for example,
# is not variable shadowing:

x = 4
def test(x)
  x = 4
  x
end

# QUESTION 14
# When we refer to the 'variables as pointers' in Ruby, we are essentially
# saying that variables in Ruby act as labels we create to refer to physical
# space in memory.

# QUESTION 17
# Regarding scope, in this code:

name = "Lisa"

def name
  "George"
end

loop do
  puts name
  break
end

# Ruby references the local variable `name` from inside of the block rather
# than the method `name`.  This is because both the variable and the method
# are in scope, but Ruby first references the local variable.
