class TicTacToe

WIN_COMBINATIONS = [[0, 1, 2],
                   [3, 4, 5],
                   [6, 7, 8],
                   [0, 3, 6],
                   [1, 4, 7],
                   [2, 5, 8],
                   [0, 4, 8],
                   [2, 4, 6]]

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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, token)
  @board[index] = token
end

def position_taken?(index)
  @board[index] != " "
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Choose your move wisely (1-9):"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    token = current_player
    move(index, token)
  else
    "Please make another choice"
    turn
  end
  display_board
end

def turn_count
  @board.count { |space| space != " " }
end

def current_player
  turn_count.even? ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.any? do |combo|
    if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
      return combo
    end
  end
end

def full?
  @board.all? { |space| space != " " }
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
 combo = won?
 if combo
   return @board[combo[0]]
 end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
