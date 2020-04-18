current_path = File.dirname(__FILE__)
require "#{current_path}/controller_super.rb"

	puts "Do you wanna work as admin? 1/0"
	i = gets.to_i
	while true do
		if i == 1 then
			c_a = Controller_Admin.new
			puts "Do you wdfanna work as admin? 1/0"
			i = gets.to_i
		else
			break
		end
	end
