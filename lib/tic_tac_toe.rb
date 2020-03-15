require 'pry'
class TicTacToe
  
WIN_COMBINATIONS =  [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]] 

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end 

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end  
#binding.pry
def input_to_index(user_input)
  user_input.to_i-1
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
  @board.count { | space | space != " " }
end

def current_player
  turn_count.even? ? "X" : "O"
end

def turn
  puts "Choose your move wisely 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    piece = current_player
    move(index, piece)
  else 
    "Please select a valid choice."
    turn
  end 
  display_board
end 

def won?
WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == @board[win_combo[1]] &&  @board[win_combo[1]] == @board[win_combo[2]] &&  position_taken?(win_combo[0])
        return win_combo
      end
    end
    false
  end

def full?
  @board.all? do |index|
    if index == "X" || index == "O"
      true
    end
  end 
end


def draw?
    if full? && won? == false
      true
    else
      false
    end 
  end  

def over?
  if won? || full? || draw?
    true
  else
    false
  end 
end

def winner
  winning_combo = won?
  
  if winning_combo != false && winning_combo.all? {|i| @board[i] == "X"}
    "X"
  elsif winning_combo != false && winning_combo.all? {|i| @board[i] == "O"}
  "O"
else
  nil 
end 
end 
def play 
  turn until over?
  if won?
    puts "Congratulations #{winner}!"
    elsif draw?
    puts "Cat's Game!"
  end 
end 
end  

    








