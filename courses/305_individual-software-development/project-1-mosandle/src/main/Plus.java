package main;

public class Plus extends Operator {
    private final Expression left;
    private final Expression right;

    public Plus(Expression left, Expression right) {
        super(left, right);
        this.left = left;
        this.right = right;
    }

    /**
     *
     * @return left + right
     */
    public double evaluate() {
        return this.left.evaluate() + this.right.evaluate();
    }
}