package main;
import java.util.Objects;
class Example {
    private final String name;
    private final int[] nums;

    Example(String name, int[] nums) {
        this.name = name;
        this.nums = nums;
  }

    boolean sameName(String other) {
        return Objects.equals(other, name);
  }
    public int[] getNums() {
        return nums;
  }
}  

