current_path = File.dirname(__FILE__)
require "#{current_path}/data_class.rb"
require "#{current_path}/admin_rezhim.rb"
require "#{current_path}/data_modelling.rb"
#require "#{current_path}/term_admin.rb"
require 'fox16'
include Fox

class Controller_super
	attr_accessor :user_role, :user, :data, :application
	
	def initialize(user_role, user)
		self.user_role= user_role
		self.user= user 
	end	

end 

class Controller_admin < Controller_super

	def initialize(user_role="admin", user="admin")
		puts "Controller_admin.initialize: start work as admin"
		super
		puts "Controller_admin.initialize: user is saved"
		self.data= Data_class.new
		@application = FXApp.new
		puts "Controller_admin.initialize: foxApp is initialized"
		main = ChoozeRezhimWindow.new(@application,self)
		puts "Controller_admin.initialize: ChoozeRezhimWindow is initialized"
		@application.create
		puts "Controller_admin.initialize: foxApp is created"
		main.show(PLACEMENT_SCREEN)
		puts "Controller_admin.initialize: ChoozeRezhimWindow is drawn"
		@application.run
	end

	def show_themes
		puts "Controller_admin.show_themes: start"
		a,b,c = self.data.read_themes
		puts "Controller_admin.show_themes: themes are read"
		lt= List_Themes.new(self.application,a,b,c)
	end

	def to_s
		self.class.to_s
	end


end
