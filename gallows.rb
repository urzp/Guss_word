
# Gallows

def load_words(file_name="5desk.txt")
  if !File.exist?(file_name)
    puts "Library of words, the file #{file_name} is not found!" 
	return false
  end
  
  puts "File of library #{file_name} loaded successful"
  library = File.readlines(file_name)
  $words = library.select{|i| i.length.between?(5,12)}
end

class Game
  @board

  def initialize ()
    @word = take_rnd_word($words)
	puts @word
  end
  
  def draw_board()
  end
  
  def play
  end
  
  def win_lose?
  end
  
  def save
  end
  
  def load
  end
  
private
  def take_rnd_word(words)
    words[(rand * words.size).to_i].downcase
  end
  
end


load_words()
game = Game.new