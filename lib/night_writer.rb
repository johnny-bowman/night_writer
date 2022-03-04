require 'pry'
handle = File.open(ARGV[0], "r")
message_text = handle.read
handle.close

puts "Created '#{ARGV[1]}' containing #{message_text.chomp.length} characters"
