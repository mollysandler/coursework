package issues;
import java.util.List;
import java.util.ArrayList;

public class IssueThree {
    private final IssueThreeData data;
    public IssueThree(IssueThreeData data) {
        this.data = data;
    }

    public int count() {
        List<String> strings = new ArrayList<>(data.strings());

        strings.add("zoinks");
        strings.set(0, "nope");

        return strings.size();
    }
}