package main;

public class Times extends Operator {
    private final Expression left;
    private final Expression right;

    public Times(Expression left, Expression right) {
        super(left, right);
        this.left = left;
        this.right = right;
    }


    /**
     * @return value of left * right
     */
    public double evaluate() {
        return this.left.evaluate() * this.right.evaluate();
    }
}
