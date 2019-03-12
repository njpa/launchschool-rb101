# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

bar(foo)

# ANSWER
# We'll start by evaluating the `foo` invocation that is sent in as argument.
# This invocation evaluates to `'yes'`.  Invoking `bar` passing in `'yes'`
# as argument gives a return value of `'no'`.

p bar(foo)
