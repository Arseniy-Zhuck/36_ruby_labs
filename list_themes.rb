current_path = File.dirname(__FILE__)
require "#{current_path}/controller_super.rb"


class List_Themes
	attr_accessor :list_thems, :list_counts 
	attr_reader :count
	private :sender
	
	def recount
		@count= counts.inject(0) {|x,n| x+n}
	end
	
	def initialize(themes, counts, c_a)
		self.list_thems= themes
		self.list_counts= counts
		@sender = c_a
	end

	def add
		puts "The name is"
		@list_thems.push(gets.chomp)
		@list_counts.push(0)
	end

	def change(theme_number)
		puts "The name is"
		@list_thems[theme_number]=gets.chomp
	end

	def check?(theme_number)
		@sender.check_theme?(theme_number)
	end

	def save_to_file
		@sender.save_themes(self.list_thems,self.list_counts)
	end
	
	
	def show
		choice = 0
		while choice!= 5 do
			if list_thems==[] then
				self.show_list
			else
				puts "There is no themes yet"
			end
		
			puts "What do you want?"
			puts "1. Add"
			puts "2. Change"
			puts "3. Delete"
			puts "4. Show Theme"
			puts "5. Finish"
			choice = gets.to_i
			case choice
				when 1
					self.add
				when 2
					what = gets.to_i
					self.change(what)
				when 3
					what = gets.to_i
					if self.check?(what) then
						self.del
					end
				when 4
					self.save_to_file
					what = gets.to_i
					self.open_them(number)
				when 5
					self.save_to_file
				else
					puts "wrong task"
			end
					
		end
		
	end
	
	def show_list
		
		@list_thems.each_index do
		|i|
			puts format("%1i | %25s |%3i", i, @list_thems[i], @list_counts[i])
		end
	end
	
	def open_them(theme_number)
		a = Theme.new
		a.show_problems
	end
	
end

class Theme
	attr_accessor :theme_ID, :theme_name
	
	def initialize(iD, theme_name)
		self.theme_ID= iD
		self.theme_name= theme_name
		
	end
	
	def show_problems
		puts "Заглушка"
	end
end


