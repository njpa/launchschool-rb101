
def xor?(first, second)
  if (!first && second)
    true
  elsif (first && !second)
    true
  else
    false
  end

end

def xor_alt?(first, second)
  return true if !first && second
  return true if first && !second
  false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

p xor_alt?(5.even?, 4.even?) == true
p xor_alt?(5.odd?, 4.odd?) == true
p xor_alt?(5.odd?, 4.even?) == false
p xor_alt?(5.even?, 4.odd?) == false
