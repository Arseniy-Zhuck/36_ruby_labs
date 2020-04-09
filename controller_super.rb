current_path = File.dirname(__FILE__)
require "#{current_path}/list_themes.rb"
require "#{current_path}/files_tasks.rb"

class Controller_super
	attr_accessor :user_role, :user
	@file_tasks_object
	@file_students_object
	
	
	
	def check
		puts "check"
	end
end

class Controller_Admin < Controller_super
	
	def initialize(u_r = "admin",u = "admin")
		self.user_role= u_r
		self.user= u
		
	end
	
	def check_theme?(theme_Id)
		@file_tasks_object.check_theme?(theme_Id)
	end
	
end

class Controller_Admin_Term < Controller_Admin
	
	def initialize(u_r = "admin",u = "admin")
		super
		self.start
	end
	def start
	
		puts "What do you want?"
		puts "1. Tasks Base"
		puts "2. Student Base"
		a = gets.to_i
		if a == 1 then 
			@file_tasks_object = Files_tasks.new
			a,b = @file_tasks_object.read_themes
			l_t = List_Themes.new(a,b,self)	
			l_t.show
		else
			puts "Пока ничего"
		end
		puts "Work is done"
	end
	

end