/*
CPE 203 Lab00
Name: Molly Sandler
Section:
*/
public class Lab00 {
    public static void main(String[] arguments) {
        //declaring the variables
        int x = 5;
        String y = "hello";
        double z = 9.8;

        //printing the variables
        System.out.println("x: " + x + " y: " + y + " z: " + z);

        //making an array
        int[] numsArray = {3, 6, -1, 2};
        for(int i = 0; i < numsArray.length; i++) {
            System.out.println(numsArray[i]);
        }

        //calling a function
        int numFound = charCount(y, 'l');
        System.out.println("Found:" + numFound);

        // counting for loop
        for(int j=1; j < 11; j++) {
            System.out.print(j + " ");
        }
    }//end of main

    //function counting the characters in a string
    public static int charCount(String x, char lookFor) {
        int count = 0;
        for(int i = 0; i < x.length(); i++) {
            if(x.charAt(i) == lookFor)
            count++;
        }
        return count;
    }

}