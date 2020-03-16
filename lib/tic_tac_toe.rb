class TicTacToe



    def initialize
    @board = Array.new(9, " ")
    end
    
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    
    
    def input_to_index(user_input)
      user_input.to_i -1
     end
    def move(index, token)
      @board[index] = token
     end
    def position_taken?(index)
      @board[index] != " "
     end
    def valid_move?(index)
      !position_taken?(index) && index.between?(0,8)
     end
    def turn_count
      @board.count{ |square| square != " "}
    def current_player
      turn_count.even? ? "X" : "O"
     end
    def turn
      puts "P
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private
    WIN COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
    
    
    
    end
