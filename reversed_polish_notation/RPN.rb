# Reversed Polish Notation => value

OPERANDS = ['+', '-', '*', '/']

def rpn_eval(rpn)
  stack = []
  rpn.chars.each do |char|
    if OPERANDS.include?(char)
      key2 = stack.pop.to_i
      key1 = stack.pop.to_i
      puts "key1 = #{key1}, key2 = #{key2}, oper = #{char}"
      value = key1.send(char, key2).to_i
      stack.push value
    else
      stack.push char
    end
  end

  stack.pop
end
