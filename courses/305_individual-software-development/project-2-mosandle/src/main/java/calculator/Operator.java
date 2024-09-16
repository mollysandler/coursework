package calculator;

public abstract class Operator implements Expression{
    protected Expression left;
    protected Expression right;


    /**
     * constructor for operators
     * @param left Expression on the left
     * @param right Expression on the right
     */
    protected Operator(Expression left, Expression right){
        this.left = left;
        this.right = right;
    }

    /**
     *
     * @return string of the symbol
     */
    public abstract String getSymbol();


}//end of operator class
