package tictactoe;

public class Player{
    /**
     *  player class holding their name, their symbol, and their move count
     */
    private final String name;
    private final char symbol;
    private int count;

    //constructor
    public Player(String name, char symbol){
        this.name = name;
        this.symbol = symbol;
    }

    //getters and setters
    public String getName(){
        return this.name;
    }

    public char getSymbol(){
        return this.symbol;
    }

    public int getCount(){
        return this.count;
    }
    public void setCount(int value){
        this.count = value;
    }
}//end of player class