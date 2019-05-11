# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the
# return value; they just don't count when toggling the desired case.

# Example
#staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# ANSWER
# Algorithm:
# - if `character` is non-alphabetic
#   - keep as is
# - else
#   - make `character` uppercase is `process` is true
#   - make `character` lowercase is `process` is false
#   - toggle `process`

def staggered_case(string)
  process = true

  result = string.chars.map do |char|
    if char =~ /[a-z]/i
      process ? char.upcase! : char.downcase!
      process = !process
      char
    else
      char
    end
  end

  result.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# FURTHER EXPLORATION
# ===================
# Modify this method so the caller can determine whether non-alphabetic
# characters should be counted when determining the upper/lowercase state.
# That is, you want a method that can perform the same actions that this
# method does, or operates like the previous version.

def staggered_case_opt(string, ignore_non_alpha: true)
  process = true

  result = string.chars.map do |char|
    if ignore_non_alpha && char =~ /[a-z]/i
      process ? char.upcase! : char.downcase!
      process = !process
    elsif !ignore_non_alpha
      process ? char.upcase! : char.downcase!
      process = !process
    end
    char
  end

  result.join
end

puts '-- Further exploration'
p staggered_case_opt('hi Add 773. Thank you') ==
          'Hi AdD 773. tHaNk YoU'
p staggered_case_opt('hi Add 773. Thank you', ignore_non_alpha: true) ==
          'Hi AdD 773. tHaNk YoU'
p staggered_case_opt('hi Add 773. Thank you', ignore_non_alpha: false) ==
          'Hi aDd 773. ThAnK YoU'
