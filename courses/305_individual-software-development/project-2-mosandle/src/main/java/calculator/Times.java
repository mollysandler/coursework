package calculator;
public class Times extends Operator {

    public Times(Expression left, Expression right) {
        super(left, right);
    }

    /**
     * return string of the symbol *
     */
    @Override
    public String getSymbol() {
        return "*";
    }

    /**
     * @return value of left * right
     */
    public double evaluate() {
        return this.left.evaluate() * this.right.evaluate();
    }
}