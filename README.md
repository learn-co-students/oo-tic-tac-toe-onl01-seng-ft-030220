share when ever# OO Tic Tac Toe

## Objectives

1. Build a CLI Tic Tac Toe game!
2. Encapsulate Tic Tac Toe in a `TicTacToe` object.

## Overview

You're going to be building a 2 player CLI version of Tic Tac Toe by building a
`TicTacToe` object. The game play will be very similar to other versions of
TicTacToe.

<iframe width="100%" height="100%" src="https://www.youtube.com/embed/e4TMZ0f6qoI" frameborder="0" allowfullscreen></iframe>

## Instructions

In order to get everything working you should refer to these instructions as you
go *and* pay close attention to the test output.

**Run `bundle` within this lab's directory before getting started.**

### Project Structure

```bash 
├── Gemfile
├── Gemfile.lock
├── README.md
├── bin
│   └── tictactoe
├── lib
│   └── tic_tac_toe.rb
└── spec
    ├── 01_tic_tac_toe_spec.rb
    ├── 02_play_spec.rb
    ├── 03_cli_spec.rb
    └── spec_helper.rb
```

#### Gemfile

These files set up some tools and gems for our project and can mostly be
ignored. Make sure to run `bundle` before starting this project so that you have
all the required gems.

#### `bin/tictactoe`

This is our main executable and will be how we initialize and start our game.

#### `lib/tic_tac_toe.rb`

Our main `TicTacToe` class will be defined here with all the data and logic
required to play a game of tic tac toe via instances of `TicTacToe`.

#### `spec`

There are three test files that should be completed in order.
`01_tic_tac_toe_spec.rb` tests our helper methods within `TicTacToe`.
`02_play_spec.rb` tests the main `#play` method. `03_cli_spec.rb` tests the CLI.

### Your Object-Oriented Tic Tac Toe

We're going to be building a very well encapsulated object for Tic Tac Toe where
each instance method will represent a discrete, single responsibility or
functionality of a Tic Tac Toe game.

We'll be following the Tic Tac Toe conventions of representing the board as an
array with 9 elements where `" "` represents an empty cell in the board.

We'll be getting user input via `gets` and a player will choose a position by
entering 1-9. Our program will then fill the appropriate position on the board
with the player's token.

We will keep track of which player's turn it is and how many turns have been
played. We will check to see, at every turn, if there is a winner. If there is a
winner, we'll congratulate them. If there is a tie, we will inform our players.

## The Logic: `lib/tictactoe.rb`

### `TicTacToe` class

Open up `lib/tic_tac_toe.rb`. You'll be defining the main game class,
`TicTacToe` in `lib/tic_tac_toe.rb`. Until the `TicTacToe` class is defined,
everything will break.

Every method you build will be encapsulated by this class.

### `#initialize` and `@board`

The first test in `01_tic_tac_toe_spec.rb` will ensure the requirement that when
a new game of Tic Tac Toe is started — that is, when a new instance of
`TicTacToe` is initialized — the instance of the game must set the starting
state of the board, an array with 9 empty strings `" "`, within an instance
variable named `@board`.

In other words, your `#initialize` method should set a `@board` variable equal
to a new, empty array that represents the game board.

#### `WIN_COMBINATIONS`

Define a `WIN_COMBINATIONS` constant within the `TicTacToe` class, and set it
equal to a nested array filled with the index values for the eight winning
combinations possible in Tic Tac Toe.

**Top-Tip:** When you see this line, `TicTacToe::WIN_COMBINATIONS`, in the test
suite, that means the test suite is accessing the constant `WIN_COMBINATIONS`
that was declared inside the `TicTacToe` class.

```ruby
# within the body of TicTacToe

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5]  # Middle row
  # et cetera, creating a nested array for each win combination
]

# the rest of the TicTacToe class definition
```

### Helper Methods

The next bunch of methods we will be describing are helper methods - methods
that will be called by other methods in your code. This keeps our code [DRY] and
well encapsulated &mdash; each method has a single responsibility &mdash; which
makes the code easier to maintain and expand.

[DRY]: https://en.wikipedia.org/wiki/Don%27t_repeat_yourself

#### `#display_board`

Define a method that prints the current board representation based on the
`@board` instance variable.

#### `#input_to_index`

Define a method into which we can pass user input (in the form of a string,
e.g., `"1"`, `"5"`, etc.) and have it return to us the corresponding index of
the `@board` array. Remember that, from the player's point of view, the board
contains spaces 1-9. But the indices in an array start their count at 0. If the
user inputs `5`, your method must correctly translate that from the player's
perspective to the array's perspective &mdash; accounting for the fact that
`@board[5]` is *not* where the user intended to place their token.

