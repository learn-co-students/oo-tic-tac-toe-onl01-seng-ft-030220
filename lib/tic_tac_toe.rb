class TicTacToe 

 WIN_COMBINATIONS = [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
def initialize
  @board =[" "," "," "," "," "," "," "," "," "]
end

def display_board
 puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
 puts "-----------"
 puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
 puts "-----------"
 puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def input_to_index(input)
input.to_i-1
end

def move(index, piece)
  @board[index] = piece
end

def position_taken?(index)
  @board[index] != " "
end 

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  @board.count { | space | space !=" " }
end 

def current_player 
  turn_count.even? ? "X" : "O"
end 
def turn
  puts "Choose your move wisely (1-9):"
  user_input = gets.strip
  index = input_to_index(user_input)
if valid_move?(index)
  piece = current_player 
  move(index, piece)
else
  "Please select a valid choice"
  turn 
end 
display_board
end 
def won?
 WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]
  
 if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
   
 end
 } 
 return false 
end 
def full?
  turn_count == 9 
end
def draw?
  if !won? && full?
  return true 
else 
  return false 
  end 
end
def over? 
  if won? || draw?
    return true 
  else 
    false 
  end 
end
def winner
  index = []
  index = won?
  if index == false
    return nil
  else
    if @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play
  until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
 
end

end
    










