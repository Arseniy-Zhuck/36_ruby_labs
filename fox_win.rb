current_path = File.dirname(__FILE__)
require "#{current_path}/data_modelling.rb"
require 'fox16'
require 'date'

include Fox

class Prog_window < FXMainWindow
	attr_accessor :model, :app, :menu
  	
  	def initialize(app, model, title)
  		self.app= app
  		self.model= model
  		super(self.app, title, nil, nil,DECOR_TITLE | DECOR_CLOSE)
  		self.menu= FXMenuBar.new(self, LAYOUT_SIDE_TOP|LAYOUT_FILL_X)
  		filemenu = FXMenuPane.new(self)
    	FXMenuCommand.new(filemenu, "&Quit\tCtl-Q", nil, getApp(), FXApp::ID_QUIT)
    	FXMenuTitle.new(self.menu, "&File", nil, filemenu)
  	end	

  	def create
    	super
    	show(PLACEMENT_SCREEN)
  	end

end

class Table_Window < Prog_window

	 def initialize(app,model,title)
		super
		FXHorizontalSeparator.new(self, LAYOUT_SIDE_TOP|LAYOUT_FILL_X|SEPARATOR_GROOVE)
  
    	# Contents
    	contents = FXVerticalFrame.new(self, LAYOUT_SIDE_TOP|FRAME_NONE|LAYOUT_FILL_X|LAYOUT_FILL_Y)
    
    	frame = FXVerticalFrame.new(contents, FRAME_SUNKEN|FRAME_THICK|LAYOUT_FILL_X|LAYOUT_FILL_Y, :padding => 0)
  
	    # Table
    	@table = FXTable.new(frame,
      		:opts => TABLE_COL_SIZABLE|TABLE_ROW_SIZABLE|LAYOUT_FILL_X|LAYOUT_FILL_Y,
      		:padding => 2)
      
	    @table.visibleRows = 20
    	@table.visibleColumns = 8

      x= self.model.list_names.size
	    @table.setTableSize(x, 3)

	    @table.setBackColor(FXRGB(255, 255, 255))
    	@table.setCellColor(0, 0, FXRGB(255, 255, 255))
    	@table.setCellColor(0, 1, FXRGB(255, 240, 240))
    	@table.setCellColor(1, 0, FXRGB(240, 255, 240))
    	@table.setCellColor(1, 1, FXRGB(240, 240, 255))
  
    	# Initialize the scrollable part of the table
    	(0..(x-1)).each do |r|
      		@table.setItemText(r, 0, "#{self.model.list_names[r]}")
          @table.setItemText(r,1,"#{self.model.list_counts[r]}")
      end
    	

    	# Initialize column headers
      @table.setColumnText(0,"Name")
      @table.setColumnText(1, "Count")
    
    	# Initialize row headers
    		(0..(x-1)).each { |r| @table.setRowText(r, "Row#{r}") }
      @table.fitColumnsToContents(0)
	end

end

class Table_Cut_Window < Table_Window

end

class Table_Start_Window < Table_Window

end

class Table_Full_Window < Table_Window

end

#if __FILE__ == $0
  # Make application
 # application = FXApp.new("TableApp", "FoxTest")
  #lt= List_Themes.new(application,[12,13],["name1","name2"],[0,0])
  # Make window
  #Table_Start_Window.new(application,lt,"title")
  
  # Create app
  #application.create
  
  # Run
  #application.run
#end