class List_Themes
	attr_accessor @list_thems, @list_counts
	@count
	

	def initialize(themes, counts)
		self.list_thems= themes
		self.list_counts= counts
		
				
	end

	def read_from_file
			if File.exist? 'test.txt' then
				a=0
				id=0
				@count=0	
				File.foreach('test.txt') do 
					|line|
					case a
						when 0
							id = line.to_i
							
						when 1
							name = line.chomp
							@list_thems[id]=name
						when 2
							count = line.to_i
							@list_counts[id]=count
							@count+=1
						else raise 'vse ploho'
					end
					a = (a+1)%3
				end
			end
	end
	
	def show
		if @count then
			self.show_list
		else
			puts "There is no themes yet"
		end
		puts "What do you want?"
		puts "1. Add"
		puts "2. Change"
		puts "3. Delete"
		puts "4. Save"
		puts "5. Show Theme"
	end
	
	def show_list
		puts "Vsego #{@count} tem"
		for i in 1..@count do
			puts format("%1i | %25s |%3i", i, @list_thems[i], @list_counts[i])
		end
	end
	
	def open_them(theme_number)
		a = Theme.new
		a.show_problems
	end
	
end

class Theme
	attr_accessor :theme_ID
	
	@list_count

	def initialize(iD, theme_name)
		self.theme_ID= iD
		self.theme_name= theme_name
		self.read_count
	end
	
	def read_count
		
	end
end


