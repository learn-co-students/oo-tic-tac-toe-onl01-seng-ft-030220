require 'pry'
class TicTacToe
  attr_accessor :full, :won

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  

  def initialize(board = nil)
    @board = Array.new(9, " ")
    current_player = @player_x
  end 
  
  def input_to_index(number)
    number= number.to_i-1
#    if number != 0 
#      conversion = number-1 
#    end 
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def move(board_index, players_token="X")
    players_token == "X" || players_token == "O"
    @board[board_index] = players_token
  end
  
  def position_taken?(input)
    if @board[input] == "X" || @board[input] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
  end

  def turn_count
    taken = 0
    @board.each do |i|
      if i == "X" || i == "O"
        taken += 1
      end
    end
    return taken
  end
  
  def current_player
    player = nil
    if turn_count() % 2 == 0
      player = 'X'
    else
      player = 'O'
    end
    return player
  end
  
  def turn
    #@turn=turn
    puts "Choose a spot between 1-9"
    answer = gets.strip
    spot = input_to_index(answer)
    #binding.pry
    if valid_move?(spot)
      move(spot, current_player)
    else
      turn
    end
    display_board
  end
  
  def won?
#    if @board.empty?(&:blank?) 
#      puts "draw"
#    end
    WIN_COMBINATIONS.any? do |combo|
    if combo.all? { |index| @board[index]=="X"}
    return combo
    elsif combo.all? {|index| @board[index]=="O"}
    return combo
      end
    end
  end 
  
   def full?
     @board.all? {|filled| filled !=  " "}
   end
  
  def draw?
    !won? && full?
  end

  def over?
  won? || draw?
  end
  
  def winner 
    WIN_COMBINATIONS.any? do |combo|
    if combo.all? { |index| @board[index]=="X"}
      @winner = "X"
            return "X"

    elsif combo.all? {|index| @board[index]=="O"}
      @winner = "O"
            return "O"
    else
    end
    end
    # if draw?
    #   return nil
    # end 
    nil
   end
  
  def play
  turn until over?
  # binding.pry
  if won?
  puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
    end
  end 
end  
