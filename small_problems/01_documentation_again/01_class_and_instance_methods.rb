# PROBLEM
# =======
# Locate the ruby documentation for methods File::path and File#path. How are
# they different?

# ANSWER
# ======
# `File::path` is a class method and `File#path` is an instance method`.
# `#path` can only be invoked on a `File` object, whereas `::path` can
# be invoked on the class.

# Example
file = File.new('file.txt') # invoked `::new` on `File` Class
puts file.path  # => './file.txt'
