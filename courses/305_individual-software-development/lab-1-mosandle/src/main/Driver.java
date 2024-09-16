package main;
public class Driver {
	public static void main(String[] args) {
		int[] stuff = {1, 2, 3, 4, 5};
		Example ex = new Example("stuff", stuff);
		int total = 0;

		for(int current: ex.getNums()) {
			total += current;
		}
	    System.out.println(total);
	  }
}
