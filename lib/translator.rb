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
    three_seperated_braille_rows = full_braille_lines.each_slice((text.length) * 2).to_a
  end

  def print_braille(text)
    braille_chunks = full_braille_rows(text)
    words = ""
    until braille_chunks[0].empty?
      braille_chunks.each do |chunk|
        words << "#{chunk[0..79].join}\n"
        chunk.slice!(0..79)
      end
    end
    words
  end

  def collect_braille_text(text)
    braille_array = text.chars
    braille_array.delete("\n")
    nested_braille_arrays = braille_array.each_slice((braille_array.length) / 3).to_a
  end

end
