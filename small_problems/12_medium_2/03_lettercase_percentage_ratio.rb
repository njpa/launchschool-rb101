=begin
Lettercase Percentage Ratio

In the easy exercises, we worked on a problem where we had to count the number
of uppercase and lowercase characters, as well as characters that were neither
of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the percentage of characters in the string that are
lowercase letters, one the percentage of characters that are uppercase letters,
and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

start: 13:32/13:37/13:41

algo:
- given `string`
- instantiate `res` and set to `{lowercase: 0, uppercase: 0, neither: 0}`
- instantiate `size` and set to number of characters in `string`
- instantiate `upper` and set to number of uppercase characters in `string`
- instantiate `lower` and set to number of lowercase characters in `string`
- instantiate `other` and set to `size` - `upper` - `lower`
- update `upper` to (`upper` / `size` ) * 100,
    note: use floats to avoid integer division
- update `lower` to (`other` / `size` ) * 100,
    note: use floats to avoid integer division
- update `other` to (`other` / `size` ) * 100,
    note: use floats to avoid integer division
- return `res` with the values just calculated
=end

def letter_percentages(string)
  chars = string.chars
  size = chars.size
  upper = chars.count { |char| char =~ /[ABCDEFGHIJKLMNOPQRSTUVWXYZ]/ }
  lower = chars.count { |char| char =~ /[abcdefghijklmnopqrstuvwxyz]/ }
  upper = (upper / size.to_f) * 100
  lower = (lower / size.to_f) * 100
  neither = 100 - upper - lower

  {lowercase: lower, uppercase: upper, neither: neither}
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
