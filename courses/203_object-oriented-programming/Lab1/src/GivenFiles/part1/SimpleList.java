//Done maybe
package GivenFiles.part1;

import java.util.List;
import java.util.LinkedList;

public class SimpleList {

  /**
   * Write a function that takes in an applicant's numerical scores and returns
   * Boolean values to tell us if they are above a certain threshold.
   * 
   * For example, if the applicant's scores are [80, 85, 89, 92, 76, 81], and the
   * threshold value is 85, return [false, false, true, true, false, false].
   * 
   * This is very similar to the SimpleArray exercise, but this time using LISTS
   * instead of ARRAYS.
   * 
   * @param scores    The applicant's array of scores
   * @param threshold The threshold value
   * @return An array of boolean values: true if the score is higher than
   *         threshold, false otherwise
   */
  public static List<Boolean> applicantAcceptable(List<Integer> scores, int threshold) {
    List<Boolean> highScores = new LinkedList<Boolean>();

    /*
     * TO DO: The output list, highScores, should hold as its elements the
     * appropriate boolean (true or false) value.
     * 
     * Write a loop to compute the acceptability of the scores based on the
     * threshold and place the result into the output list.
     * 
     * Use a FOR-EACH loop.
     */

    for(int i = 0; i < scores.size(); i++) {
      if (scores.get(i) > threshold) { //if score at each index is higher than the threshold, make it true
        //set the value of highscores at that index equal to true
        highScores.add(i, true);
      }
      else{
        //set the value of highscores at that index equal to false
        highScores.add(i, false); //otherwise make it false
      }
    }//end of for loop
    return highScores; //return list
  }
}
