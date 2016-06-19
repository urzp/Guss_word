
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
  attr_read = :board[:mistakes]

  def initialize ()
    @board={}
    @board[:word] = take_rnd_word($words).chomp
	@board[:turn] = 0
	@board[:step_paly]=1
	@board[:mistakes]=[]
	@board[:opened_symbols]=[]
  end
  
  def draw_board()
    
    puts @board
    puts "Play step: #{ @board[:step_paly] }"
    word = hiden_word(@board[:word], @board[:opened_symbols])
	puts "Word: #{word}"	
	puts "Misatakes (#{@board[:mistakes].size}): #{ (@board[:mistakes]).join(", ") } "
  end
  
  def play
    selection = ""
    print "Your letter: "
	while !selection.between?("a", "z") 
	  selection = gets.chomp.to_s.downcase
	  if !selection.between?("a", "z") 
	    puts "Wrong symbol, please puts letter (a..z)" 
	  end
	end
	check_symbol(selection)
	@board[:step_paly] += 1 
  end
  
  def win?
    return true if @board[:word].split(//).all?{ |i| @board[:opened_symbols].include?(i) }
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
	0.upto(word.length - 1) do |i|
	  opened_symbols.any? { |op_sy| op_sy == word[i] }? h_word += " " + word[i] : h_word += " _"
	end
	return h_word
  end
  
  def check_symbol(selection)
    @board[:word].include?(selection) ? @board[:opened_symbols] << selection : @board[:mistakes] << selection 
  end
end


load_words()
game = Game.new
while 
  game.draw_board
  game.play
  if game.win?
    game.draw_board
    puts "You win" 
	break
  end
end
