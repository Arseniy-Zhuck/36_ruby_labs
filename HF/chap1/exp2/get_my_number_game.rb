puts "Welcome to \'Get my number\'"
print "What's your name"
input = gets
name = input.chomp
puts "Welcome, #{name}"
puts "I've got a random number from 1 to 100"
puts "Please, guess it"
target = rand(100) + 1
i = 0
puts "Write number"
begin
	answer = gets.chomp.to_i
	puts answer
	while (i < 3) && (answer != target)
		i += 1
		puts "You are wrong, try again"
		answer = gets.chomp.to_i
	end
	if (i == 3)
		puts "You looser"
	else
		puts "OWWW! you won"
	end
rescue 
	puts "You write no number"
end