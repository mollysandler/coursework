package issues;

import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class IssueFourTest {

    @Test
    void basicLabGuidanceTestString() {
        IssueFour issueFour = new IssueFour();
        String expected = "string: hello\nstring: goodbye\n";

        String actual = issueFour.buildStringWithString(List.of("hello", "goodbye"));
        assertEquals(expected, actual);
    }

    @Test
    void basicLabGuidanceTestInteger() {
        IssueFour issueFour = new IssueFour();
        String expected = "integer: 7\ninteger: 4\n";

//        TODO: Uncomment the lines below and handle the compiler erorr.
        String actual = issueFour.buildStringWithNumber(List.of(7, 4));
        assertEquals(expected, actual);
    }


}