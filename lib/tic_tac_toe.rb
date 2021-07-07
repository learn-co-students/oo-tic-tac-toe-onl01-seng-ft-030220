
require 'pry'
class TicTacToe
WIN_COMBINATIONS = [[0,1,2], [3,4,5],
[6,7,8], [0,3,6], [1,4,7], [2,5,8],
[0,4,8], [2,4,6]]


def initialize
@board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 
 end
 
 #empty array with nine blank spaces
#with ""

#using a constant - these do not change

#def WIN_COMBINATIONS #- this should be
#written above the methods


def display_board
print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
print "-----------\n"
print " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
print "-----------\n"
print " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
user_input.to_i-1
end

def move(index, piece) #- piece is the 
#choice x or o
@board[index] = piece
#this above line is the array position
end

def position_taken?(index) #- use the same
#we can use if else and also
@board[index] != " "
end

def valid_move?(index)
if index.between?(0,8) && !position_taken?(index) 
  true 
else 
  false
end
end

def turn_count
@board.count {|space| space != " "}
end

def current_player
  if turn_count.even?
    "X"
  else 
    "O"
  end
end

def turn
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else 
    turn
  end
    
end

def won?
 WIN_COMBINATIONS.each do |combo| 
   
    first_index = combo[0]
    second_index = combo[1]
    third_index = combo[2]
    first_position = @board[first_index]
    second_position = @board[second_index]
    third_position = @board[third_index]
    #binding.pry
    if first_position == second_position && first_position == third_position && first_position != " "
      return combo
    end
       end 
       false
      end
      
      def full?
  @board.all? {|index| index == "X" || index == "O"}
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
    return false
  end
end

def winner 
  
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