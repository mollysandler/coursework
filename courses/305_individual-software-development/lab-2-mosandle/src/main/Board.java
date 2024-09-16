package main;

public class Board {
    /**
     * holds the board size, draws the board, holds the state of the board
     */
    private final int size;
    private char[][] boardCoords;
    private int state; //whether it is a win (1) or draw(0)

    //board constructor just takes the size, and initializes the boardcoords
    public Board(int size) {
        this.size = size;
        this.boardCoords = new char[size][size];
    }

    //getters and setters
    public int getSize() {
        return this.size;
    }

    public char[][] getBoardCoords(){
        return this.boardCoords;
    }

    public void setBoardCoords(char[][] boardCoords){
        this.boardCoords = boardCoords;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getState() {
        return this.state;
    }

    /**
     * @return boolean T/F based on if the move is valid or not
     * @param x coord, y coord, current player
     */
    public boolean moveHolder(int x, int y, Player current) { //track the moves in here

        if (x > size || y > size || x < 1 || y < 1) { //if out of bounds
            return false;
        }
        if (boardCoords[y - 1][x - 1] != '\0') { //if spot is full
            return false;
        }
        boardCoords[y - 1][x - 1] = current.getSymbol(); //if spot is empty, fill it with the current symbol
        return true; //return true
    }//end of moveHolder

    /**
     * @returns boolean T/F based on if there is a win or not
     * @param current player
     */
    public boolean checkWins(int x, Player current) { //checking if someone has won

        boolean rowYes = false;
        for(char[] rowItem : boardCoords){ //checks the rows by checking if all of one inner array is the same symbol
            rowYes = checkRow(rowItem, current);
        }
        boolean colYes = checkCol(x, current);
        boolean diaYes = checkDiag(current);
        boolean antiYes = checkAnti(current);

        //if the row is not a win, checks the columns
        return rowYes || colYes || diaYes || antiYes; //returns true if win, false if not a win
    }//end of checkwins

    /**
     * @returns boolean T/F based on if there is a win or not
     * @param char[], current player
     */
    public boolean checkRow(char[] row, Player current){ //row checker

        for(char item : row){
            if(item != current.getSymbol()){ //if the given x value has all the same in the y values
                return false;
                }
            if(row[0] != current.getSymbol()){
                return false;
            }
        }
        state = 1;
        return true;
    }//end of checkRow

    /**
     * @return boolean T/F based on if there is a win or not
     * @param current player
     */
    public boolean checkCol(int x, Player current){ //column checker

        for(int i = 0; i < size; i++){
            if(boardCoords[i][x-1] != current.getSymbol()){ //if the given y value has all the same in the x values
                return false;
            }
        }
        state = 1;
        return true;
    }//end of checkCol

    /**
     * @return boolean T/F based on if there is a win or not
     * @param current player
     */
    public boolean checkDiag(Player current){ //diagonal checker

        for(int i = 0; i < size; i++){
            if(boardCoords[i][i] != current.getSymbol()){ //diagonal if the x and y are the same
                return false;
            }
        }
        state = 1;
        return true;
    }//end of checkDiag

        /**
         * @return boolean T/F based on if there is a win or not
         * @param current player
         */
    public boolean checkAnti(Player current){//antidiagonal checker

        for(int i = 0; i < size; i++){
            if(boardCoords[i][size - 1 - i] != current.getSymbol()){ //anti if the x + y = size
                return false;
            }
        }
        state = 1;
        return true;
    }//end of checkAnti

}//end of board class

