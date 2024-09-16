package main;
import java.util.Scanner;

public class Driver{
        /**
         * runs the main code - gets the user inputs, etc and acts as the UI
         */
    private static Player player1; //defines player one as a member of the player class
    private static Player player2;//defines player two as a member of the player class
    private static Board board; //creates the board
    private static boolean turn = true; //sets "turn" to true, meaning it is player ones turn
    private static int size;
    private static final int STRING_MOVE_LENGTH = 2; //final var saying each move is two inputs
     /**
      * string literals below for the rest of the TUI
      */
    private static final String PLAYER1_WELCOME = "Player 1 (x), please enter your name: ";
    private static final String PLAYER2_WELCOME = "Player 2 (o), please enter your name: ";
    private static final String BOARD_SIZE = "Please enter an integer for the size of the board: ";
    private static final String ERROR_MESSAGE_SIZE = "Please enter a single integer next time.";
    private static final String ERROR_MESSAGE_INPUT = "Please enter two integers separated by a space. Try again!";
    private static final String ERROR_MESSAGE_VALID = "Oops! This move is not a valid move! Try again!";
    private static final String ERROR_MAIN = "Something went wrong! Please try again!";
    private static final String WELCOME = "Welcome to Tic Tac Toe!";
    private static final String DRAW = "You've ended the game in a draw!";
    private static final String WIN = "You've won!";

    /**
     * @param args command line args
     */
    public static void main(String[] args) { //main driver code

        //calls get info to make the players
        boolean correct = getInfo();
        if(!correct){
            System.out.println(ERROR_MAIN);
            return;
        }
        //runs game while the amount of turns is less than the size of the board squared
        while(player1.getCount() + player2.getCount() < board.getSize() * board.getSize()){
            if(board.getState() == 1){ //if the state of the board is set to 1 which means win, game ends
                System.out.println(WIN);
                return;
            } else if(turn){ // plays player one if turn is true
                gameplay(player1);
                drawBoard();
            } else{ //plays player 2 if turn is false
                gameplay(player2);
                drawBoard();
            }
        }//end of gameplay while loop

        //otherwise is a draw
        System.out.println(DRAW);
        board.setState(0); //state of the board is 0 if it is a draw
    }//end of driver

    /**
     * @return boolean T/F based on success
     */
    public static boolean getInfo() { //getting game setup

        //gets player names and board size below
        Scanner scanner = new Scanner(System.in);
        System.out.println(WELCOME);
        System.out.print(PLAYER1_WELCOME);
        String play1 = scanner.nextLine();
        Driver.player1 = new Player(play1, 'x');
        System.out.print(PLAYER2_WELCOME);
        String play2 = scanner.nextLine();
        Driver.player2 = new Player(play2, 'o');
        System.out.print(BOARD_SIZE);
        String sizeGiven = scanner.nextLine();
        try { //checking if input is a single int for board size
            size = Integer.parseInt(sizeGiven);
        } catch (NumberFormatException e) {
            System.out.println(ERROR_MESSAGE_SIZE);
            return false;
        }
        //creates a new board of that size and draws the board
        Driver.board = new Board(size);
        drawBoard();
        return true;
    } //end of getInfo


    public static void drawBoard() {

        for (int k = 0; k <= size; k++) { //fully draws board
            for (int i = 0; i < size; i++) { //prints the board lines
                System.out.print("----");
            }
            System.out.println("-"); //printing last one
            if (k == size) { //making sure the columns skip the last row
                break;
            }
            for (int j = 0; j < size; j++) { //prints the box separators
                System.out.print("| ");
                if (board.getBoardCoords()[k][j] == '\0') {
                    System.out.print(" ");
                } else {
                    System.out.print(board.getBoardCoords()[k][j]);
                }
                System.out.print(" "); //prints a space at the end
            }
            System.out.println("|"); //printing last one

        }//end of loop that draws the board fully
    }//end of drawBoard

    /**
     * @returns void
     * @param player
     */
    public static void gameplay(Player player) { //getting and checking inputs

        int move1;
        int move2;
        //gets the players moves
        Scanner checker = new Scanner(System.in);
        System.out.print(player.getName() + " move: ");
        String line = checker.nextLine();
        String[] split = line.split(" "); //splitting up the move by the space to check input
        if (split.length == STRING_MOVE_LENGTH) { //if the length is 2
            try { //checking if both are ints
                move1 = Integer.parseInt(split[0]);
                move2 = Integer.parseInt(split[1]);
                //error if not, recall the turn
            } catch (NumberFormatException e) {
                System.out.println(ERROR_MESSAGE_INPUT);
                return;
            }
        } else{ //error if not two inputs given, recall the turn
            System.out.println(ERROR_MESSAGE_INPUT);
            return;
        }
        //error if the move is out of bounds, recall the turn
        if((!(board.moveHolder(move1, move2, player)))){
            System.out.println(ERROR_MESSAGE_VALID);
            return;
        }//end of move check validity

        //check if someone won the game, continue if they did not and end the game if they did
        boolean stopPlaying = board.checkWins(move1, player); //check if they win before incrementing
        if(!stopPlaying){
            player.setCount(player.getCount() + 1); //adding to the count of the players turn
            turn = !turn;
        }
    }//end of gameplay function

}//end of driver class