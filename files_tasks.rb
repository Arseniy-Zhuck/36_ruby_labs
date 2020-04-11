class Files_tasks
	@list_kinds
	@list_kinds_points
	
	def initialize
		self.get_kinds
		
	end
	
	def get_kinds
		kinds=[]
		kinds_points = []
		if File.exist? 'kinds.txt' then
			File.foreach('kinds.txt') do 
				|line|
				a = line.split(" - ")
				i = a[0].to_i
				p i
				kinds[i] = a[1]
				
				if a[2] then
					kinds_points[a[0].to_i]=a[2]
				end	
			end
		end
		@list_kinds, @list_kinds_points = kinds, kinds_points
	end
	
	def check_theme?(theme_Id)
		work,kind,points =read_theme_works(theme_Id)
		a = (work != [])
		p a
		return work != []
	end
	
	def read_theme_works(theme_ID)
		work= []
		kind= []
		points = []
		puts "sdfsdf"
		if File.exist? 'works.txt' then
			File.foreach('works.txt') do 
				|line|
				
				a = line.split(" - ")
				
				if a[2].to_i == theme_ID then
					id = a[0].to_i
					work[id] = a[1]
					kind[id] = @list_kinds[a[3].to_i]
					points[id] = a[4].to_i
				end
			end
		end
		return work,kind,points
	end
	
	
	def read_themes
		list_thems = []
		list_counts = []
		if File.exist? 'themes.txt' then
				a=0
				id=0
				count=0
				
				File.foreach('themes.txt') do 
					|line|
					case a
						when 0
							id = line.to_i
							
						when 1
							name = line.chomp
							list_thems[id]=name
						when 2
							c = line.to_i
							list_counts[id]=c
							count+=1
						else raise 'vse ploho'
					end
					a = (a+1)%3
				end
		end
		
		return list_thems, list_counts
	end

	def save_themes(list_thems,list_counts)
		File.open('themes.txt',"w") do
			|file|
			list_thems.each_index do 
				|id|
				file.puts(id)
				file.puts(list_thems[id])
				file.puts(list_counts[id])
			end
		end
	end

end