require 'mysql2'
include Mysql2

class Data_class
	attr_accessor :client	
	
	initialize
		self.client = Client.new(:username => 'ars', :password => '111', :host => 'localhost')
		self.client.query("USE Discrete_mathematics")
	end

	
	
end