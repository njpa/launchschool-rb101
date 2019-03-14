# What do you expect to happen when the `greeting` variable is referenced in
# the last line of the code below?

if false
  greeting = “hello world”
end

p greeting

# ANSWER
# The conditional clauses of an if statement do not create their own scope.
# Therefore, any variables that are instantiated inside of an `if`/`else`
# could be accessed from the main scope, so long as that instantiation
# code is executed.
# In the case above, the instantiation of `greeting` is not executed since
# the condition statment provided to the `if` statement will naturally
# evaluate to `false`.
# Referencing `greeting` in the last line will therefore raise a
# `NameError` exception.

# CORRECT ANSWER
# Although the assignment in the `if` block is not executed, the variable
# will be initialized to `nil.  And, since the assignment does not occur, it
# remains `nil`.
