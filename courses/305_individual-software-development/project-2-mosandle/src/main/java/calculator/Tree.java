package calculator;
import java.util.*;

public class Tree {

    private static final String BAD_INPUT = "You can't do math on this expression!";
    private final Expression root; //root node
    private final String[] split; //inputted equation split up
    private final Parser variableType; //prefix or postfix tree
    private final Map<String, Double> environment; //holding previous equations

    /**
     *
     * @param eq String of entered equation by user
     * @param variableType Parser type prefix or postfix selected by user
     * @param environment Map of variable name, variable value pair
     * @throws IllegalArgumentException if tree cannot be made
     */
    public Tree(String eq, Parser variableType, Map<String, Double> environment) {
        this.split = eq.split("\\s+"); //splitting up the move by input
        this.variableType = variableType;
        this.environment = environment;
        if(checkInput()) {
            try {
                this.root = variableType.makeTree(split, environment);
            } catch (IndexOutOfBoundsException e) {
                throw new IllegalArgumentException(BAD_INPUT);
            }
        } else{
            throw new IllegalArgumentException(BAD_INPUT);
        }
    }

    /**
     *
     * @return the root Expression
     */
    public Expression getRoot(){
        return this.root;
    }

    /**
     *
     * @param split String[] split up by whitespace
     * @param operatorCount number of operators in equation
     * @param operandCount number of operands in equation
     * @return boolean t/f if expression is valid or not
     */
    public boolean validExp(String[] split, int operatorCount, int operandCount) {
        if(!variableType.validate(split, operatorCount, operandCount)){
            return false;
        }
        if(split.length == 0){
            return false;
        }
        if(split.length == 1){
            try { //checking if the input can be made into a number
                Double.parseDouble(split[0]);
            } catch (NumberFormatException e) {
                if(!environment.containsKey(split[0])){
                    return false;
                }
            }
        }
        return operandCount == (operatorCount + 1);
    }

    /**
     *
     * @param s specific string character in expression
     * @return t/f if is in the operator list or not
     */
    protected boolean validOperator(String s){
        return s.equals("+") || s.equals("-") || s.equals("*")
                || s.equals("/") || s.equals("%") || s.equals("^");
    }

    /**
     *
     * @return t/f if expression is valid
     */
    public boolean checkInput(){
        int operatorCount = 0; //amount of operators per equation
        int operandCount = 0; //amount of operands per equation

        for (String s : split) {
            if (validOperator(s)) {
                operatorCount++;
                continue;
            }
            try { //checking if both are ints
                Double.parseDouble(s);
                operandCount++;
            } catch (NumberFormatException e) {
                if(!environment.containsKey(s)) {
                    return false;
                }
                operandCount++;
            }
        }//end of for loop

        //checking if correct amount of operators and operands
        return validExp(split, operatorCount, operandCount);
    }//end of checkInput

    /**
     *
     * @return the sum of the tree
     */
    public double doMath() { //calls and returns evaluate on the root node
        return this.root.evaluate();
    }
}//end of tree class