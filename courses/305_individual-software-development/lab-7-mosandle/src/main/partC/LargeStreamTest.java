package partC;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.io.IOException;
import java.util.OptionalInt;
import java.util.stream.Stream;

@SuppressWarnings("java:S5960") // Ignoring SonarLint complaints about not being in a test package
public class LargeStreamTest {

    private static final String BIGFILE = "csc305-lab-7-data/1-gb.txt";
    private static final String SMALLFILE = "csc305-lab-7-data/100-mb.txt";

    @Test
    public void testReadAllLines() throws IOException {
        //runs in 2474.0 milliseconds

        double startTime = System.currentTimeMillis();
        OptionalInt maxEven = Files.readAllLines(Path.of(SMALLFILE))
                .stream()
                .mapToInt(Integer::parseInt)
                .filter(num -> num % 2 == 0)
                .max();

        double endTime = System.currentTimeMillis();
        double runningTime = endTime - startTime;
        System.out.println(runningTime);

        assertTrue(maxEven.isPresent());
        assertEquals(1000, maxEven.getAsInt());
    }

    @Test
    public void testStreamLines() throws IOException {
        //runs in 763.0 milliseconds

        double startTime = System.currentTimeMillis();
        try (Stream<String> lines = Files.lines(Path.of(SMALLFILE))) {
            OptionalInt maxEven = lines
                    .parallel()
                    .mapToInt(Integer::parseInt)
                    .filter(num -> num % 2 == 0)
                    .max();

            double endTime = System.currentTimeMillis();
            double runningTime = endTime - startTime;
            System.out.println(runningTime);

            assertTrue(maxEven.isPresent());
            assertEquals(1000, maxEven.getAsInt());
        }
    }

    @Test
    public void testReadAllLinesGIANT() throws IOException {
        //throws a java heap space OutOfMemory error

        double startTime = System.currentTimeMillis();
        OptionalInt maxEven = Files.readAllLines(Path.of(BIGFILE))
                .stream()
                .mapToInt(Integer::parseInt)
                .filter(num -> num % 2 == 0)
                .max();

        double endTime = System.currentTimeMillis();
        double runningTime = endTime - startTime;
        System.out.println(runningTime);

        assertTrue(maxEven.isPresent());
        assertEquals(1000, maxEven.getAsInt());
    }


    @Test
    public void testStreamLinesGIANT() throws IOException {
        //running time: 5837.0 milliseconds
        //it completes, about 5 times slower than the smaller file but still works

        double startTime = System.currentTimeMillis();
        try (Stream<String> lines = Files.lines(Path.of(BIGFILE))) {
            OptionalInt maxEven = lines
                    .mapToInt(Integer::parseInt)
                    .filter(num -> num % 2 == 0)
                    .max();

            double endTime = System.currentTimeMillis();
            double runningTime = endTime - startTime;
            System.out.println(runningTime);

            assertTrue(maxEven.isPresent());
            assertEquals(2147483552, maxEven.getAsInt());
        }
    }

     @Test
        public void testStreamLinesPARALLEL () throws IOException {
            // running time: 2585.0 milliseconds
            // it completes, about twice as fast as the non-parallel version

            double startTime = System.currentTimeMillis();
            try (Stream<String> lines = Files.lines(Path.of(BIGFILE))) {
                OptionalInt maxEven = lines
                        .parallel()
                        .mapToInt(Integer::parseInt)
                        .filter(num -> num % 2 == 0)
                        .max();

                double endTime = System.currentTimeMillis();
                double runningTime = endTime - startTime;
                System.out.println(runningTime);

                assertTrue(maxEven.isPresent());
                assertEquals(2147483552, maxEven.getAsInt());
            }
        }

}
