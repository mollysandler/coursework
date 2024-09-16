package calculator;

public class Modulo extends Operator {
    private static final String ZERO_MOD = "you can't divide by zero";

    public Modulo(Expression left, Expression right) {
        super(left, right);
    }

    /**
     *
     * @return the % symbol
     */
    @Override
    public String getSymbol() {
        return "%";
    }

    /**
     *
     * @return left % right
     */
    public double evaluate() {
        if (this.right.evaluate() == 0) {
            throw new ArithmeticException(ZERO_MOD) {};
        } else {
            return this.left.evaluate() % this.right.evaluate();
        }
    }
}