# PROBLEM
# =======
# What does this code print?

5.step(to: 10, by: 3) { |value| puts value }

# ANSWER
# ======
# Invoking `Numeric#step` on `5` with the provided keyword arguments and the
# provided block will invoke the block with the sequence of numbers starting
# at the caller incremented by the value of the `by:` keyword argument until
# it surpasses the value of the keyword argument `to:`.

5.step(to: 10, by: 3) { |value| puts value }
# => 5
# => 8
