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
    expect(@translator.alphabet["a"]).to eq(["O",".",".",".",".","."])
    expect(@translator.alphabet[" "]).to eq([".",".",".",".",".","."])
  end

  it "creates three arrays representing the three rows of braille characters" do
    expect(@translator.full_braille_rows("ab")).to eq([["O", ".", "O", "."], [".", ".", "O", "."], [".", ".", ".", "."]])
  end

  it "prints braille letters" do
    expect(@translator.print_braille("a b c")).to eq("O...O...OO\n....O.....\n..........\n")
  end

  it "organizes braille text into nested arrays" do
    expect(@translator.collect_braille_text("a bc")).to eq([["O", ".", ".", ".", "O", ".", "O", "O"], [".", ".", ".", ".", "O", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."]])
  end
end
