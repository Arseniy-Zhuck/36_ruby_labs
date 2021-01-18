def power(exponent)
	proc { |base| base**exponent}
end

square = power(2)
cube = power(3)

a = square.call(11)
b = square.call(5)
c = cube.call(6)
d = cube.call(8)
puts a,b,c,d