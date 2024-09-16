public abstract class BinaryExpression {

    private final Expression lft;
    private final Expression rht;
    private String op;

    public BinaryExpression(Expression lft, Expression rht, String op) {
        this.lft = lft;
        this.rht = rht;
        this.op = op;
    }

    public Expression getLFT(){
        return this.lft;
    }
    public Expression getRHT(){
        return this.rht;
    }
    public String getOp(){
        return this.op;
    }

    public String toString()
    {
        return "(" + lft + op + rht + ")";
    }

    public double evaluate(final Bindings bindings){
        double resultL = lft.evaluate(bindings);
        double resultR = rht.evaluate(bindings);
        return _applyOperator(resultL, resultR);
    }

    protected abstract double _applyOperator(double res1, double res2);


}//end of class
