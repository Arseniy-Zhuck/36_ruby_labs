current_path = File.dirname(__FILE__)
require "#{current_path}/controller_super.rb"
require "#{current_path}/fox_win.rb"

class Data_modelling
	attr_accessor :morda, :app
	
	initialize(app)
		self.app= app
	end

	def show(morda)
		self.morda= morda.new(@app,self)
		self.morda.create
	end

	def to_s
		"#{self.class}"
	end

end	

class List < Data_modelling
	attr_accessor :list_names, :list_counts

	def set_meanings(list_names, list_counts)
		self.list_names= list_names
		self.list_counts= list_counts
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
	
	def initialize(app, list_names, list_counts, list_id)
		super(app)
		self.set_meanings(list_names, list_counts, list_id))
	end

	def set_meanings(list_names, list_counts, list_id))
		super(list_names, list_counts)
		self.list_id= list_id
	end

	def show(title)
		super(Table_Start_Window.new(app,self,title))
	end

end

class List_full < List
	attr_accessor :prev		
	def show(title)
		super(Table_Full_Window.new(app,self,title))
	end

end


class List_Themes < List_start

	def show
		super(self.to_s)
	end

end


class Model < Data_modelling

end