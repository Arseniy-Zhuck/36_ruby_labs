current_path = File.dirname(__FILE__)
require "#{current_path}/controller_super.rb"
require "#{current_path}/fox_win.rb"

class Data_modelling
	attr_accessor :morda
	attr_accessor :app
	attr_accessor :controller
	attr_accessor :prev
	def initialize(app,controller,prev)
		puts "Data_modelling.initialize: starting"
		self.app= app
		self.controller= controller
		self.prev= prev
		puts "Data_modelling.initialize: composition is done"
	end

	def show
		puts "data_modelling.rb/Data_modelling.show: start"
		puts "data_modelling.rb/Data_modelling.show: morda is ready"
		self.morda.create
	end

	def on_close()
		self.morda.destroy
		self.controller.on_close(self,self.prev)
	end

	def to_s
		return "#{self.class}"
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
	
	def initialize(app, controller, list_id, list_names, list_counts)
		puts "data_modelling.rb/List_start.initialize:  start"
		super(app,controller,nil)
		puts "data_modelling.rb/List_start.initialize: get main FoxApp"
		self.set_meanings(list_id, list_names, list_counts)
		puts "data_modelling.rb/List_start.initialize: data is copied"
		self.morda=Table_Start_Window.new(app, self, self.to_s)
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
		super
	end

	

	def add
		puts "List_start.add: start"
		self.morda.hide
		puts "List_start.add: morda must be hidden"
	end

end

class List_full < List
	
	def show(title)
		super(Table_Full_Window.new(app,self,title))
	end

end


class List_Themes < List_start
	def add
		
		super
		puts "List_Themes.add: controller call"
		self.controller.add_theme_show(self)
	end
	

end

class List_Kinds < List_start

	
end


class Model < Data_modelling

	def initialize(app,controller,prev)
		super(app,controller,prev)
	end

	def get_prev
		a="It's not ready yet"
		return a	
	end


end

class Model_start < Model 
	attr_accessor :name, :count, :id
	def initialize(app,controller,prev,id=nil, name="", count=0)
		puts "Model_start.initialize: created"
		super(app,controller,prev)
		puts "Model_start.initialize: super_method is done"
		self.id=nil
		self.name=name
		self.count=count
		puts "Model_start.initialize: All is written"
	end

	def show
		puts "Model_start.show: GUI is starting"
		self.morda=Note_window.new(self.app,self,self.to_s)
		puts "Model_start.show: Note_window is created"
		self.morda.create
	end
end

class Theme < Model_start


end