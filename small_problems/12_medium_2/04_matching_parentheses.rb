=begin
Matching Parentheses?
Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

start; 13:46/13:53/13:59

DATA STRUCTURE
ALGO
- given `string`
- update string to `string` with all characters except `"("` and `")"`
- set matching_parens = true
- while matching_parens
-   if `"()"` exists in `string`, remove `"()"` from string
-   else
-     set matching_parens to false
- return true if `string` is empty, false other wise

=end

def balanced?(string)
  parens = string.chars.select { |char| char =~ /[()]/ }.join
  matching_parens = true
  while matching_parens
    if parens.include?("()")
      parens.gsub!("()", "")
    else
      matching_parens = false
    end
  end
  parens.empty?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

