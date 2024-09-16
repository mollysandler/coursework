package calculator.project2calculatorgui;
import org.junit.jupiter.api.function.Executable;
import org.testng.annotations.Test;
import org.junit.jupiter.api.Assertions;
import java.util.HashMap;
import calculator.*;

import static org.junit.jupiter.api.Assertions.*;


public class TestCase {

    @Test
    public void addition() {
        String eq = "+ 6 5";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        Tree tree = new Tree(eq, prefix, environment);
        double answer = tree.doMath();
        Assertions.assertEquals(11, answer);

        String eq2 = "6 5 +";
        Parser postfix = new Postfix();
        Tree tree2 = new Tree(eq2, postfix, environment);
        double answer2 = tree2.doMath();
        Assertions.assertEquals(11, answer2);
    }

    @Test
    public void subtraction() {
        String eq = "- 6 5";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        Tree tree = new Tree(eq, prefix, environment);
        double answer = tree.doMath();
        Assertions.assertEquals(1, answer);

        String eq2 = "6 5 -";
        Parser postfix = new Postfix();
        Tree tree2 = new Tree(eq2, postfix, environment);
        double answer2 = tree2.doMath();
        Assertions.assertEquals(1, answer2);
    }

    @Test
    public void multiplication() {
        String eq = "* 6 5";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        Tree tree = new Tree(eq, prefix, environment);
        double answer = tree.doMath();
        Assertions.assertEquals(30, answer);

        String eq2 = "6 5 *";
        Parser postfix = new Postfix();
        Tree tree2 = new Tree(eq2, postfix, environment);
        double answer2 = tree2.doMath();
        Assertions.assertEquals(30, answer2);
    }

    @Test
    public void division() {
        String eq = "/ 10 5";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        Tree tree = new Tree(eq, prefix, environment);
        double answer = tree.doMath();
        Assertions.assertEquals(2, answer);

        String eq2 = "10 5 /";
        Parser postfix = new Postfix();
        Tree tree2 = new Tree(eq2, postfix, environment);
        double answer2 = tree2.doMath();
        Assertions.assertEquals(2, answer2);
    }

    @Test
    public void zeroDivision() {
        String eq = "/ 6 0";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        Tree tree = new Tree(eq, prefix, environment);
        assertThrows(ArithmeticException.class, tree::doMath);

        String eq2 = "10 0 /";
        Parser postfix = new Postfix();
        Tree tree2 = new Tree(eq2, postfix, environment);
        assertThrows(ArithmeticException.class, tree2::doMath);
    }

    @Test
    public void exponential() {
        String eq = "^ 10 1";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        Tree tree = new Tree(eq, prefix, environment);
        double answer = tree.doMath();
        Assertions.assertEquals(10, answer);

        String eq2 = "10 1 ^";
        Parser postfix = new Postfix();
        Tree tree2 = new Tree(eq2, postfix, environment);
        double answer2 = tree2.doMath();
        Assertions.assertEquals(10, answer2);
    }

    @Test
    public void Modulo() {
        String eq = "% 6 5";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        Tree tree = new Tree(eq, prefix, environment);
        double answer = tree.doMath();
        Assertions.assertEquals(1, answer);

        String eq2 = "6 5 %";
        Parser postfix = new Postfix();
        Tree tree2 = new Tree(eq2, postfix, environment);
        double answer2 = tree2.doMath();
        Assertions.assertEquals(1, answer2);
    }

    @Test
    public void zeroModulo() {
        String eq = "% 10 0";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        Tree tree = new Tree(eq, prefix, environment);
        assertThrows(ArithmeticException.class, tree::doMath);

        String eq2 = "10 0 %";
        Parser postfix = new Postfix();
        Tree tree2 = new Tree(eq2, postfix, environment);
        assertThrows(ArithmeticException.class, tree2::doMath);
    }

    @Test
    public void validSingle() {
        String[] eq = {"6"};
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        assertTrue(prefix.validate(eq, 0, 0));

        String[] eq2 = {"6"};
        Parser postfix = new Postfix();
        assertTrue(postfix.validate(eq2, 0, 0));
    }

    @Test
    public void testSpace() {
        String[] eq = {" "};
        Parser prefix = new Prefix();
        assertTrue(prefix.validate(eq, 0, 0));

        String[] eq2 = {" "};
        Parser postfix = new Postfix();
        assertTrue(postfix.validate(eq2, 0, 0));
    }

    @Test
    public void testGetSymbolDivision() {
        Operand o = new Operand(8);
        Operand o2 = new Operand(4);

        Divide d = new Divide(o, o2);
        String test = d.getSymbol();
        Assertions.assertEquals("/", test);
    }

