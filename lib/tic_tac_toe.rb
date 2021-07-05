require 'pry'
class TicTacToe 
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input = input.to_i 
    input = input -1 
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true 
    else
      false 
    end
  end
  
  def turn_count
     counter = 0 
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1 
    end 
  end
  counter
end
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
      
  def turn
     puts "Please enter 1-9:"
     i = gets.strip
     index = input_to_index(i)
     if valid_move?(index)
       move(index, current_player)
       display_board
     else
       turn
     end
     
  end
  
  def won?
    WIN_COMBINATIONS.any? do |combo|
     # binding.pry 
     if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
       return combo 
     end
  end
  end
  
  def full?
    @board.all? {|position| position != " "}
  #   if @board.include?(" ")
  #   return false   
  # else
  #   true 
  # end
end

  def draw? 
    full? && !won? 
#       false
#     else if 
#       full? == false 
#       false 
#     else true
#   end
# end
end
  
  def over?
     won? || draw?
  end
  
  def winner 
    if won? && current_player == "X"
      "O"
    elsif won? && current_player == "O"
      "X"
    end
end

def congrats 
  if winner == "X"
    puts "Congratulations X!"
    elsif winner == "O"
    puts "Congratulations O!"
    elsif draw? 
    puts "Cat's Game!"
  end
end


  def play 
    turn until over?
   #   binding.pry 
      congrats 
    
end
end