package calculator;
import java.util.ArrayList;
import java.util.*;

public class Prefix implements Parser {
    private static final String BAD_OP = "This is not a valid operator!";

    /**
     *
     * @param split String[] of the equation
     * @param environment map of equations
     * @return Expression tree
     */
    @Override
    public Expression makeTree(String[] split, Map<String, Double> environment) { //gets the next node with DFS
        double value;
        List<Expression> stack = new ArrayList<>();
        for (int i = split.length - 1; i >= 0; i--) {
            try { //checking if the input can be made into a number
                value = Double.parseDouble(split[i]);
                stack.add(new Operand(value));
            } catch (NumberFormatException e) {
                if (validOperator(split[i])) {
                    Expression left = stack.remove(stack.size() - 1);
                    Expression right = stack.remove(stack.size() - 1);
                    Expression combined = switch (split[i]) {
                        case "+" -> new Plus(left, right);
                        case "-" -> new Minus(left, right);
                        case "*" -> new Times(left, right);
                        case "/" -> new Divide(left, right);
                        case "^" -> new Exponent(left, right);
                        case "%" -> new Modulo(left, right);
                        //the program will never reach this default in any
                        //scenario, so it is just returning a random value to satisfy the compiler and sonarLint
                        //this is also affecting my coverage for the Prefix class.
                        default -> throw new IllegalArgumentException(BAD_OP);
                    }; //end of switch statement
                    stack.add(combined);
                } else{
                    Variable itemName = new Variable(split[i], environment);
                    stack.add(itemName);
                }
            }
        }
        return stack.remove(0);
    }

    /**
     *
     * @param split String[]
     * @param operatorCount number of operators
     * @param operandCount number of operands
     * @return t/f depending on if the equation is valid or not
     */
    @Override
    public boolean validate(String[] split, int operatorCount, int operandCount) {
        if(split.length > 1) {
            String s = split[0];
            return validOperator(s);
        } else return true;
    }

    /**
     *
     * @param root takes in root node
     * @return a string of the equation inputted
     */
    public String toString(Expression root) {
        if (root instanceof Operator newRoot) {
            return (newRoot.getSymbol() + " " + toString(newRoot.left) + " " + toString(newRoot.right));
        } else{
            return (root.toString());
        }
    }
}
