package externalsort;

public class Work {
    private int givenInput;


    public boolean isPrime(int input){
        //check if number is a prime number
        for(int i = 1; i < input; i++){
            if(input % i != 0){
                continue;
            } else{
                givenInput = input;
                return true;

            }
            return false;
        }
        //check if number is a palindrome
    }

    public int getNext(int input){
        while(!isPrime(input)){
            input++;
            givenInput = input;
        }
        return givenInput;
    }

    public boolean isPalindrom(int input){
        String s = Integer.toString(input);

    }

}
