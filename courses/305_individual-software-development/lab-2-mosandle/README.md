# Lab 2 — Text-based Tic Tac Toe 

For this lab, you're going to build a text-based Tic-Tac-Toe (or "noughts and crosses") game.
You will build it as a text-based user interface (TUI).

The following output describes what the interaction of the game will look like.

## Game demonstration

The game begins by asking for the first player's name, which the example below has typed in: "Aakash"

```
Welcome to Tic Tac Toe!

Player 1 (0), enter your name: Aakash
```

Then the game asks for the second player's name.

```
Welcome to Tic Tac Toe!

Player 1 (0), enter your name: Aakash
Player 2 (X), enter your name: Alice
```

Finally, the game asks the users what size board they would like to play on.

```
Welcome to Tic Tac Toe!

Player 1 (0), enter your name: Aakash
Player 2 (X), enter your name: Alice
What size board do you want to play on? 3
```

The input of "3" above tells the game to prepare a 3x3 board. An input of 5 would result in a 5x5 board, and so on.

The game then proceeds as follows:

1. Aakash places a nought (0) on the bottom right position.

```
Game begins. For each turn, enter two numbers representing x and y coordinates for the move you would like to make.
-------------
| _ | _ | _ |
-------------
| _ | _ | _ |
-------------
| _ | _ | _ |
-------------

Aakash move: 2 2
-------------
| _ | _ | _ |
-------------
| _ | _ | _ |
-------------
| _ | _ | 0 |
-------------
```

Following this, Alice tries to place a cross (X) on the center position (1 1).
She hits enter after just one "1" by mistake, so the game prompts her for a move again.

```
Game begins. For each turn, enter two numbers representing x and y coordinates for the move you would like to make.
-------------
| _ | _ | _ |
-------------
| _ | _ | _ |
-------------
| _ | _ | _ |
-------------

Aakash move: 2 2
-------------
| _ | _ | _ |
-------------
| _ | _ | _ |
-------------
| _ | _ | 0 |
-------------

Alice move: 1
Please enter two integers separated by a space: 1 1
-------------
| _ | _ | _ |
-------------
| _ | X | _ |
-------------
| _ | _ | 0 |
-------------
```

The game proceeds like this, printing the current state of the board after each turn, until
one player wins or the game ends in a draw. The program terminates when the game is finished.

## Task overview 

Your task is to implement the game as described above.

The "starter code" for this lab is minimal. I have given you a `main` package with a `Driver` class in it,
which will serve as the entry point for your program. 
As a class, we will discuss possible designs for this during the lab session on the day this is assigned.
You have a number of components in this seemingly simple
text-based game. For example, the user interface, the game itself, the players in the game etc.

Obtain the starter code from the following GitHub classroom link: **LINK IN CANVAS**

You will make use of the clean code and software design practices we have talked about thus far.
This includes:

* Variables, methods, and types will be named meaningfully, following Java naming conventions (i.e., camelCase names).
* All SonarLint and IntelliJ warnings will be addressed.
* Other items that are not handled by SonarLint will also be addressed. For example, "magic numbers" or
 `String` literals should not be littered across your code base. If you must use a constant value, create a `static final`
 variable or an `enum` and use that instead.
* All public fields and methods will be accompanied by an informative Javadoc comment. `@param`, `@return`, and `@throws`
will be used in Javadocs appropriately.
* Concerns will be separated and decoupled from each other.
* There should be some evidence of automated software testing using JUnit.

### Other considerations

**Obtaining user input.** You can get input from the user using a [`Scanner`](https://docs.oracle.com/en/java/javase/19/docs/api/java.base/java/util/Scanner.html) object.
You can initialise a `Scanner` as follows to read user-provided input:

```java
Scanner scanner = new Scanner(System.in);
```

The `Scanner` API provides a number of useful methods that will let you grab user-typed input and process it as you see fit.
For example `scanner.nextLine()` will grab whatever the user typed before hitting the `enter` key.

**Checking if a game has concluded.**
When a player makes a move, you need to check whether that move has ended the game or not.
So if `X` makes a move, you need to check the following:

* if any _row_ in the board is filled with `X`s
* if any _column_ in the board is filled with `X`s
* if the _main diagonal_ is filled with `X`s
* if the _anti-diagonal_ is filled with `X`s

If you check the above after each move, you can simplify and quicken the first two checks by _only_ checking the row or column
in which the move was made, and you can _only_ do the last two checks if the move was made on the diagonal or anti-diagonal.

If any of the above conditions is true, the game is over and the player that played most recently is the victor.

If _none_ of the above conditions is true, and the maximum number of moves have been played (i.e., all positions are filled),
then the game ends in a draw.

**Separating concerns.**
Think about the different components in this program. What computations should each part handle? What functionality do some parts not need to know about?
For example, would your "board" abstraction need any knowledge of the fact that this is a text-based game and not a graphical user interface?

As we've talked about in class, design your solution with _longevity_ in mind. If requirements were changed or added, how difficult would it be
to incorporate them into your implementation? For example, consider the following (hypothetical) changes to requirements:

* Adding support for an "undo" function, where the player can undo their most recent move.
* Adding support to save the current game state to a file, and to reload game states from a file to pick up where we left off.
* Keeping track of a leaderboard of number of game victories.
* "Replayability", i.e., a game can be "rewatched" turn by turn.
* Turning this from a text-based game to a desktop application.

## Submission

As usual, submit your code by pushing to GitHub, and make sure to demonstrate your working solution to me during lab or office hours.
Like all labs, the primary method of grading will be through in-person demonstrations.