current_path = File.dirname(__FILE__)
require "#{current_path}/data_class.rb"

class Controller_super
	attr_accessor :user_role, :user, :data
	
	def initialize(user_role, user)
		self.user_role= user_role
		self.user= user 
	end	

end 

class Controller_admin < Controller_super

	def initialize(user_role="admin", user="admin")
		super
		self.data = data_class.new
		
	end


end