    @Test
    public void testGetSymbolExponent() {
        Operand o = new Operand(8);
        Operand o2 = new Operand(4);

        Exponent d = new Exponent(o, o2);
        String test = d.getSymbol();
        Assertions.assertEquals("^", test);
    }

    @Test
    public void testGetSymbolMinus() {
        Operand o = new Operand(8);
        Operand o2 = new Operand(4);

        Minus d = new Minus(o, o2);
        String test = d.getSymbol();
        Assertions.assertEquals("-", test);
    }

    @Test
    public void testGetSymbolModulo() {
        Operand o = new Operand(8);
        Operand o2 = new Operand(4);

        Modulo d = new Modulo(o, o2);
        String test = d.getSymbol();
        Assertions.assertEquals("%", test);
    }

    @Test
    public void testGetSymbolTimes() {
        Operand o = new Operand(8);
        Operand o2 = new Operand(4);

        Times d = new Times(o, o2);
        String test = d.getSymbol();
        Assertions.assertEquals("*", test);
    }

    @Test
    public void testVariable() {
        String eq = "+ 10 Molly";
        final HashMap<String, Double> environment = new HashMap<>();
        environment.put("Molly", 10.0);
        Parser prefix = new Prefix();
        Tree tree = new Tree(eq, prefix, environment);
        double answer = tree.doMath();
        Assertions.assertEquals(20, answer);

        String eq2 = "10 Molly +";
        Parser postfix = new Postfix();
        Tree tree2 = new Tree(eq2, postfix, environment);
        double answer2 = tree2.doMath();
        Assertions.assertEquals(20, answer2);
    }

    @Test
    public void addVariable(){
        String eq = "+ 10 Molly";
        final HashMap<String, Double> environment = new HashMap<>();
        environment.put("Molly", 10.0);
        Parser prefix = new Prefix();
        Tree tree = new Tree(eq, prefix, environment);
    }

    @Test
    public void TestToString() {
        String eq = "+ 10 Molly";
        final HashMap<String, Double> environment = new HashMap<>();
        environment.put("Molly", 10.0);
        Parser prefix = new Prefix();
        Tree tree = new Tree(eq, prefix, environment);
        Assertions.assertEquals("+ 10.0 Molly", prefix.toString(tree.getRoot()));

        String eq2 = "10 Molly +";
        Parser postfix = new Postfix();
        Tree tree2 = new Tree(eq2, postfix, environment);
        Assertions.assertEquals("10.0 Molly +", postfix.toString(tree.getRoot()));
    }

    @Test
    public void testNotAVariable() {
        String eq = "+ 10 Molly";
        final HashMap<String, Double> environment = new HashMap<>();
        environment.put("Jill", 10.0);
        Parser prefix = new Prefix();
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq, prefix, environment);
        });

        String eq2 = "10 Molly +";
        Parser postfix = new Postfix();
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq2, postfix, environment);
        });
    }

    @Test
    public void testBadlyWrittenEquation() {
        String eq = "/ 10";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq, prefix, environment);
        });

        String eq2 = "10 /";
        Parser postfix = new Postfix();
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq2, postfix, environment);
        });
    }

    @Test
    public void infix(){
        String eq = "10 + 10";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq, prefix, environment);
        });

        String eq2 = "10 + 10";
        Parser postfix = new Postfix();
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq2, postfix, environment);
        });
    }

    @Test
    public void nullEquation(){
        String eq = " ";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq, prefix, environment);
        });

        String eq2 = " ";
        Parser postfix = new Postfix();
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq2, postfix, environment);
        });
    }

    @Test
    public void oneItemEquation(){
        String eq = "molly";
        final HashMap<String, Double> environment = new HashMap<>();
        Parser prefix = new Prefix();
        environment.put("molly", 10.0);
        assertDoesNotThrow(() -> {
            new Tree(eq, prefix, environment);
        });

        String eq2 = "molly";
        Parser postfix = new Postfix();
        assertDoesNotThrow(() -> {
            new Tree(eq2, postfix, environment);
        });
    }

    @Test
    public void notRealVariable(){
        String eq = "molly";
        final HashMap<String, Double> environment = new HashMap<>();
        environment.put("sandler", 10.0);
        Parser prefix = new Prefix();
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq, prefix, environment);
        });

        String eq2 = "molly";
        Parser postfix = new Postfix();
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq2, postfix, environment);
        });
    }

    @Test
    public void testWrongParser() {
        String eq = "+ 10 Molly";
        final HashMap<String, Double> environment = new HashMap<>();
        environment.put("Molly", 10.0);
        Parser prefix = new Prefix();
        Parser postfix = new Postfix();
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq, postfix, environment);
        });
        String eq2 = "10 Molly +";
        assertThrows(IllegalArgumentException.class, () -> {
            new Tree(eq2, prefix, environment);
        });    }


}//end of main class

