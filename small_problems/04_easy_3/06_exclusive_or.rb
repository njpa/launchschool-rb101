# In this exercise, you will write a method named xor that takes two
# arguments, and returns `true` if exactly one of its arguments is truthy,
# `false` otherwise.

# Examples:

# xor?(5.even?, 4.even?) == true
# xor?(5.odd?, 4.odd?) == true
# xor?(5.odd?, 4.even?) == false
# xor?(5.even?, 4.odd?) == false

# ANSWER
# ======

def xor?(arg1, arg2)
  (arg1 && !arg2) || (!arg1 && arg2)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# Further Exploration
# ===================
# An `xor` operation is not a short-circuit operation since the operation
# needs to always check both arguments in order to provide an exclusive
# or type of evaluation.
