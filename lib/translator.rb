require 'pry'
require './lib/braille_helper'

class Translator
  include BrailleHelper
  attr_reader :alphabet

  def initialize(alphabet = letters)
    @alphabet = alphabet
  end

  def full_braille_rows(text)
    full_braille_lines = "#{bump_line(text, 0, 1)}#{bump_line(text, 2, 3)}#{bump_line(text, 4, 5)}".chars
    total_text_length = text.length
    total_text_length += num_caps(text) if include_capital?(text)
    three_seperated_braille_rows = full_braille_lines.each_slice(total_text_length * 2).to_a
  end

  def print_braille(text)
    braille_chunks = full_braille_rows(text)
    words = ""
    until braille_chunks[0].empty?
      braille_chunks.each {|chunk| words << "#{chunk[0..79].join}\n"
      chunk.slice!(0..79)}
    end
    words
  end

  def collect_braille_text(braille_text)
    braille_array = create_braille_array(braille_text)
    individual_braille_rows = []
    until braille_array.empty?
      individual_braille_rows << braille_array[0..((braille_array.find_index("\n")) - 1)]
      braille_array.slice!(0..braille_array.find_index("\n"))
    end
    individual_braille_rows
  end

  def organize_braille_arrays(arrays)
    dictionary_values = []
    until arrays.empty?
      dictionary_values << arrays[0..2].map {|array| array[0..1]
        array.slice!(0..1)}.flatten until arrays[0].empty?
      arrays.slice!(0..2)
    end
    dictionary_values
  end

  def capitalize_braille(dictionary_values)
    until !dictionary_values.include?([".",".",".",".",".","O"])
      shift_index = dictionary_values.find_index([".",".",".",".",".","O"])
      dictionary_values[shift_index + 1] = @alphabet.key(dictionary_values[shift_index + 1]).upcase
      dictionary_values.slice!(shift_index)
    end
    dictionary_values
  end

  def print_english(dictionary_values)
    words = ""
    until dictionary_values.empty?
      dictionary_values[0..39].each {|value| if value.class == Array
        words << @alphabet.key(value)
      else
        words << value
      end}
      dictionary_values.slice!(0..39)
      words << "\n"
    end
    words
  end

end
