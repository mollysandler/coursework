package calculator;

public class Operand implements Expression{
    private final double value;

    /**
     * constuctor for Operands
     * @param value number value
     */
    public Operand(double value){
        this.value = value;
    }

    /**
     *
     * @return string of the value of the operand
     */
    public String toString(){
        return Double.toString(value);
    }

    /**
     *
     * @return double of the value of the operand
     */
    public double evaluate() {
        return this.value;
    }
}//end of operand class

