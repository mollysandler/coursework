package calculator;
import java.util.*;

public class Postfix implements Parser{
    private static final String BAD_OP = "This is not a valid operator!";

    /**
     *
     * @param split String[] of the equation
     * @param environment map of equations
     * @return Expression tree
     */
    @Override
    public Expression makeTree(String[] split, Map<String, Double> environment) {
        double value;
        List<Expression> stack = new ArrayList<>();
        for (String item : split) {
            try { //if input is a number, make a new operand and add it to the stack
                value = Double.parseDouble(item);
                stack.add(new Operand(value));

            } catch (NumberFormatException e) {
                if (validOperator(item)) {
                    Expression left = stack.remove(stack.size() - 2);
                    Expression right = stack.remove(stack.size() - 1);
                    Expression combined = switch (item) {
                        case "+" -> new Plus(left, right);
                        case "-" -> new Minus(left, right);
                        case "*" -> new Times(left, right);
                        case "/" -> new Divide(left, right);
                        case "^" -> new Exponent(left, right);
                        case "%" -> new Modulo(left, right);
                        //the program will never reach this default in any
                        //scenario, so it is just throwing an error to satisfy the compiler and sonarLint
                        //this is also affecting my coverage for the Postfix class.
                        default -> throw new IllegalArgumentException(BAD_OP);
                    };
                    stack.add(combined);
                } else {
                    Variable itemName = new Variable(item, environment);
                    stack.add(itemName);
                }
            }
        }//end of for loop
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
            String s = split[split.length - 1];
            return validOperator(s);
        } else {
            return true;
        }
    }

    /**
     *
     * @param root takes in root node
     * @return a string of the equation inputted
     */
    @Override
    public String toString(Expression root) {
        System.out.println(root);
        if (root instanceof Operator newRoot) {
            return (toString(newRoot.left) + " " + toString(newRoot.right) + " " + newRoot.getSymbol());
        } else{
            return (root.toString());
        }
    }
}
