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
    [6, 4, 2]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
  end
  
def input_to_index(input)
  @index = input.to_i - 1
end

def move(input_index, token = "X")
  @board[input_index] = token
end

def position_taken?(index)
  @board[index] != " "
end

def valid_move?(index)
  index.between?(0, 8) && @board[index] == " "
end

def turn 
  puts "please choose between 1-9:"
  user_choice = gets.chomp
  index = input_to_index(user_choice)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  @turns = 0 
  @board.each do |position|
    if position != " "
      @turns += 1
    end
  end
  @turns
end

def current_player
  if turn_count.even?
    player = "X"
  else
    player = "O"
  end
end

def won?
  
  WIN_COMBINATIONS.each do |combinations|
    i0 = combinations[0]
    i1 = combinations[1]
    i2 = combinations[2]
    
    if @board[i0] == "X" && @board[i1] == "X" && @board[i2] == "X"
      return combinations
    elsif @board[i0] == "O" && @board[i1] == "O" && @board[i2] == "O"
      return combinations
    end
  end
  
  return false
end

def full?
  @board.all? do |position|
    position != " "
  end
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  if won? != false
    return @board[won?[0]]
  end
end

def play
  puts "*** CLI Tic Tac Toe Game ***\n\n"
    display_board
    puts ""
  while !over?
    turn
  end
  
  if won? != false
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!" 
  end
end












end