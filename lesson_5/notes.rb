['arcoiris', 'arco', 'cape', 'ants', 'cap'].sort do |a, b|
  #puts "a is #{a} and b is #{b}"
  a <=> b
end

people = { Katerina: 27, kate: 20, john: 25, Mike:  18 }
# if we downcase the key,
sorted = people.sort_by do |name, age|
  name.downcase
end

p sorted

# Working with blocks
# ===================
# When confronting complex code, it is helpful to take things apart using
# the following simple questions:

# 1. What is the action being performed? (conditional, method call,
#    block... )
# 2. On what object is the action being performed on?
# 3. Are there any side-effects of the action being performed?
#     (i.e. mutations on the caller, or on any argument; any output)
# 4. What is the return value of the action performed?
# 5. Is the return value of the action used by whatever instigated the action?
