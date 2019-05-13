# Mad libs are a simple game where you create a story template with blanks
# for words. You, or another player, then construct a list of words and
# place them into the story, creating an often silly or funny story as a
# result.

# Create a simple mad-lib program that prompts for a noun, a verb, an
# adverb, and an adjective and injects those into a story that you create.

# Example

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!

# ANSWER
# ======
# 4 strings -> 1 string
# - ask for 4 different things
# - question: input validation necessary.  We'll assume not.
# data structure: perhaps a hash to store words (keys can be useful)
# Algorithm:
# - instantiate `words` and set to
#    {'noun'=> '', 'verb'=> '', 'adjective'=> '', 'adverb'=> ''}
# - for each `word` in `words`
#    - ask user for a word to fill in black, store it as the value
# - output interpolated string

WORDS = {'noun'=> '', 'verb'=> '', 'adjective'=> '', 'adverb'=> ''}

def main
  WORDS.keys.each do |key|
    puts "Enter a(n) #{key}: "
    WORDS[key] = gets.chomp
  end

  puts "Do you #{WORDS["verb"]} your #{WORDS["adjective"]} " \
       "#{WORDS["noun"]} #{WORDS['adverb']}? That's hilarious!"
end

main()
