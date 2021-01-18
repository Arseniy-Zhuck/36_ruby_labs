def calculate(op1, operator, op2)
	str = op1.to_s + operator +op2.to_s
	eval(str)
end

@alpha = 25
@beta = 12

puts calculate(2, "+", 2)
puts calculate(5, "*", "@alpha")
puts calculate("@beta", "**", 3)