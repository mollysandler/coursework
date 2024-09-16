package main;

public class Minus extends Operator {
    private final Expression left;
    private final Expression right;

    public Minus(Expression left, Expression right) {
        super(left, right);
        this.left = left;
        this.right = right;
    }

    /**
     * @return value of left - right
     */
    @Override
    public double evaluate() {
        return this.left.evaluate() - this.right.evaluate();
    }
}
