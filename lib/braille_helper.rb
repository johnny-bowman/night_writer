require 'pry'
module BrailleHelper

  def letters
    letters = {
      "a" => ["O",".",".",".",".","."],
      "b" => ["O",".","O",".",".","."],
      "c" => ["O","O",".",".",".","."],
      "d" => ["O","O",".","O",".","."],
      "e" => ["O",".",".","O",".","."],
      "f" => ["O","O","O",".",".","."],
      "g" => ["O","O","O","O",".","."],
      "h" => ["O",".","O","O",".","."],
      "i" => [".","O","O",".",".","."],
      "j" => [".","O","O","O",".","."],
      "k" => ["O",".",".",".","O","."],
      "l" => ["O",".","O",".","O","."],
      "m" => ["O","O",".",".","O","."],
      "n" => ["O","O",".","O","O","."],
      "o" => ["O",".",".","O","O","."],
      "p" => ["O","O","O",".","O","."],
      "q" => ["O","O","O","O","O","."],
      "r" => ["O",".","O","O","O","."],
      "s" => [".","O","O",".","O","."],
      "t" => [".","O","O","O","O","."],
      "u" => ["O",".",".",".","O","O"],
      "v" => ["O",".","O",".","O","O"],
      "w" => [".","O","O","O",".","O"],
      "x" => ["O","O",".",".","O","O"],
      "y" => ["O","O",".","O","O","O"],
      "z" => ["O",".",".","O","O","O"],
      " " => [".",".",".",".",".","."],
      "," => [".",".","O",".",".","."],
      ";" => [".",".","O",".","O","."],
      ":" => [".",".","O","O",".","."],
      "." => [".",".","O","O",".","O"],
      "!" => [".",".","O","O","O","."],
      "?" => [".",".","O",".","O","O"],
      "shift" => [".",".",".",".",".","O"],
      caps: %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
    }
  end

  def include_capital?(text)
    true if text.chars.find_all do |letter|
      letters[:caps].include?(letter)
    end
  end

  def num_caps(text)
    text.chars.find_all do |letter|
      letters[:caps].include?(letter)
    end.count
  end

  def bump_line(text, bump_a, bump_b)
    text_array = text.split('')
    line_text = ""
    text_array.each do |letter|
      if letters[:caps].include?(letter)
        line_text << letters["shift"][bump_a..bump_b].join
        line_text << letters[letter.downcase][bump_a..bump_b].join
      else
        line_text <<  letters[letter][bump_a..bump_b].join
      end
    end
    line_text
  end

  def create_braille_array(braille_text)
    braille_array = braille_text.chars
  end

end
