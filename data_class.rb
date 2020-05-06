require 'mysql2'
include Mysql2

class Data_class
	attr_accessor :client	
	
	def initialize
		puts "Data_class.initialize: start"
		self.client = Client.new(:username => 'ars', :password => '111', :host => 'localhost')
		puts "Data_class.initialize: MySql connect done"
		self.client.query("USE Discrete_mathematics")
		puts "Data_class.initialize: DB is used"
	end

	def read_themes
		puts "Data_class.read_themes: start reading"
		list_thems, list_counts, list_id = [],[],[]
		puts "Data_class.read_themes: data_structure is initialized"
		r = client.query("SELECT * From Themes")
		puts "Data_class.read_themes: reading_complete"
		i=0
		r.each do |theme|
			puts "Parsing_data"
			list_id[i]= theme["Theme_ID"] 
			list_thems[i]=theme["Theme_Name"]
			list_counts[i]=theme["Theme_Count"]
			i+=1
		end
		return list_id, list_thems, list_counts
	end
end
