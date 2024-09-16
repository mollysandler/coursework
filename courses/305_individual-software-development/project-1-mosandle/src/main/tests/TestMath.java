package main.tests;
import main.*;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

public class TestMath {
    @Test
    public void addition() {
        String[] eq = {"+", "6", "5"};
        Tree tree = new Tree(eq);
        double answer = tree.doMath();
        assertEquals(11, answer);
    }
    @Test
    public void subtraction() {
        String[] eq = {"-", "6", "5"};
        Tree tree = new Tree(eq);
        double answer = tree.doMath();
        assertEquals(1, answer);
    }
    @Test
    public void multiplication() {
        String[] eq = {"*", "6", "5"};
        Tree tree = new Tree(eq);
        double answer = tree.doMath();
        assertEquals(30, answer);
    }
    @Test
    public void division() {
        String[] eq = {"/", "6", "5"};
        Tree tree = new Tree(eq);
        double answer = tree.doMath();
        assertEquals((1.2), answer);
    }

    @Test
    public void zeroDivision() {
        String[] eq = {"/", "6", "0"};
        Tree tree = new Tree(eq);
        assertThrows(ArithmeticException.class, tree::doMath);
    }
    @Test
    public void exponential() {
        String[] eq = {"^", "6", "5"};
        Tree tree = new Tree(eq);
        double answer = tree.doMath();
        assertEquals(7776, answer);
    }
    @Test
    public void Modulo() {
        String[] eq = {"%", "6", "5"};
        Tree tree = new Tree(eq);
        double answer = tree.doMath();
        assertEquals(1, answer);
    }
    @Test
    public void zeroModulo() {
        String[] eq = {"%", "6", "0"};
        Tree tree = new Tree(eq);
        assertThrows(ArithmeticException.class, tree::doMath);
    }
    @Test
    public void wrongLetter() {
        History history = new History();
        TUI controller = new TUI();
        String[] alphabet = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
        List<String> pastEqs = new ArrayList<>();
        pastEqs.add("+ 6 7");
        assertThrows(IndexOutOfBoundsException.class, () -> {
            history.findEq(controller, "G", pastEqs, alphabet) ;
            });
    }
    @Test
    public void rightLetter() {
        History history = new History();
        TUI controller = new TUI();
        String[] alphabet = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
        List<String> pastEqs = new ArrayList<>();
        pastEqs.add("+ 6 7");
        assertEquals("+ 6 7 => 13.0", history.findEq(controller, "A", pastEqs, alphabet));
    }
    @Test
    public void invalidPreEqStartWithNum() {
        String[] eq = {"6", "%", "5"};
        TUI controller = new TUI();
        assertFalse(controller.validExp(eq, 1, 2));
    }
    @Test
    public void invalidPreEqBalance() {
        String[] eq = {"6", "%", "5", "*"};
        TUI controller = new TUI();
        assertFalse(controller.validExp(eq, 2, 2));
    }

    @Test
    public void invalidSingle() {
        String[] eq = {"6"};
        TUI controller = new TUI();
        assertTrue(controller.validExp(eq, 0, 0));
    }

    @Test
    public void testCheckInputHistory() {
        String eq = "history";
        TUI controller = new TUI();
        assertEquals(1, controller.checkInput(eq));
    }
    @Test
    public void testCheckInputOperator() {
        String eq = "+";
        TUI controller = new TUI();
        assertEquals(1, controller.checkInput(eq));
    }

    @Test
    public void testCheckInputString() {
        String eq = "+ 6 g";
        TUI controller = new TUI();
        assertEquals(-1, controller.checkInput(eq));
    }

    @Test
    public void testNull() {
        String[] eq = {null};
        TUI controller = new TUI();
        assertTrue(controller.validExp(eq, 0, 0));
    }

    @Test
    public void testSpace() {
        String[] eq = {" "};
        TUI controller = new TUI();
        assertTrue(controller.validExp(eq, 0, 0));
    }

}//end of main class


