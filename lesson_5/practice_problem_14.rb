# Given this data structure write some code to return an array containing
# the colors of the fruits and the sizes of the vegetables. The sizes should
# be uppercase and the colors should be capitalized.

hsh = {
  'grape' => { type: 'fruit', colors: ['red', 'green'], size: 'small' },
  'carrot' => { type: 'vegetable', colors: ['orange'], size: 'medium' },
  'apple' => { type: 'fruit', colors: ['red', 'green'], size: 'medium' },
  'apricot' => { type: 'fruit', colors: ['orange'], size: 'medium' },
  'marrow' => { type: 'vegetable', colors: ['green'], size: 'large' }
}

# The return value should look like this:

# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# ANSWER
# ======
# algo:
#   - instantiate `arr` and set to `[]`
#   - for each k/v pair in `hsh`
#     - get the value of the pair
#     - if value[:type] == 'vegetable'
#         arr << value[:size].upcase
#       else
#         colors = value[:colors] capitalized
#         arr << colors

arr = []
hsh.each_value do |val|
  arr << val[:colors].map(&:capitalize) if val[:type] == 'fruit'
  arr << val[:size].upcase if val[:type] == 'vegetable'
end

p arr
