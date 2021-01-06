def my_method(a)
	puts "Result of '#{a}' is "
	eval a
end

def my_method2
	yield
end

command1 = gets.chomp
my_method command1
prc = lambda {|name| puts "hello, #{name}"}
prc.call "Vasya"
my_method2 { puts 'by'}