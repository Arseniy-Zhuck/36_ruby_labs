current_path = File.dirname(__FILE__)
require "#{current_path}/controller_super.rb"
require "#{current_path}/term_admin.rb"

class Data_modelling
	attr_accessor :prev,:morda,:next
	
	initialize(prev, nex)
		self.prev= prev
		self.next= nex
	end

end	

class List < Data_modelling
	attr_accessor :list_names, :list_counts
	initialize(prev, nex, list_names, list_counts)
		super(prev,nex)
		self.list_names= list_names
		self.list_counts= list_counts
	end
end

class List_Themes < List

	

end


class Model < Data_modelling



end