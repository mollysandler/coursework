import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class DataManager  {

    public static boolean checkData(String key, Object[] values) {

        if (!checkName(key) || !checkValues(values)) {
            return false;
        }

        if (values.length == 5) {
            if (!checkName((String) values[4])) {
                return false;
            }
        }

        return true;
    }

    public static boolean checkName(String key) {
        // Check if the string is a non-empty value
        return key != null && !key.isEmpty();
    }

    public static boolean checkValues(Object[] values) {
        // Check if the value for the key is an integer array of length 5
        if (values == null || !(values.length == 5 || values.length == 4)) {
            return false;
        }

        // Check if all the values in the array are non-negative
        for (int i = 0; i < 4; i++) {
            if ((int) values[i] < 0) {
                return false;
            }
        }
        return true;
    }

    public static ArrayList<FileClass> convertData(ArrayList<HashMap<String, Object[]>> array) {
        ArrayList<FileClass> result = new ArrayList<>();
        for (HashMap<String, Object[]> map : array) {
            for (Map.Entry<String, Object[]> entry : map.entrySet()) {
                String key = entry.getKey();
                Object[] values = entry.getValue();

                if (DataManager.checkData(key, values)) {
                    if (values.length == 5) {
                        FileClass fInfo = new FileClass(key, (int) values[0], (int) values[1], (int) values[2], (int) values[3], (String) values[4]);
                        result.add(fInfo);
                    }
                    else if (values.length == 4) {
                        FileClass fInfo = new FileClass(key, (int) values[0], (int) values[1], (int) values[2], (int) values[3]);
                        result.add(fInfo);
                    }
                }
            }
        }
        return result;
    }
}
