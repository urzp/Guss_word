
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
  

  def initialize ()
    @board={}
    @board[:word] = take_rnd_word($words)
	@board[:turn] = 0
	@board[:mistakes]=["c","g"]
	@board[:opened_symbols]=["a","b","s","d","f","g","h","t"]
  end
  
  def draw_board()
      word = hiden_word(@board[:word], @board[:opened_symbols])
	puts "Word: #{word}"
	
	puts "Misatakes: #{ (@board[:mistakes]).join(",") } "
	
	
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
  
  def hiden_word(word, opened_symbols)
    h_word=""
	0.upto(word.length) do |i|
	  opened_symbols.any? { |op_sy| op_sy == word[i] }? h_word += " " + word[i] : h_word += " _"
	end
	return h_word
  end
end


load_words()
game = Game.new
game.draw_board
