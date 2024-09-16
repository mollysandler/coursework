package calculator;

public class Divide extends Operator{
    private static final String ZERO_DIV = "you can't divide by zero!";

    //constructor using super class
    public Divide(Expression left, Expression right){
        super(left, right);
    }
    /**
     *
     * @return value of left / right, unless 0
     * @throws ArithmeticException for 0 division
     */
    @Override
    public double evaluate() {
        if (this.right.evaluate() == 0) {
            throw new ArithmeticException(ZERO_DIV) {};
        } else {
            return this.left.evaluate() / this.right.evaluate();
        }
    }

    /**
     *
     * @return string of division
     */
    public String getSymbol(){
        return "/";
    }

}//end of Divide
