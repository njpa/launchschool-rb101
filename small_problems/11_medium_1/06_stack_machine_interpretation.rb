=begin
EXERCISE 6 (Stack Machine Interpretation)
=end

def minilang(instructions)
  register, stack = 0, []

  for command in instructions.split
    case command
    when "PRINT" then puts register
    when "PUSH"  then stack << register
    when "POP"   then register = stack.pop
    when "ADD"   then register += stack.pop
    when "SUB"   then register -= stack.pop
    when "MULT"  then register *= stack.pop
    when "DIV"   then register /= stack.pop
    when "MOD"   then register %= stack.pop
    else              register = command.to_i
    end
  end
end

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')

