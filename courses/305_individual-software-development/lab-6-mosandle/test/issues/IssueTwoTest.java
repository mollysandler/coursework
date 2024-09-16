package issues;
import org.junit.jupiter.api.Test;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class IssueTwoTest {

    @Test
    void basicLabGuidanceTest() {
        IssueTwo issueTwo = new IssueTwo();
        List<String> strings = List.of("a", "b", "c");
//        TODO: Uncomment the line below and handle the syntax error that appears
        List<String> result = (List<String>) issueTwo.duplicate(strings);
        List<String> expected = List.of("a", "b", "c");

//        TODO: Uncomment this test
         assertAll(() -> assertEquals(result, expected),
        () -> assertTrue(true));
    }
}