#! /usr/bin/ruby

# set path and name of input file
require 'rubygems'
require 'net/ssh'

#Declare username and password
#USER = 'doug'
#PASS = 'R0cket$auce'

#Flush input buffers before reading in data
STDOUT.flush

# Request username and password
puts "What username would you like to use?"
USER = gets.chomp

puts "What password would you like to use?"
PASS = STDIN.noecho(&:gets).chomp

# set the variable name for the file to be read in
INPUTFILE = "testlist"

# initialize array input_array
#input_array 
# read input file into array
input_array = IO.readlines(INPUTFILE) 

#print out entries in array THIS IS TO TEST THE ABOVE AND NEEDS TO BE REMOVED!
#puts my_array

#SSH to the hosts and do something
input_array.each do |ip|
  Net::SSH.start(ip.to_s.chomp, USER, :password => PASS ) do|ssh| 
    result = ssh.exec!('ls -l')
  puts result
  end
end
