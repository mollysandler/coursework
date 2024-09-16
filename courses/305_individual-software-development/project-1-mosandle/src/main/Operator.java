package main;

public abstract class Operator implements Expression{
    private final Expression left;
    private final Expression right;

    protected Operator(Expression left, Expression right){
        this.left = left;
        this.right = right;
    }
}//end of operator class
