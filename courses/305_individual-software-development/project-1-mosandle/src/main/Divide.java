package main;

public class Divide extends Operator{
    private final Expression left;
    private final Expression right;

    //constructor
    public Divide(Expression left, Expression right){
        super(left, right);
        this.left = left;
        this.right = right;
    }
    /**
     *
     * @return value of left / right, unless 0
     * @throws ArithmeticException for 0 division
     */
    @Override
    public double evaluate() {
        if (this.right.evaluate() == 0) {
            throw new ArithmeticException() {};
        } else {
            return this.left.evaluate() / this.right.evaluate();
        }
    }
}//end of Divide
