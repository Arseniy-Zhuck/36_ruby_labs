current_path = File.dirname(__FILE__)
require "#{current_path}/controller_super.rb"


class List_Themes
	attr_accessor :list_thems, :list_counts, :sender
	attr_reader :count
	
	
	def recount
		@count= @list_counts.inject(0) {|x,n| x+n}
	end
	
	def set_meanings(themes, counts)
		self.list_thems= themes
		self.list_counts= counts
		self.recount
	end
	
	def read_data
		a,b= @sender.read_themes_file
		self.set_meanings(a,b)
		
	end
	
	def initialize(themes, counts, c_a)
		self.set_meanings(themes, counts)
		@sender = c_a
		
	end

	def add(name)
		@list_thems.push(name)
		@list_counts.push(0)
	end

	def change(theme_number,theme_name)
		@list_thems[theme_number]=theme_name
	end

	def check?(theme_number)
		@sender.check_theme?(theme_number)
	end

	def save_to_file
		@sender.save_themes(self.list_thems,self.list_counts)
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


