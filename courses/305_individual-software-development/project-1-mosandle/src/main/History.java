package main;
import java.util.Arrays;
import java.util.List;

public class History {
    /**
     *
     * @param controller takes in premade TUI object
     * @param letter given input by user
     * @param history all previous equations in a list
     * @param alphabet all uppercase letters in the alphabet
     * @return the selected equation, and its result as a string
     */
    public String findEq(TUI controller, String letter, List<String> history, String[] alphabet) {
        int number = Arrays.asList(alphabet).indexOf(letter);
        int index = history.size() - number - 1;
        return history.get(index) + " => " + controller.result(history.get(index));
    }//end of findEq
}//end of history