current_path = File.dirname(__FILE__)
require "#{current_path}/controller_super.rb"
require "#{current_path}/term_admin.rb"

module List_of_data
	attr_accessor :list_data,:list_counts
	
	def add(name)
	end
	
	
end

class Model
attr_accessor :visual_obj,:sender
	def initialize(sender)
		self.sender= sender
	end

end


class List < Model
	
end


class List_Themes < Model
	attr_accessor :list_thems, :list_counts
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
	
	def show
		@visual_obj.show
	end
	
	def initialize(themes, counts, c_a)
		self.set_meanings(themes, counts)
		super(c_a)
		@visual_obj=Term_Admin_Themes.new(self)
	end

	def add_visual
		@sender.add_theme
	end

	def add(name)
		@list_thems.push(name)
		@list_counts.push(0)
	end
	
	def change_visual(theme_number,theme_name)
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
	
	def del(theme_number)
		@list_thems[theme_number]=nil
		@list_counts[theme_number]=nil
	end
	
	def open_them(theme_number)
		a = Theme.new
		a.show_problems
	end
	
end

class Theme < model
	attr_accessor :theme_ID, :theme_name, :theme_count, :list_kinds
	
	def show_description
		self.visual_obj= Term_Admin_Theme(self)
		@visual_obj.show
	end
	
	def initialize(c_a, iD=nil, theme_name=nil)
		super(c_a)
		self.theme_ID= iD
		self.theme_name= theme_name
		
	end
	
	def show_problems
		puts "Заглушка"
	end
end


