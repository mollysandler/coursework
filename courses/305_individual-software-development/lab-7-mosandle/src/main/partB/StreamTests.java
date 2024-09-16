package partB;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
import java.io.IOException;
import java.util.*;

@SuppressWarnings("java:S5960") // Ignoring SonarLint complaints about not being in a test package
public class StreamTests {
    private static List<CaliforniaCounty> dataset;

    @BeforeAll
    public static void setUp() throws IOException {
        dataset = CaliforniaCounty.readFromFile("ca-county-data.json");
    }

    @Test //done i think
    public void testPrintAllCounties() {
        dataset.forEach(System.out::println);
    }

    @Test //done i think
    public void testMapToDoubles() {
        // TODO: Use the map stream operation to map all the counties to a list of doubles.
        //  Again, there's no explicit assertion here. Once you've obtained a List<Double>,
        //  feel free to just System.out.println it
        dataset.stream().map(CaliforniaCounty::schoolsWithCS).forEach(System.out::println);
    }

    @Test
    public void testAverageSchoolsOfferingCS() {
        // Explore the average percentage of schools offering CS in rural and urban counties, respectively
        // TODO: Replace the -1 below with a stream pipeline that computes the average percentage of
        //  schools offering CS in RURAL counties (counties where isRural is true)

        OptionalDouble average = dataset.stream().filter(CaliforniaCounty::isRural)
                .map(CaliforniaCounty::schoolsWithCS)
                .mapToDouble(Double::doubleValue)
                .average();
        assertTrue(average.isPresent());
        assertEquals(0.202, average.getAsDouble(), 0.01);

        // TODO: Replace the -1 below with a stream pipeline that computes the average percentage of
        //  schools offering CS in URBAN counties (counties where isRural is false)
        OptionalDouble average2 = dataset.stream()
                .filter(name -> !name.isRural())
                .map(CaliforniaCounty::schoolsWithCS)
                .mapToDouble(Double::doubleValue)
                .average();

        assertTrue(average2.isPresent());
        assertEquals(0.36, average2.getAsDouble(), 0.01);
    }

    @Test
    public void testSplitByMedian() {
        // TODO: Find the median medianHouseholdIncome in California counties (a "median of medians").
        //  Ask me, your neighbour, or the internet if you need to remind yourself of what a median is.
        //  Use stream operations to find this value.

        OptionalInt val = dataset.stream().map(CaliforniaCounty::medianHouseholdIncome)
                .mapToInt(Integer::intValue)
                .sorted()
                .skip(dataset.size() / 2)
                .findFirst();
        assertTrue(val.isPresent());
        assertEquals(69955, val.getAsInt());

        // Using the median you found in the previous step, answer the following questions:
        // TODO: For counties with medianHouseholdIncome LESS THAN OR EQUAL TO the median, what's the
        //  average percentage of schools offering CS? Print the value.

        OptionalDouble averageLess = dataset.stream()
                .filter(county -> county.medianHouseholdIncome() <= val.getAsInt())
                .mapToDouble(CaliforniaCounty::schoolsWithCS)
                .average();
        assertTrue(averageLess.isPresent());
        System.out.println(averageLess.getAsDouble() * 100);


        // TODO: For counties with medianHouseholdIncome GREATER THAN the median, what's the average
        //  percentage of schools offering CS? Print the value.
        OptionalDouble averageMore = dataset.stream()
                .filter(county -> county.medianHouseholdIncome() > val.getAsInt())
                .mapToDouble(CaliforniaCounty::schoolsWithCS)
                .average();
        assertTrue(averageMore.isPresent());
        System.out.println(averageMore.getAsDouble() * 100);
    }

    @Test
    public void testMinMaxAndChosen() {
        //1. The county with the highest percentage of schools offering CS
        Optional<CaliforniaCounty> countyWithHighestCS = dataset.stream()
                .max(Comparator.comparingDouble(CaliforniaCounty::schoolsWithCS));
        countyWithHighestCS.ifPresent
                (county -> System.out.println(county.countyName()));

        //2. The county with the lowest percentage of schools offering CS
        Optional<CaliforniaCounty> countyWithLowestCS = dataset.stream()
                .min(Comparator.comparingDouble(CaliforniaCounty::schoolsWithCS));

        countyWithLowestCS.ifPresent
                (county -> System.out.println(county.countyName()));

        //3. Details about San Luis Obispo county.
        String targetCountyName = "San Luis Obispo";
        Optional<CaliforniaCounty> targetCounty = dataset.stream()
                .filter(county -> county.countyName().equals(targetCountyName))
                .findFirst();

        targetCounty.ifPresentOrElse(
                county -> System.out.println
                        ("Name: " + county.countyName()
                                + " Median Income: "
                                + county.medianHouseholdIncome()
                                + " Is Rural: " + county.isRural()),
                () -> System.out.println("County not found: " + targetCountyName));
    }
}

/*
     In exploring this dataset, one surprising aspect was the significant variation
     in the percentage of schools offering CS across different counties in California.
     The factors contributing to these trends could include differences in education resources,
     or funding, which may influence the emphasis on computer science education in schools.
     Additionally, socioeconomic factors, such as median household income, probably also
     play a role in determining the availability and accessibility of computer science
     programs in different counties.

     */
