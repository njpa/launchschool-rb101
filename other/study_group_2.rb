=begin
Given an array of strings made only from lowercase letters, return an array
of all characters that show up in all strings within the given array
(including duplicates).  For example, if a character occurs 3 times in
all strings but not 4 times, you need to include that character three
times in the final answer.

p common_chars(["bella","label","roller"]) == ["e", "l", "l"]
p common_chars(["cool","lock","cook"]) == ["c", "o"]
p common_chars(["hello","goodbye","booya", "random"]) == ["o"]
p common_chars(["aabbaaaa","ccdddddd","eeffee", "ggrrrrr", "yyyzzz"]) == []
=end

def common_chars(words)
  common = []
  ('a'..'z').each do |letter|
    count = 0
    max = false
    until max
      if words.all? { |word| word.count(letter) > count }
        count += 1
      else
        max = true
      end
    end
    count.times { common << letter }
  end
  common
end

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []
