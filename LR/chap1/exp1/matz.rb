#!/user/bin/ruby
hi = "Hello, %s! "
person = ARGV[0]
5.times {puts (hi % person)*3}
puts "%s, %s!" % ["Hello", person]
puts "hey, #{person}, I'm using " + `ruby -v` + "and i know that 2 + 2 = #{2+2}"
# command ="puts 'hello'" 
# a = eval command
command1 = gets
# puts command1
# puts a.size