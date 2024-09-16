package issues;
import java.util.ArrayList;
import java.util.List;

public class IssueThreeData {
    private final List<String> strings;

    public IssueThreeData(List<String> strings) {
        this.strings = new ArrayList<>();
        this.strings.addAll(strings);
    }

    /* note that this return type raises the following issue from SonarLint.
       "It is highly recommended not to use wildcard types as return types.
       Because the type inference rules are fairly complex it is unlikely the
       user of that API will know how to use it correctly.

       Let's take the example of method returning a "List<? extends Animal>".
       Is it possible on this list to add a Dog, a Cat, ... we simply don't know.
       And neither does the compiler, which is why it will not allow such a direct
       use. The use of wildcard types should be limited to method parameters."

       I completely disagree with the statement that begins "[a]nd neither does
       the compiler". The compiler does the right thing. This issue is one of
       complexity, which is itself reasonable consideration for the recommendation.

       For this lab, leave this return type as is. Furthermore, consider what
       this type actually indicates.
     */
    public List<? extends String> strings() {
        return strings;
    }
}