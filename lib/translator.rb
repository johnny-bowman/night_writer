require 'pry'
require './lib/braille_helper'

class Translator
  include BrailleHelper
  attr_reader :alphabet

  def initialize(alphabet = letters)
    @alphabet = alphabet
  end

end
