#!/usr/lib/ruby/2.7.0
def mean(*numbers)
	sum = numbers.inject {|sum, i| i+sum }
	sum.to_f / numbers.size
end
puts mean(*ARGV.map())