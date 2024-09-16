import java.io.*;
import java.nio.file.Files;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.*;
import java.util.stream.Stream;

import org.json.JSONObject;

/**
 * A Parsing class that parses a given file or directory and returns a jsonObject in the format of:
 * {
 *     File:{
 *         loc:
 *         local_vars:
 *     }
 * }
 * @author Andy Duong
 */

public class Parsing {

    public Parsing() {}

    public static JSONObject loadData(String fileEntry){ //main method
        File inputFile = new File(fileEntry);
        JSONObject result = new JSONObject(); //result with classes and their details
        File[] files;

        // Check if the file entry is dir
        if(inputFile.isDirectory()) { //if input is a dir, grab all files from that dir
            files = inputFile.listFiles((dir, name) -> name.endsWith(".java"));
        }else{ //if not dir, then just set files to our single input, if empty will just return empty jsonObject
            files = new File[1];
            files[0] = inputFile;
        }

        Set<String> classNames = new HashSet<>();
        //get a set of all the class names for counting local vars
        assert files != null;
        for(File file: files){
            String name = file.getName();
            classNames.add(name.replace(".java", "")); //only takes java files for now
        }

        for(File file: files){ //for each file grab the json data from each class
            JSONObject classData = fileParser(file, classNames); //returns loc and localvars from class
            result.put(file.getName(), classData); //add class to its respective jsonObject
        }
        return result;
    }

    private static JSONObject fileParser(File inputFile, Set<String> classNames){
        JSONObject classDetails = new JSONObject();

        try {
            int lineCount = 0;
            int localCount = 0;

            //pattern for local variables
            String regTypes = "int|long|double|float|char|boolean|String";
            String customTypes = String.join("|", classNames);
            String pattern1 = "\\b(" + regTypes +
                    (customTypes.isEmpty() ? "" : "|" + customTypes) +
                    ")\\s+\\w+(\\s*=\\s*[^,;]+)?(\\s*,\\s*\\w+(\\s*=\\s*[^,;]+)?)*;";
            Pattern pattern = Pattern.compile(pattern1);

            try (Stream<String> lines = Files.lines(inputFile.toPath())) {
                for (String line : (Iterable<String>) lines::iterator) {
                    // Increment line count
                    lineCount++;

                    //create a matcher for the current line that will find matches of the given pattern
                    Matcher matcher = pattern.matcher(line);
                    while (matcher.find()) {

                        String match = matcher.group();
                        // Count each variable declaration within the match
                        int varCount = match.split(",").length;
                        localCount += varCount;
                    }
                }
            }
            //add details of current class to the current jsonObject
            classDetails.put("loc", lineCount);
            classDetails.put("localVars", localCount);

            return classDetails;

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}