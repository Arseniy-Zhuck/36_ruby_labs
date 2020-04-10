current_path = File.dirname(__FILE__)
require "#{current_path}/list_themes.rb"

class Term_Admin
attr_accessor :obj, :user



	def initialize(obj,user)
		self.obj= obj
		self.user= user
	end


end

class Term_Admin_rezhim < Term_Admin
	
	def choose_rezhim
		puts "Welcome, #{@user}"
		a=0
		while a != 6
			puts "What do you want?"
			puts "1. Tasks Base"
			puts "2. Student Base"
			puts "3. Build finish table"
			puts "4. Be a teacher"
			puts "5. Be a student"
			puts "6. Finish_work"
			a = gets.to_i
			case a
				when 1
					@obj.show_themes
				when 2
					puts "заглушка"
				when 3
					puts "заглушка"
				when 4
					puts "заглушка"
				when 5
					puts "заглушка"
				when 6
					puts "Finish him"
					b=gets
				else
					puts "Wrong number"
			end
		end

	end

end 



class Term_Admin_Themes < Term_Admin
	attr_accessor :obj_data
	
	def initialize(obj,obj_data,user)
		super(obj,user)
		self.obj_data= obj_data
		
	end
	
	def show_list
		
		@obj_data.list_thems.each_index do
		|i|
			puts format("%1i | %25s |%3i", i, @obj_data.list_thems[i], @obj_data.list_counts[i])
		end
	end
	
	def show
		choice = 0
		
		while choice!= 5 do
			list=@obj_data.list_thems
			if list!=[] then
				self.show_list
			else
				puts "There is no themes yet"
			end
		
			puts "What do you want?"
			puts "1. Add"
			puts "2. Change"
			puts "3. Delete"
			puts "4. Show Theme"
			puts "5. Finish"
			choice = gets.to_i
			case choice
				when 1
					puts "New name"
					new_name=gets.chomp
					@obj_data.add(new_name)
					
				when 2
					puts "What?"
					what = gets.to_i
					puts "New name"
					new_name=gets.chomp
					@obj_data.change(what,new_name)
				when 3
					puts "What?"
					what = gets.to_i
					if @obj_data.check?(what) then
						@obj_data.del(what)
					end
				when 4
					@obj_data.save_to_file
					puts "What?"
					what = gets.to_i
					@obj.open_them(number)
					@obj_data.read_data
				when 5
					@obj_data.save_to_file
				else
					puts "wrong task"
			end
					
		end
		
	end



end