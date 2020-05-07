current_path = File.dirname(__FILE__)
require "#{current_path}/controller_super.rb"
require "#{current_path}/fox_win.rb"

class Data_modelling
	attr_accessor :morda
	attr_accessor :app
	def initialize(app)
		self.app= app
	end

	def show(morda)
		puts "data_modelling.rb/Data_modelling.show: start"
		self.morda= morda
		puts "data_modelling.rb/Data_modelling.show: morda is ready"
		@morda.create
	end
end	

class List < Data_modelling
	attr_accessor :list_names, :list_counts

	def set_meanings(list_names, list_counts)
		puts "data_modelling.rb/List.set_meanings: start"
		self.list_names= list_names
		puts "data_modelling.rb/List.set_meanings: names are ready"
		self.list_counts= list_counts
		puts "data_modelling.rb/List.set_meanings: counts are ready"
	end

end


class List_cut < List
	attr_accessor :prev		
	def initialize(prev, app, list_names, list_counts)
		super(app)
		self.prev= prev
		self.set_meanings(list_names, list_counts)
	end

	def show(title)
		
		super(Table_Cut_Window.new(app,self,title))
	end
end

class List_start < List
	attr_accessor :list_id
	
	def initialize(app, list_id, list_names, list_counts)
		puts "data_modelling.rb/List_start.initialize:  start"
		super(app)
		puts "data_modelling.rb/List_start.initialize: get main FoxApp"
		self.set_meanings(list_id, list_names, list_counts)
		puts "data_modelling.rb/List_start.initialize: data is copied"
		self.show
	end

	def set_meanings(list_id, list_names, list_counts)
		puts "data_modelling.rb/List_start.set_meanings: start"
		super(list_names, list_counts)
		puts "data_modelling.rb/List_start.set_meanings: super(method) is done"
		self.list_id= list_id
		puts puts "data_modelling.rb/List_start.set_meanings: id are ready"
	end

	def show
		puts "data_modelling.rb/List_start.show: start"
		puts self
		super(Table_Start_Window.new(app, self, self.to_s))
	end

	def to_s
		return "#{self.class}"
	end

end

class List_full < List
	attr_accessor :prev		
	def show(title)
		super(Table_Full_Window.new(app,self,title))
	end

end


class List_Themes < List_start

	
end

class List_Kinds < List_start

	
end


class Model < Data_modelling

end