current_path = File.dirname(__FILE__)
require "#{current_path}/list_themes.rb"

class Term_Admin
attr_accessor :obj



	def initialize(obj)
		self.obj= obj
		
	end


end

class Term_Admin_rezhim < Term_Admin
attr_accessor :user	
	
	def initialize(obj,user)
		super(obj)
		self.user= user
	end
	
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
	
	
	def show_list
		list=@obj.list_thems
		if list!=[] then
			@obj.list_thems.each_index do
				|i|
				if @obj.list_thems[i] != nil
					puts format("%1i | %25s |%3i", i, @obj.list_thems[i], @obj.list_counts[i])
				end
			end
		else
			puts "There is no themes yet"
		end	
	end
	
	def show
		choice = 0
		self.show_list
		while choice!=6 do
			puts "What do you want?"
			puts "1. Save to file"
			puts "2. Add"
			puts "3. Change"
			puts "4. Delete"
			puts "5. Show Theme"
			puts "6. Finish"
			choice = gets.to_i
			case choice
				when 1
					@obj.save_to_file
				when 2
					puts "New name"
					new_name=gets.chomp
					@obj.add_visual(new_name)
					self.show_list
				when 3
					puts "What?"
					what = gets.to_i
					puts "New name"
					new_name=gets.chomp
					@obj.change_visual(what,new_name)
					self.show_list
				when 4
					puts "What?"
					what = gets.to_i
					if @obj.check? 
						@obj.del(what)
						self.show_list
					else
						puts "There are works for this theme, you cannot delete it"
					end
					
				when 5
					@obj.save_to_file
					puts "What?"
					what = gets.to_i
					@obj.open_them(number)
					self.show_list
				when 6
					@obj.save_to_file
				else
					puts "wrong task"
			end
					
		end
		
	end



end