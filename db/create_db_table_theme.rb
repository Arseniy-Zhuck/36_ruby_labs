
require 'mysql2'
include Mysql2
puts "control 1"
client = Client.new(:username => 'ars', :password => '111', :host => 'localhost')
puts "control 2"
client.query("USE Discrete_mathematics")
puts "control 3"
#client.query("create table Kinds (
#        Kind_ID integer not null auto_increment,
#        Kind_Name varchar(50),
#        Kind_Count integer,
#        primary key (Kind_ID)
#    )")
puts "control 4"
client.query("insert into Kinds (Kind_ID, Kind_Name, Kind_Count)
				values (null, 'Практика', 0)")
puts "control 5"
client.query("insert into Kinds (Kind_ID, Kind_Name, Kind_Count)
				values (null, 'Теория', 0)")
puts "control 6"
client.query("insert into Kinds (Kind_ID, Kind_Name, Kind_Count)
				values (null, 'Контрольные работы', 0)")
puts "control 7"