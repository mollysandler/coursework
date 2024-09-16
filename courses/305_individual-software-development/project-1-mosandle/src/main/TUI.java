package main;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;


public class TUI {
    private static final List<String> history = new ArrayList<>(); //holds previous equations
    private int operatorCount = 0; //amount of operators per equation
    private int operandCount = 0; //amount of operands per equation
    String[] alphabet = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};

    //setter to reset count to 0 every time
    public void setOperandCount(int operand) {
        this.operandCount = operand;
    }
    //setter to reset count to 0 every time
    public void setOperatorCount(int operator){
        operatorCount = operator;
    }

    /**
     *
     * @return String input given by user
     */
    public String getInput(){
        System.out.print("> ");
        Scanner scanner = new Scanner(System.in);
        return scanner.nextLine();
    }//end of getInput

    /**
     * @param eq String
     * @return boolean based on success
     */
    public int checkInput(String eq){
        String[] split = eq.split(" "); //splitting up the move by input
        if(eq.equals("history")){
            return 1;
        }
        for (String s : split) {
            boolean b = s.equals("+") || s.equals("-") || s.equals("*")
                    || s.equals("/") || s.equals("%") || s.equals("^");
            if(!b){
                try { //checking if both are ints
                    Double.parseDouble(s);
                    operandCount++;
                } catch (NumberFormatException e) {
                    if(helper(s, eq)){
                        return 0;
                    }
                    System.out.println("Invalid expression entered: " + s);
                    return -1;
                }
            }//end of if statement
        if(b) { operatorCount++; }
        }//end of for loop
        if(!validExp(split, operatorCount, operandCount)){ //checking if correct amount of operators and operands
            return -1;
        }
        return 1;
    }//end of checkInput

    /**
     *
     * @param operatorCount number of operators in equation
     * @param operandCount number of operands in equation
     * @return true or false depending on if it's a correct equation
     */
    public boolean validExp(String[] split, int operatorCount, int operandCount) {
        if(split.length == 0){
            return false;
        }
        if(split.length == 1){
            return true;
        }
        String s = split[0];
        boolean b = s.equals("+") || s.equals("-") || s.equals("*")
                || s.equals("/") || s.equals("%") || s.equals("^");
        if (b) {
            return operandCount == (operatorCount + 1);
        }
        return false;
    }

    /**
     * Used to reduce Cognitive Complexity of CheckInput
     * @param s current string we are using
     * @param eq total equation inputted
     * @return true or false depending on if letter is in history
     */
    private boolean helper(String s, String eq){
        if (Arrays.stream(alphabet).noneMatch(a -> a.equals(s))) {
            return false;
        }
        History recents = new History();
        try{
            String accurate = recents.findEq(this, eq, history, alphabet);
            System.out.println(accurate);
        } catch (IndexOutOfBoundsException e){
            System.out.println("This is not a valid letter! Please try again!");
        }
        return true;
    }

    /**
     *
     * @param eq inputted equation
     * @return the final result of the equation
     */
    public double result(String eq){
        String[] split = eq.split(" "); //splitting up the move by input
        Tree tree = new Tree(split); //splitting up the move by input
        if(history.size() == 26){
            history.remove(25);
        }
        history.add(eq);
        return tree.doMath();
    }//end of result

    public void recall() {
        for (int i = 0; i < history.size(); i++) {
            int value = 'A' + i;
            char label = (char) value;
            System.out.println(label + ". " + (history.get(history.size() - 1 - i)));
        }
    }

}//end of tui class
