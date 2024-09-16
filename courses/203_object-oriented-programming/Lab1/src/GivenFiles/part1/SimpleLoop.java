//Done
package GivenFiles.part1;

public class SimpleLoop {
  /**
   * Computes the sum of integers between low and high (inclusive). Yes, this can
   * be done without a loop, but the point is to practice the syntax for a loop.
   * 
   * @param low
   * @param high
   * @return An integer that is the sum of numbers between low and high
   */
  public static int sum(int low, int high) {
    int i = low; //set i to low
    int sum = 0;
    while(i <= high){ //go through numbers from low to high
      sum = i + sum; //add each number to the sum of the previous
      i++; //increment i
    }
    return sum; // return total

  }

}
