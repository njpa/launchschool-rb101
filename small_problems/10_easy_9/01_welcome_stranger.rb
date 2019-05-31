# 01_welcome_stranger.rb

=begin
Create a method that takes 2 arguments, an array and a hash. The array will
contain 2 or more elements that, when combined with adjoining spaces, will
produce a person's name. The hash will contain two keys, `:title` and
`:occupation`, and the appropriate values. Your method should return a
greeting that uses the person's full name, and mentions the person's title.

Example:

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.
=end

# ANSWER
# ======
=begin
input: array, hash
output: string
rules:
- array will contain 2 or more elements (will join to produce a name)
- hash contains 2 keys `:title` and `:occupation` with appropriate values
- return string is a greeting interpolating full name with title
example:
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
  => Hello, John Q Doe! Nice to have a Master Plumber around.
data structure: none
algorithm:
- given `names`
- given `occupation_details`
- instantiate `result` and set to `''`
- instantiate `name` and set to `''`
- join `names` into one string separated by `' '` and store in `name`
- interpolate `name` and `occupation` into `result` with required fill text
- return `result`
=end

def greetings(names, craft)
  "Hello, #{names.join(' ')}! Nice to have a " \
    "#{craft[:title]} #{craft[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'],
            { title: 'Master', occupation: 'Plumber' }) ==
  "Hello, John Q Doe! Nice to have a Master Plumber around."
