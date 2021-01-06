require 'tk'
hello = TkRoot.new
TkLabel.new(hello) do |variable|
	text "\n Hello, Matz! \n"
	pack
end

Tk.mainloop