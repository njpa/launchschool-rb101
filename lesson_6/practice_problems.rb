def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  return false unless dot_separated_words.size == 4

  while dot_separated_words.any?
    word = dot_separated_words.pop
    return false unless ip_number?(word)
  end

  true
end

def ip_number?(word)
  word.to_i.to_s == word && (0..255).cover?(word.to_i)
end

p dot_separated_ip_address?("255.0.245.11") == true
p dot_separated_ip_address?("260.4.5.11") == false
p dot_separated_ip_address?("220.4.5.2.11") == false
p dot_separated_ip_address?("220.2.11") == false
