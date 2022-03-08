require 'pry'
require './lib/translator'
translator = Translator.new

handle = File.open(ARGV[0], "r")
braille_text = handle.read
handle.close

braille_text_arrays = translator.collect_braille_text(braille_text)
organized_braille = translator.organize_braille_arrays(braille_text_arrays)
capitalized_braille = translator.capitalize_braille(organized_braille)
english_text = translator.print_english(capitalized_braille)

english = File.open(ARGV[1], "w")
english.write(english_text)

puts "Created '#{ARGV[1]}' containing #{english_text.length} characters"
