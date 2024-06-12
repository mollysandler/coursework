import main.BigNumberCalculator;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

public class newTets {

    class Testcases {

        @Test
        void testNull() {
            List<Integer> list = new ArrayList<>();
            list.add(4);
            assertNull(BigNumberCalculator.plus(null, list));
            assertNull(BigNumberCalculator.plus(list, null));
            assertNull(BigNumberCalculator.plus(null, null));

        }
        @Test
        void testResult() {
            List<Integer> list = new ArrayList<>();
            List<Integer> list2 = new ArrayList<>();
            List<Integer> list3 = new ArrayList<>();

            list.add(4);
            list2.add(3);
            list3.add(7);
            assertEquals(list3, (BigNumberCalculator.plus(list2, list)));

        }

    }//end of test class
}
