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

  it "puts braille text into nested arrays" do
    expect(@translator.collect_braille_text("O...O.OO\n....O...\n........")).to eq([["O", ".", ".", ".", "O", ".", "O", "O"], [".", ".", ".", ".", "O", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."]])
  end

  it "organizes braille arrays into dictionary values" do
    collected_braille = collect_braille_text([["O", ".", ".", ".", "O", ".", "O", "O"], [".", ".", ".", ".", "O", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."]])

    expect(@translator.organize_braille_text(colcollected_braille).to eq([["O", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."], ["O", ".", "O", ".", ".", "."], ["O", "O", ".", ".", ".", "."]])
  end

  it "prints english text from braille" do
    braille_arrays = collect_braille_text("O...O.OO\n....O...\n........")
    expect(@translator.print_english(braille_arrays)).to eq("a bc")
  end
end
