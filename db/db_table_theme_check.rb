require 'mysql2'
include Mysql2
puts "control 1"
client = Client.new(:username => 'ars', :password => '111', :host => 'localhost')
puts "control 2"
client.query("USE Discrete_mathematics")
puts "control 3"
r = client.query("SELECT * From Themes")
r.each do |theme|
puts format("%1i | %25s |%3i", theme["Theme_ID"], theme["Theme_Name"], theme["Theme_Count"])	
end