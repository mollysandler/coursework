package main;

public class Exponent extends Operator{
    private final Expression left;
    private final Expression right;

    public Exponent(Expression left, Expression right){
        super(left, right);
        this.left = left;
        this.right = right;
    }

    /**
     *
     * @return left ^ right
     */
    public double evaluate() {
            return Math.pow(this.left.evaluate(), this.right.evaluate());
        }

}