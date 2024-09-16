package partB;
import java.io.File;
import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public record CaliforniaCounty(String countyName, double schoolsWithCS, boolean isRural, int medianHouseholdIncome) {
    private static final ObjectMapper mapper = new ObjectMapper();

    /**
     * Reads JSON data from the given file
     * @param fileName Path to a file containing JSON data that matches the
     *                 {@link CaliforniaCounty} record schema.
     * @return A list of {@link CaliforniaCounty} objects
     * @throws IOException If there were issues reading the file.
     */
    public static List<CaliforniaCounty> readFromFile(String fileName) throws IOException {
        return mapper.readValue(new File(fileName), new TypeReference<>() { });
    }
}
