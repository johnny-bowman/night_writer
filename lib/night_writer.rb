require 'pry'
require './lib/translator'
translator = Translator.new

handle = File.open(ARGV[0], "r")
message_text = handle.read
handle.close

new_file_text = translator.print_braille(message_text.chomp)

braille = File.open(ARGV[1], "w")
braille.write(new_file_text)

puts "Created '#{ARGV[1]}' containing #{(message_text.chomp.length) * 6} characters"
