
require 'mysql2'
puts "control 1"
client = Mysql2::Client.new(:host => 'localhost', :username => 'root')
puts "control 2"
client.query("USE prob_v")
puts "control 3"
client.query("SELECT * from Theme").each do 
|t|
puts "Name: #{t["Name"] }, Count: #{t["Counts"] }"
end
puts "control 4"