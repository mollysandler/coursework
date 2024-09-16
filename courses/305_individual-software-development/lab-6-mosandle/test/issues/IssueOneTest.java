package issues;
import org.junit.jupiter.api.Test;
import java.util.List;

import static org.assertj.core.api.Assertions.*;

class IssueOneTest {

    @Test
    void basicLabGuidanceTest() {
        IssueOne issueOne = new IssueOne();
        assertThat(issueOne.getItems()).isEqualTo(List.of("one", "two"));

    }
}