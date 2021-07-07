require 'pry'

class TicTacToe
  
  attr_accessor :board
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    @board.each_with_index do |space, i|
      if i % 3 == 0
        print " #{space} "
      elsif i == 1 || i == 4 || i == 7
        print "| #{space} |"
      else
        print " #{space} \-----------n"
      end
    end
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  
  def position_taken?(position)
    @board[position] != " "
  end
  
  def valid_move?(position)
    position >= 0 && position < 9 && !position_taken?(position)
  end
  
  def turn 
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    @board.count {|space| space != " "}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    x_spaces = []
    o_spaces = []

    board.each_with_index do |space, i|
      if space == "X"
        x_spaces << i
      elsif space == "O"
        o_spaces << i
      end
    end
    WIN_COMBINATIONS.detect do |win|
      (win - x_spaces).empty? || (win - o_spaces).empty?
    end
  end
  
  def full?
    @board.none?(" ")
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner  
    @board[won?[0]] if won?
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