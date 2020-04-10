current_path = File.dirname(__FILE__)
require "#{current_path}/list_themes.rb"
require "#{current_path}/files_tasks.rb"
require "#{current_path}/term_admin.rb"

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
		self.start
	end
	
	def start
		
		t_a_r = Term_Admin_rezhim.new(self,@user)
		t_a_r.choose_rezhim 
		
	end
	
	def read_themes_file
		a,b = @file_tasks_object.read_themes
		return a,b
	end
	
	def show_themes
		@file_tasks_object= Files_tasks.new # какой объект рабо
		a,b = self.read_themes_file
		l_t = List_Themes.new(a,b,self)
		t_a_t= Term_Admin_Themes.new(self,l_t,@user)
		t_a_t.show
	end
	
	def check_theme?(theme_Id)
		@file_tasks_object.check_theme?(theme_Id)
	end
	
	def save_themes(list_thems,list_counts)
		@file_tasks_object.save_themes(list_thems,list_counts)
	end
	
end

