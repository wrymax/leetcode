load './RPN.rb'

def test_rpn
  rpn = "5123*+45*-63/+53-*+"
  value = rpn_eval(rpn)

  if value == -17
    puts "+ rpn_eval passes!"
  else
    puts "- rpn_eval failed."
  end
end

test_rpn
