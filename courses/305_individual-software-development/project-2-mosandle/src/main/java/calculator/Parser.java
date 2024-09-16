package calculator;
import java.util.*;

public interface Parser {
    Expression makeTree(String[] split, Map<String, Double> environment);
    String toString(Expression root);
    boolean validate(String[] split, int operatorCount, int operandCount);

    /**
     *
     * @param s takes in string
     * @return t/f if input is one of the supported operators
     */
    default boolean validOperator(String s){
        return s.equals("+") || s.equals("-") || s.equals("*")
                || s.equals("/") || s.equals("%") || s.equals("^");
    }


}//end of parser class
