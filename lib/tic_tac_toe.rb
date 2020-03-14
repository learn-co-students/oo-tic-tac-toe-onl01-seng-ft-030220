require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS=[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  
  #initializes every new object to the array value of 9 empty spaces
  
  def initialize
    @board=Array.new(9," ")
  end
  
  
  
  #prints the layout of board with 9 empty spaces ready to play
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
 
 
 
 #takes argument of string and converts into an integer minus 1 
 #because players will enter number from 1-9
 #and our index starts from 0,not 1 
 
  def input_to_index(str_num)
    str_num.to_i-1
  end
  
  
  
  
  # takes 2 arguments; board index and player(either X or O)
  
  def move(board_index,token='X')   
    
    #returns updated board index with token(X or O)
    @board[board_index]=token 
    
  end
  
  
  
  #takes argument of index and returns false if given index in board is not occupied
  #else returns true if given board index is occupied
  
  def position_taken? (index)
    
   @board[index]!= " "
   
  end
  
  
  
  #takes argument of an index, passes that argument to 
  #position_taken and checks if it is not occupied in that board index
  #return true if it is empty/not occupied, else false 
  
  def valid_move? (index)
    index.between?(0,8) && !position_taken?(index)
  end 
  
  

  #returns the number of turns so far in the board 
  
  def turn_count
    @board.count { | space | space != " " }
  end 
  
  
  
  #by default X starts the game, so if the number of turn in the board is even, then X is going next
  # returns X or O using #turn_count method
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  
  #ask user input(1-9)
  #converts input into index, and checks if valid_move(index) returns true
  #If true, it will pass that converted index and current_player(X or O ) to move that will return updated board and displayed
  #if false, it call on itself, repeats the whole process again
  
  def turn
    
    puts "Choose your move wisely (1-9):"
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
  
  
  

  
  #checks if each winning index position in individual array of WIN_COMBINATIONS corresponds to either "X" or "O" in the @board's index.
  #if all checks out, it returns the array of winning indices
  #else returns false 
  def won? 
    @winner_arr=[]
    
    WIN_COMBINATIONS.map do |element|
      
      e1,e2,e3=element[0],element[1],element[2]
      
      b1,b2,b3=@board[e1],@board[e2],@board[e3]
      
      if b1=='X' && b2=='X' && b3=='X'
        @winner_arr<< element
        return element
        
      elsif b1=='O' && b2=='O' && b3=='O'
        @winner_arr << element
        return element
        
      end 
     
    end 
      
    return false
    
  end 
  
  

  #checks if @board is full reaching the max capacity of 9 
  # if yes, returns true 
  
  def full?
    turn_count==9
  end 
  
  
  #returns true of @board is full and nobody won
  #else returns false for all conditions
  def draw?
    full? == true && won? == false
  end 
  

  #returns true if somebody won or @board is full
  
  def over?
    draw? || won? || turn_count==9
    
  end 
    

  #returns X or O whoever won the game 
  #if won? is true, returns the first element
  #else returns nil
  
  def winner
    winner_indices= won?
    
    if winner_indices!=false 
      return @board[winner_indices[0]]
    else
      return nil 
    end
    
  end
  
  
  
  
  
  #while game is not over, keep playing
  #if won? Congratulate player
  #elsif draw? Cat's Game!
  
  def play
   
    until over?
      turn 
    end 
    
    # while over? !=true  do
    #   turn
    # end 
  
    if won?!=false 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
   
  end
 
end