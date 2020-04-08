current_path = File.dirname(__FILE__)
require "#{current_path}/list_themes.rb"
require "#{current_path}/file_tasks.rb"

class Controller_super
	def check
		puts "check"
	end
end

class Controller_Admin < Controller_super	

	def choose_way
		puts "What do you want?"
		puts "1. Student Base"
		puts "2. Tasks Base"
		a = gets.to_i
		if a == 1 then 
			f_t = File_tasks.new
			
			l_t = List_Themes.new(f_t.read_themes)	
			l_t.show
		else
			puts "Пока ничего"
		end
		puts "Work is done"
	end
	
 
	

end
