package partA;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.util.*;
import java.util.function.*;

@SuppressWarnings("java:S5960") // Ignoring SonarLint complaints about not being in a test package
public class LambdaTests {

    /**
     * Applies the given function to each item in the given list,
     * and returns a list containing the mapped items.
     *
     * @param list The input list
     * @param func The mapping function
     * @return A list containing the mapped items.
     * @param <T> The type of item in the list and the input type of the function
     * @param <U> The output type of the function (can be the same or different as the input type)
     */
    public static <T, U> List<U> mapIt(List<T> list, Function<T, U> func) {
        List<U> resultList = new ArrayList<>();
        for (T current : list) {
            resultList.add(func.apply(current));
        }
        return resultList;
    }

    /**
     * Tests each item in the given list with the given predicate,
     * and returns a list containing only the items that satisfy the
     * predicate.
     *
     * @param list The input list
     * @param pred The predicate that tests each item
     * @return A list containing the items that satisfy the predicate
     * @param <T> The type parameter of the list and the input type to the predicate
     */
    public static <T> List<T> filterIt(List<T> list, Predicate<T> pred) {
        List<T> resultList = new ArrayList<>();
        for (T current : list) {
            if (pred.test(current)) {
                resultList.add(current);
            }
        }

        return resultList;
    }

    /**
     * Applies the specified accumulation function repeatedly to reduce or "fold" the given list
     * into a single value. The reducer takes two inputs and reduces them into one output.
     * <br>
     * At each iteration, the reducer is applied to two values: the current accumulated result
     * and the "next" value in the list. The accumulator value is updated with the result of each
     * reducer application, and finally the accumulated result is returned.
     *
     * @param list The list to reduce
     * @param reducer The reducer or accumulation function
     * @return An Optional containing the accumulated result, or an empty Optional if the input list was empty
     * @param <T> The type parameter of the list and of the accumulator function
     */
    /*
    Note that the method signature gives you a SonarLint warning. Examine the warning and its (quite detailed)
    description, understand it, and then take the IDE's suggestion to change the BiFunction<T, T, T> into a
    BinaryOperator<T>.
     */
    public static <T> Optional<T> reduceIt(List<T> list, BinaryOperator<T> reducer) {
        if (list.isEmpty()){
            return Optional.empty();
        }
        // Copy the list so we don't mutate it.
        List<T> copy = new ArrayList<>(list);
        T accumulator = copy.remove(0);
        for (T current : copy) {
            accumulator = reducer.apply(accumulator, current);
        }

        return Optional.of(accumulator);
    }


    @Test
    public void testSquareAllItems() { //passes
        List<Integer> input = List.of(12, 5, 2, 35, 1, 6);
        List<Integer> expected = List.of(144, 25, 4, 1225, 1, 36);

        UnaryOperator<Integer> mapper = number -> number * number;
        assertEquals(expected, mapIt(input, mapper));
    }

    @Test
    public void testMapToLengths() { //passes
        List<String> input = List.of("CSC", "305", "Individual", "Software", "Design", "and", "Development");
        List<Integer> expected = List.of(3, 3, 10, 8, 6, 3, 11);
        Function<String, Integer> mapper = String::length;

        assertEquals(expected, mapIt(input, mapper));
    }

    @Test
    public void testFilterEvenLengthStrings() { //passes
        List<String> input = List.of("CSC", "305", "Individual", "Software", "Design", "and", "Development");
        List<String> expected = List.of("Individual", "Software", "Design");
        Predicate<String> filter = s -> s.length() % 2 == 0;

        assertEquals(expected, filterIt(input, filter));
    }

    @Test
    public void testFindSum() { //passes
        List<Integer> input = List.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        OptionalInt expected = OptionalInt.of(55);
        BinaryOperator<Integer> reduce = Integer::sum;

        assertEquals(expected.getAsInt(), reduceIt(input, reduce).get());
    }

    @Test
    public void testFindMin() { //passes
        List<Integer> input = List.of(9, 8, 23, 54, 0, -123, 5, 34);
        OptionalInt expected = OptionalInt.of(-123);

        BinaryOperator<Integer> reduce = Integer::min;
        assertEquals(expected.getAsInt(), reduceIt(input, reduce).get());

    }

    /**
     * A simple Person class containing a name, age, and a boolean indicating if they are a resident.
     * @param name
     * @param age
     * @param isResident
     */
    private record Person(String name, int age, boolean isResident) {}

    @Test
    public void testEligibleToVote() { //passes
        List<Person> people = List.of(
                new Person("Aakash", 29, true),
                new Person("Beth", 22, false),
                new Person("Jin", 17, true),
                new Person("Mordechai", 30, true)
        );

        // A Person is considered eligible to vote when they are 18 years or older AND are Residents.
        Optional<Boolean> allCanVote =
                reduceIt(mapIt(people, person -> person.age() >= 18 && person.isResident()), (a, b) -> a && b);
        assertFalse(allCanVote.orElse(false));

        Optional<Boolean> anyCanVote =
                reduceIt(mapIt(people, person -> person.age() >= 18 && person.isResident()), (a, b) -> a || b);
        assertTrue(anyCanVote.orElse(false));
    }

}