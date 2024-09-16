package main;

public class Modulo extends Operator {
    private final Expression left;
    private final Expression right;

    public Modulo(Expression left, Expression right) {
        super(left, right);
        this.left = left;
        this.right = right;
    }

    /**
     *
     * @return left % right
     */
    public double evaluate() {
        if (this.right.evaluate() == 0) {
            throw new ArithmeticException() {
            };
        } else {
            return this.left.evaluate() % this.right.evaluate();
        }
    }
}