package calculator;

public class Plus extends Operator {

    public Plus(Expression left, Expression right) {
        super(left, right);
    }

    @Override
    public String getSymbol() {
        return "+";
    }

    /**
     *
     * @return left + right
     */
    public double evaluate() {
        return this.left.evaluate() + this.right.evaluate();
    }
}
