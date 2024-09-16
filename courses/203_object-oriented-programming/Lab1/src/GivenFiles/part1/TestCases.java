package GivenFiles.part1;

import java.util.*;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class TestCases {
   private final static double DELTA = 0.0001;

   ////////////////////////////////////////////////////////////
   //                      SimpleIf Tests                    //
   ////////////////////////////////////////////////////////////

   @Test
   public void testAnalyzeApplicant1()    {
      assertTrue(SimpleIf.analyzeApplicant(89, 85));
   } //Passed

   @Test
   public void testAnalyzeApplicant2()    {
      assertFalse(SimpleIf.analyzeApplicant(15, 90));
   } //Passed

   @Test
   public void testAnalyzeApplicant4(){assertTrue(SimpleIf.analyzeApplicant(90, 89));} //Passed

   @Test
   public void testMaxAverage1() {
      assertEquals(SimpleIf.maxAverage(89.5, 91.2), 91.2, DELTA); //Passed
   }

   @Test
   public void testMaxAverage2() {
      assertEquals(SimpleIf.maxAverage(60, 89), 89, DELTA); //Passed
   }

   @Test
   public void testMaxAverage3() {
         assertNotEquals(SimpleIf.maxAverage(60, 89), 60, DELTA); //Passed
      }

      /* TO DO: Write one more valid test case. */ //DONE above


   ////////////////////////////////////////////////////////////
   //                    SimpleLoop Tests                    //
   ////////////////////////////////////////////////////////////

   @Test
   public void testSimpleLoop1()    {
      assertEquals(7, SimpleLoop.sum(3, 4)); //Passed
   }

   @Test
   public void testSimpleLoop2()    {
      assertEquals(7, SimpleLoop.sum(-2, 4)); //Passed
   }

   @Test
   public void testSimpleLoop3(){assertEquals(6, SimpleLoop.sum(1, 3));} //Passed

   /* TO DO: Write one more valid test case to make sure that
         this function is not just returning 7.*/ //DONE above


   ////////////////////////////////////////////////////////////
   //                    SimpleArray Tests                   //
   ////////////////////////////////////////////////////////////

   @Test
   public void testSimpleArray1()    {
      /* What is that parameter?  They are newly allocated arrays
         with initial values. */
      assertArrayEquals(
         new boolean[] {false, false, true, true, false, false},
         SimpleArray.applicantAcceptable(new int[] {80, 85, 89, 92, 76, 81}, 85)
      );
   } //Passed

   @Test
   public void testSimpleArray2()    {
      assertArrayEquals(
         new boolean[] {false, false},
         SimpleArray.applicantAcceptable(new int[] {80, 83}, 92));
   } //Passed

   @Test
   public void testSimpleArray3()   {
      assertArrayEquals(
              new boolean[] {true, false},
              SimpleArray.applicantAcceptable(new int[] {93, 83}, 92));
   } //Passed
   //added test case above

   ////////////////////////////////////////////////////////////
   //                    SimpleList Tests                    //
   ////////////////////////////////////////////////////////////

   @Test
   public void testSimpleList1()   {
      List<Integer> input =
         new LinkedList<Integer>(Arrays.asList(new Integer[] {80, 85, 89, 92, 76, 81}));
      List<Boolean> expected =
         new ArrayList<Boolean>(Arrays.asList(new Boolean[] {false, false, true, true, false, false}));

      assertEquals(expected, SimpleList.applicantAcceptable(input, 85));
   } //Passed

   @Test
   public void testSimpleList2()   {
      List<Integer> input =
              new LinkedList<Integer>(Arrays.asList(new Integer[] {90, 40, 89, 92, 70, 60}));
      List<Boolean> expected =
              new ArrayList<Boolean>(Arrays.asList(new Boolean[] {true, false, true, true, true, false}));

      assertEquals(expected, SimpleList.applicantAcceptable(input, 60));
      /* TO DO: Add a new test case. */ //DONE
   } //Passed

   ////////////////////////////////////////////////////////////
   //                    BetterLoop Tests                    //
   ////////////////////////////////////////////////////////////

   @Test
   public void testFourOver85_1()   {
      assertFalse(BetterLoop.atLeastFourOver85(new int[] {89, 93, 100, 39, 84, 63}));
   } //Passed

   @Test
   public void testFourOver85_2()   {
      assertTrue(BetterLoop.atLeastFourOver85(new int[] {86, 87, 90, 82, 83, 90}));
   } //Passed

   @Test
   public void testFourOver85_3()   {
      assertFalse(BetterLoop.atLeastFourOver85(new int[] {86, 87, 60, 82, 83, 60}));
      /* TO DO: Write a valid test case where the expected result is false. */ //DONE
   } //Passed

   ////////////////////////////////////////////////////////////
   //                    ExampleMap Tests                    //
   ////////////////////////////////////////////////////////////

   @Test
   public void testExampleMap1()   {
      Map<String, List<CourseGrade>> courseListsByStudent = new HashMap<>();
      courseListsByStudent.put("Mary",
         Arrays.asList(
            new CourseGrade("CPE 123", 89),
            new CourseGrade("CPE 101", 90),
            new CourseGrade("CPE 202", 99),
            new CourseGrade("CPE 203", 100),
            new CourseGrade("CPE 225", 89)));
      courseListsByStudent.put("Sam",
         Arrays.asList(
            new CourseGrade("CPE 101", 86),
            new CourseGrade("CPE 202", 80),
            new CourseGrade("CPE 203", 76),
            new CourseGrade("CPE 225", 80)));
      courseListsByStudent.put("Sara",
         Arrays.asList(
            new CourseGrade("CPE 123", 99),
            new CourseGrade("CPE 203", 91),
            new CourseGrade("CPE 471", 86),
            new CourseGrade("CPE 473", 90),
            new CourseGrade("CPE 476", 99),
            new CourseGrade("CPE 572", 100)));

      List<String> expected = Arrays.asList("Mary", "Sara");

      /*
       * Why compare HashSets here?  Just so that the order of the
       * elements in the list is not important for this test.
       */
      assertEquals(new HashSet<>(expected),
         new HashSet<>(ExampleMap.highScoringStudents(
            courseListsByStudent, 85)));
   }

   @Test
   public void testExampleMap2()    {
      Map<String, List<CourseGrade>> courseListsByStudent = new HashMap<>();
      courseListsByStudent.put("Mary",
              Arrays.asList(
                      new CourseGrade("CPE 123", 60),
                      new CourseGrade("CPE 101", 60),
                      new CourseGrade("CPE 202", 60),
                      new CourseGrade("CPE 203", 60),
                      new CourseGrade("CPE 225", 60)));
      courseListsByStudent.put("Sam",
              Arrays.asList(
                      new CourseGrade("CPE 101", 60),
                      new CourseGrade("CPE 202", 60),
                      new CourseGrade("CPE 203", 60),
                      new CourseGrade("CPE 225", 60)));
      courseListsByStudent.put("Sara",
              Arrays.asList(
                      new CourseGrade("CPE 123", 90),
                      new CourseGrade("CPE 203", 90),
                      new CourseGrade("CPE 471", 90),
                      new CourseGrade("CPE 473", 90),
                      new CourseGrade("CPE 476", 90),
                      new CourseGrade("CPE 572", 90)));

      List<String> expected = Arrays.asList("Sara");

      /*
       * Why compare HashSets here?  Just so that the order of the
       * elements in the list is not important for this test.
       */
      assertEquals(new HashSet<>(expected),
              new HashSet<>(ExampleMap.highScoringStudents(
                      courseListsByStudent, 85)));
      /* TO DO: Write another valid test case. */ // DONE
   }
}
