class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

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
    @board.count{|space| space != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Choose your move (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      piece = current_player
      move(index, piece)
    else
      "Please select a valid move"
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |winning_combo|
      if position_taken?(winning_combo[0]) && @board[winning_combo[0]] == @board[winning_combo[1]] && @board[winning_combo[1]] == @board[winning_combo[2]]
       return winning_combo
      end
    end
    false
  end

  def full?
    @board.each do |piece|
      if piece == " "
        return false
      end
    end
    return true
  end

  def draw?
    return full? && !won?
  end

  def over?
    return draw? || won?
  end

  def winner
    if winning_combo = won?
      return @board[winning_combo[0]]
    end
  end

  def play
    turn until over?
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end


end

# 0 1 2
# 3 4 5
# 6 7 8
