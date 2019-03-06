# Let's add a prompt signal in front of every prompt.
# And do checks for the validity of numbers entered.
# And allow it to run as long as the user wants
# And ask the user for his/her name to greet and say goodbye
# And validate the operator
# And use a dictionary for phrases

require 'yaml'
LANG = 'en'
MESSAGES = YAML.load_file(Dir.pwd << '/01_lesson_2_small_programs/dictionary.yml')

def message(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=>  #{message}"
end

def valid_float?(string)
  string.to_f.to_s == string
end

def valid_integer?(string)
  string.to_i.to_s == string
end

def valid_operator?(string)
  %w(+ - * /).include? string
end

def operation_message(operator, num1, num2)
  { '+' => "Adding #{num1} and #{num2} ...",
    '-' => "Subtracting  #{num2} from #{num1} ...",
    '*' => "Multiplying #{num1} and #{num2} ...",
    '/' => "Dividing #{num1} by #{num2} ..." }[operator]
end

prompt message("welcome", "es")
prompt message("ask_name")

name = ""
loop do
  name = Kernel.gets.chomp
  if name.empty?
    prompt MESSAGES[LANG]["valid_name"]
  else
    break
  end
end

prompt "Welcome #{name}!"

loop do
  prompt MESSAGES[LANG]["ask_first_number"]
  number1 = nil
  loop do
    number1 = Kernel.gets.chomp
    if (valid_integer?(number1) || valid_float?(number1))
      break
    else
      prompt MESSAGES[LANG]["valid_number"]
    end
  end

  prompt "Please enter the second number: "
  number2 = nil
  loop do
    number2 = Kernel.gets.chomp
    if (valid_integer?(number2) || valid_float?(number2))
      break
    else
      prompt "Please enter a valid number!"
    end
  end

  prompt_operator = <<-MSG
    What operation would you like to perform?
    `+` to add
    `-` to subtract
    `*` to multiply
    `/` to divide
  MSG
  prompt prompt_operator
  operator = nil
  loop do
    operator = Kernel.gets.chomp
    if valid_operator? operator
      break
    else
      prompt "Please enter `+`, `-`, `*`, or `/`"
    end
  end

  prompt operation_message(operator, number1, number2)
  sleep 1.3

  result =
    case operator
    when "+" then number1.to_f + number2.to_f
    when "-" then number1.to_f - number2.to_f
    when "*" then number1.to_f * number2.to_f
    when "/" then number1.to_f / number2.to_f
    end

  prompt("The result is #{result}")

  prompt "Would you like to try again? (Y to go again)"
  response = Kernel.gets.chomp
  break unless response.downcase.start_with? "y"
end

prompt "Ok. See you later #{name}!"
