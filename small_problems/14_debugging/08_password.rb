=begin
Password
The following code prompts the user to set their own password if they haven't
done so already, and then prompts them to login with that password. However,
the program throws an error. What is the problem and how can you fix it?

Once you get the program to run without error, does it behave as expected?
Verify that you are able to log in with your new password.
=end

password = nil

def set_password
  puts 'What would you like your password to be?'
  gets.chomp
  #new_password = gets.chomp
  #password = new_password
end

#def verify_password
def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
  #password = set_password
end

verify_password(password)
#verify_password

# ANSWER
# The code raises a `NameError` exception since Ruby cannot find the
# `password` variable in the `verify_password` method.
# We can imply from this code that the call to the `set_password` method
# is used to update the `password` variable declared in the first line.
# To get this code to work, we need to change the `set_password` method
# so that it simply returns the password that the user has typed, rather
# than assigning it to a variable in its local scope.
