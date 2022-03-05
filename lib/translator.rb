require 'pry'
require './lib/braille_helper'

class Translator
  include BrailleHelper
  attr_reader :alphabet

  def initialize(alphabet = letters)
    @alphabet = alphabet
  end

  def print_braille(text)
    "#{bump_line(text, 0, 1)}\n#{bump_line(text, 2, 3)}\n#{bump_line(text, 4, 5)}"
  end

end
