package issues;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class IssueThreeTest {

    @Test
    void basicLabGuidanceTest() {
        IssueThreeData data = new IssueThreeData(List.of("one", "two", "three"));
        IssueThree issueThree = new IssueThree(data);

        assertEquals(4, issueThree.count());
    }
}