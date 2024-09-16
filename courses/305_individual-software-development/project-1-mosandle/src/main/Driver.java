package main;
/**
 * A text-based calculator application.
 * @author Molly Sandler contact: mosandle@calpoly.edu
 */
public class Driver {
    private static final String NEW_EQUATION = "Please enter a new equation: ";
    private static final String ZERO_ERROR = "You can't divide by zero! Try again!";

    /**
     * Entry point for the program.
     * @param args Command-line inputs (unused in this project).
     */
    public static void main(String[] args) {
        TUI controller = new TUI();
        while (true) {
            String given = controller.getInput();
            if (given.equals("exit")) {
                break;
            }
            if (given.equals("history")) {
                controller.recall();
            } else {
                controller.setOperandCount(0);
                controller.setOperatorCount(0);
                double correct = controller.checkInput(given);
                if (correct == -1) {
                    System.out.println(NEW_EQUATION);
                } else if (correct == 1) {
                    try {
                        System.out.println("=> " + controller.result(given));
                    } catch (ArithmeticException e) {
                        System.out.println(ZERO_ERROR);
                    }
                }
            }
        }
    }//end of big while loop
}//end of main
