require 'pry'
require './lib/translator'
translator = Translator.new

handle = File.open(ARGV[0], "r")
braille_text = handle.read
handle.close

new_file_text = braille_text.chomp
english = File.open(ARGV[1], "w")
english.write(new_file_text)
binding.pry
