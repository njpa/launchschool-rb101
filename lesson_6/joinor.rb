# EXERCISE
# ========
# Write a method called joinor that will produce the following result:

# joinor([1, 2])                   # => "1 or 2"
# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

# ANSWER
# ======
=begin
array string string -> string
rules:
- join all elements in a string
- separate them by 'separator' string if provided
- separate them by `','` if 'separator' not provided
- separate penultimate and last elements by 'conjunction' if provided
- separate penultimate and last elements by `'or'` if provided
examples:
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
data structures: maybe temp array to store elements before joining into a string
algo:
- given `elements`, `separator` and `conjunction`
- instantiate `temp` and set to `[]`
- for each `element` in `elements`
  - if `element` is the last element in `elements`
    - if number of elements is less than two
      - append `element` to `temp`
    - else
      - append concatenation of `conjunction` and `element` `temp`
  - else append concatenation of `element` and `separator` to `temp`
- join `temp` elements, separated by space characters
=end

def joinor(elements, separator = ', ', conjunction = 'or')
  temp = []
  elements.each.with_index do |element, index|
    if index == elements.size - 1
      if elements.size > 1
        temp << " #{conjunction} #{element}"
      else
        temp << "#{element}"
      end
    else
      if elements.size > 2
        temp << "#{element}#{separator}"
      else
        temp << "#{element}"
      end
    end
  end
  temp.join.gsub('  ', ' ')
end

def joinor_refactored(elements, separator = ', ', conjunction = 'or')
  if elements.size > 2
    init = elements[0...(elements.size - 1)].join(separator)
    "#{init}#{separator}#{conjunction} #{elements.last}"
  elsif elements.size == 2
    "#{elements[0]} #{conjunction} #{elements[1]}"
  else
    elements[0]
  end
end

