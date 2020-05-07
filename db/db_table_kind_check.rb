require 'mysql2'
include Mysql2
puts "control 1"
client = Client.new(:username => 'ars', :password => '111', :host => 'localhost')
puts "control 2"
client.query("USE Discrete_mathematics")
puts "control 3"
r = client.query("SELECT * From Kinds")
r.each do |kind|
puts format("%1i | %25s |%3i", kind["Kind_ID"], kind["Kind_Name"], kind["Kind_Count"])	
end