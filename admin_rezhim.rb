current_path = File.dirname(__FILE__)
require "#{current_path}/controller_super.rb"
require 'fox16'
include Fox
 
class ChoozeRezhimWindow < FXMainWindow
  attr_accessor :controller, :app
  def initialize(app, controller)
    # Сначала инициализируем базовый класс.
    self.app= app
    self.controller= controller
    super(self.app, "Choose rezhim", nil, nil,
    DECOR_TITLE | DECOR_CLOSE)
    # Первая кнопка:
    puts "ChoozeRezhimWindow.initialize: super_class.new is done"
    @button_zero = FXButton.new(self, "Kinds")
    @button_one = FXButton.new(self, "Themes")
       # Вторая кнопка:
    @button_two = FXButton.new(self, "Students")
    @button_three = FXButton.new(self, "Be a student")
    @button_four = FXButton.new(self, "Be a teacher")
    @button_five = FXButton.new(self, "Build all data")
    @button_six = FXButton.new(self, "Close")
    puts "ChoozeRezhimWindow.initialize: buttons is initialized"
    # Устанавливаем обработчики сообщений.
    puts self.controller
    @button_zero.connect(SEL_COMMAND, method(:onKinds))
    @button_one.connect(SEL_COMMAND, method(:onThemes))
    @button_two.connect(SEL_COMMAND, method(:onStudents))
    @button_three.connect(SEL_COMMAND, method(:onStudent))
    @button_four.connect(SEL_COMMAND, method(:onTeacher))
    @button_five.connect(SEL_COMMAND, method(:onBuilding))
    @button_six.connect(SEL_COMMAND, method(:onClose))
    puts "ChoozeRezhimWindow.initialize: buttons are connected to methods"
    self.connect(SEL_CLOSE, method(:on_close))
 end


 def on_close(sender, sel, ptr)
    puts "we want close everything"
    self.controller.on_admin_close
 end

 def onKinds(sender, sel, ptr)
    puts "ChoozeRezhimWindow.onKinds: button Kinds is pushed"
    self.hide
    self.controller.show_kinds
 end

 def onThemes(sender, sel, ptr)
    puts "ChoozeRezhimWindow.onKinds: button Themes is pushed"
    self.hide
    self.controller.show_themes
 end

 def onStudents(sender, sel, ptr)
    puts "Sorry, this method is not ready"
 end

 def onStudent(sender, sel, ptr)
    puts "Sorry, this method is not ready"
 end

 def onTeacher(sender, sel, ptr)
    puts "Sorry, this method is not ready"
 end

 def onBuilding(sender, sel, ptr)
    puts "Sorry, this method is not ready"
 end

 def onClose(sender, sel, ptr)
    puts "Sorry, this method is not ready"
 end

 

end

