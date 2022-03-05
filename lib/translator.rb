require 'pry'
require './lib/braille_helper'

class Translator
  include BrailleHelper
  attr_reader :alphabet

  def initialize(alphabet = letters)
    @alphabet = alphabet
  end

  def full_braille_rows(text)
    braille_lines = "#{bump_line(text, 0, 1)}#{bump_line(text, 2, 3)}#{bump_line(text, 4, 5)}".chars
    x = braille_lines.each_slice((text.length) * 2).to_a
  end

  def print_braille(text)
    text_chunks = full_braille_rows(text)
    words = ""
    until text_chunks[0].empty?
      text_chunks.each do |chunk|
        words << "#{chunk[0..79].join}\n"
        chunk.slice!(0..79)
      end
    end
    words
  end

end