package calculator;

public class Minus extends Operator {

    public Minus(Expression left, Expression right) {
        super(left, right);
    }

    /**
     *
     * @return the - symbol
     */
    public String getSymbol(){
        return "-";
    }

    /**
     * @return value of left - right
     */
    @Override
    public double evaluate() {
        return this.left.evaluate() - this.right.evaluate();
    }
}

