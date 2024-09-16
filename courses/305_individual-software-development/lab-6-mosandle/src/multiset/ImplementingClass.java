package multiset;

import java.util.ArrayList;
import java.util.Optional;

public class ImplementingClass<E> implements Multiset <E>{
    private int sizeOfSet = 0;
    private final ArrayList<E> stack = new ArrayList<>();

    @Override
    public void add(E element) {
        stack.add(sizeOfSet, element);
        sizeOfSet++;
    }

    @Override
    public boolean remove(E element) {
        if(count(element) != 0){ //done
            stack.remove(element);
            sizeOfSet--;
            return true;
        }
        return false; //done
    }

    @Override
    public int size() {
        return this.sizeOfSet;
    }

    @Override
    public int count(E element) {
        int count = 0;
        for (int i = 0; i < this.sizeOfSet; i++) {
            if (stack.get(i).equals(element)) {
                count++; //done
            }
        }
        return count; //done
    }
    @Override
    public Optional<E> grab() {
        if (sizeOfSet > 0) {
            return Optional.of(stack.remove(0));
        } else {
            return Optional.empty();
        }
    }
}
