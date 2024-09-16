package main;

public class Operand implements Expression{
    private final double value;

    /**
     * constuctor for Operand
     * @param value number value
     */
    public Operand(double value){
        this.value = value;
    }

    public double evaluate() {
        return this.value;
    }
}//end of operand class
