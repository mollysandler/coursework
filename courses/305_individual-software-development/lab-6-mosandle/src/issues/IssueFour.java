package issues;
import java.util.List;

public class IssueFour {

    public String buildStringWithString(List<String> strings) {
        StringBuilder builder = new StringBuilder();
//
        for (String string : strings) {
            builder.append(String.format("string: %s%n", string));
        }

        return builder.toString();
    }
//
    public String buildStringWithNumber(List<? extends Number> integers) {
        StringBuilder builder = new StringBuilder();

        for (Number integer : integers) {
            builder.append(String.format("integer: %d%n", integer));
        }
//
        return builder.toString();
    }

}