#### `#move`

Your `#move` method must take in two arguments: the index in the `@board` array
that the player chooses and the player's token (either `"X"` or `"O"`). The
second argument, the player's token, should default to `"X"`.

#### `#position_taken?`

The `#position_taken?` method will be responsible for evaluating the user's
desired move against the Tic Tac Toe board and checking to see whether or not
that position is already occupied. Note that this method will be running *after*
`#input_to_index`, so it will be checking index values. When it is passed the
index value for a prospective move, `#position_taken?` will check to see if that
position on the `@board` is vacant or if it contains an `"X"` or an `"O"`. If
the position is free, the method should return `false` (i.e., "the position is
not taken"); otherwise, it will return `true`.

#### `#valid_move?`

Build a method `valid_move?` that accepts a position to check and returns `true`
if the move is valid and `false` or `nil` if not. A valid move means that the
submitted position is:

1. Present on the game board.
2. Not already filled with a token.

#### `#turn_count`

This method returns the number of turns that have been played based on the
`@board` variable.

#### `#current_player`

The `#current_player` method should use the `#turn_count` method to determine if
it is `"X"`'s or `"O"`'s turn.

#### `#turn`

Build a method `#turn` to encapsulate the logic of a single complete turn
composed of the following routine:

1. Ask the user for their move by specifying a position between 1-9.
2. Receive the user's input.
3. Translate that input into an index value.
4. If the move is valid, make the move and display the board.
5. If the move is invalid, ask for a new move until a valid move is received.

**Note**: If the user enters an invalid move, we need to repeat the entire
sequence of events listed above: asking for input, translating it into an index,
checking whether the move is valid and, if it is, making the move.
Theoretically, we could code all that into our `else` but that would definitely
violate DRY principles. And what if the user enters an invalid move a second or
third or tenth time? What we really need to do is *restart* the `turn` method
each time an invalid move is entered. Luckily, Ruby (and many other programming
languages) allows us to call a method from inside itself. This process of
calling a method from inside itself is commonly used in [recursion].

[recursion]: https://en.wikipedia.org/wiki/Recursion_(computer_science)

All these procedures will be wrapped into our `#turn` method, but the majority
of the logic for these procedures will be defined and encapsulated in our helper
methods. You will need to call those methods from inside the `turn` method to
get the tests passing. Pay close attention to the sequence of events and when
and where the helper methods should be called. If there are redundancies in your
code the tests may not pass.

**Hint**: don't forget to pay attention to which argument(s) each of your helper
methods requires.

You can imagine the pseudocode for the `#turn` method:

```
ask for input
get input
translate input into index
if index is valid
  make the move for index
  show the board
else
  restart turn
end
```

#### `#won?`

Your `#won?` method should return `false` or `nil` if there is no win
combination present in the board and return an array containing the winning
combination indexes if there is a win. Use your `WIN_COMBINATIONS` constant in
this method.

#### `#full?`

The `#full?` method should return `true` if every element in the board contains
either an "X" or an "O".

#### `#draw?`

Build a method `#draw?` that returns `true` if the board is full and has not
been won and `false` otherwise.

#### `#over?`

Build a method `#over?` that returns `true` if the board has been won or is full
(i.e., is a draw).

#### `#winner`

Given a winning `@board`, the `#winner` method should return the token, `"X"` or
`"O"`, that has won the game.

### Putting it all together: the `#play` method

#### `#play`

The play method is the main method of the Tic Tac Toe application and is
responsible for the game loop. A Tic Tac Toe game must allow players to take
turns, checking if the game is over after every turn. At the conclusion of the
game, whether because it was won or ended in a draw, the game should report to
the user the outcome of the game. You can imagine the pseudocode:

```
until the game is over
  take turns
end

if the game was won
  congratulate the winner
else if the game was a draw
  tell the players it ended in a draw
end
```

Here again, much of the functionality you need is built into our helper methods
&mdash; don't forget to use them!

Run the tests for the `#play` method by typing `rspec spec/02_play_spec.rb` in
your terminal.

## The CLI: `bin/tictactoe`

Your `bin/tictactoe` CLI should:

1. Instantiate an instance of `TicTacToe`
2. Start the game by calling `#play` on that instance.

Run the tests by typing `rspec spec/03_cli_spec.rb` in your terminal.
