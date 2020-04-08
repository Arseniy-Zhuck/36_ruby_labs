class List_Themes
	@list_thems
	@list_counts
	@count

	def initialize
		
		@list_counts = Array.new
		@list_thems = Array.new
		raise "NO FILE" if !File.exist? 'test.txt'
		a=0
		id=0
		@count=0	
		File.foreach('test.txt') do 
			|line|
			case a
				when 0
					id = line.to_i
					puts id
				when 1
					name = line.chomp
					puts name
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
	aggr_accessor :theme_ID
	
	@list_count

	def initialize(iD, theme_name)
		self.theme_ID= iD
		self.theme_name= theme_name
		self.read_count
	end
	
	def read_count
		
	end
end

a = List_Themes.new
a.show_list
theme_number=gets.to_i
a.open_them(theme_number)
