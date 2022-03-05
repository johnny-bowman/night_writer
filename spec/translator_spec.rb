require 'rspec'
require 'pry'
require './lib/translator'

RSpec.describe Translator do
  before (:each) do
    @translator = Translator.new
  end

  it "exists" do
    expect(@translator).to be_an_instance_of(Translator)
  end

  it "has readable letters from braille_helper module" do
    expect(@translator.alphabet[:a]).to eq(["O",".",".",".",".","."])
  end

  it "prints braille letters" do
    expect(@translator.print_braille("abc")).to eq("O.O.OO\n..O...\n......")
  end
end
