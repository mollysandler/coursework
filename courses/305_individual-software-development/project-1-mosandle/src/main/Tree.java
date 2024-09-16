package main;

public class Tree {
    private final Expression root; //root node
    private final String[] split; //inputted equation split up
    private int index;

    /**
     * Tree constructor
     * @param split list of strings of user input
     */
    public Tree(String[] split) {
        this.split = split;
        this.index = 0;
        this.root = getNext();
    }

    /**
     * *
     *
     * @return expression corresponding objects
     */
    public Expression getNext () { //gets the next node with DFS
        double value;
        try { //checking if the input can be made into a number
            value = Double.parseDouble(split[index]);
            index++;
            return new Operand(value);
        } catch (NumberFormatException e) {
            String operator = split[index];
            index++;
            return switch (operator) {
                case "+" -> new Plus(getNext(), getNext());
                case "-" -> new Minus(getNext(), getNext());
                case "*" -> new Times(getNext(), getNext());
                case "/" -> new Divide(getNext(), getNext());
                case "^" -> new Exponent(getNext(), getNext());
                case "%" -> new Modulo(getNext(), getNext());

                //this is not good code and i know that - the program will never reach this default in any
                // scenario, so it is just returning a random value to satisfy the compiler and sonarLint
                //this is also affecting my coverage for the Tree class.
                default -> null;
            };
        }
    }//end of getNext

    /**
     *
     * @return the sum of the tree
     */
    public double doMath() { //calls and returns evaluate on the root node
            return this.root.evaluate();
    }
}//end of tree class
