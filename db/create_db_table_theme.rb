
require 'mysql2'
include Mysql2
puts "control 1"
client = Client.new(:username => 'ars', :password => '111', :host => 'localhost')
puts "control 2"
client.query("USE Discrete_mathematics")
puts "control 3"
client.query("create table Themes (
        Theme_ID integer not null auto_increment,
        Theme_Name varchar(50),
        Theme_Count integer,
        primary key (Theme_ID)
    )")
puts "control 4"
client.query("insert into Themes (Theme_ID, Theme_Name, Theme_Count)
				values (null, 'Теория графов', 0)")
puts "control 5"
client.query("insert into Themes (Theme_ID, Theme_Name, Theme_Count)
				values (null, 'Конечные автоматы', 0)")
puts "control 6"
client.query("insert into Themes (Theme_ID, Theme_Name, Theme_Count)
				values (null, 'Теория информации', 0)")
puts "control 7"