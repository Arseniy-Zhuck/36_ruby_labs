
require 'mysql2'
include Mysql2
puts "control 1"
client = Client.new(:username => 'ars', :password => '111', :host => 'localhost')
puts "control 2"
client.query("CREATE DATABASE DM")
puts "control 2.5"
client.query("USE DM")
puts "control 3"
client.query("create table Theme (
        Theme_ID integer not null auto_increment,
        Theme_Name varchar(50),
        Theme_Count integer,
        primary key (Theme_ID)
    )")
puts "control 4"