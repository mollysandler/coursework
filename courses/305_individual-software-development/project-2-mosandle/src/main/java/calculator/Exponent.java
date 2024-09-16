package calculator;

public class Exponent extends Operator{

    public Exponent(Expression left, Expression right){
        super(left, right);
    }

    /**
     *
     * @return the ^ symbol
     */
    @Override
    public String getSymbol() {
        return "^";
    }

    /**
     *
     * @return left ^ right
     */
    public double evaluate() {
        return Math.pow(this.left.evaluate(), this.right.evaluate());
    }

}
