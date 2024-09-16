package externalsort;
import java.io.IOException;
import java.nio.ByteBuffer;

/**
 * heap class containing the heapSort for the records
 */
public class Heap {
    private final BufferPool bufferpool;

    /**
     *
     * @param bufferpool takes in the bufferpool
     */
    public Heap(BufferPool bufferpool) {
        this.bufferpool = bufferpool;
    }

    /**
     *
     * @param i byte index
     * @param j byte index
     * @throws IOException for the file
     */
    void swap(long i, long j) throws IOException {
        byte[] iValue = bufferpool.readIn(i);
        byte[] jValue = bufferpool.readIn(j);

        bufferpool.writeIn(j , iValue);
        bufferpool.writeIn(i, jValue);
    }


    /**
     *
     * @param n byte index
     * @param i byte index
     * @throws IOException for the file
     */
    public void heapify(long n, long i) throws IOException {
        //math in bytes
           long largest = i; // Initialize largest as root
            long left = 2 * i + 4; // Left child
            long right = 2 * i + 8; // Right child

            if (left < n && isGreaterThan(left, largest)) {
                largest = left;
            }

            if (right < n && isGreaterThan(right, largest)) {
                largest = right;
            }

            if (largest != i) {
                swap(i, largest);
                heapify(n, largest);
            }
        }

    /**
     *
     * @throws IOException for the file
     */
    public void heapSort() throws IOException {
        long n = bufferpool.length();

        for (long i = n / 2 - 4; i >= 0; i-= 4) {
            heapify(n, i);
        }

        for (long i = n - 4; i >= 0; i -= 4) {
            swap(0, i);
            heapify(i, 0);
        }
    }

    /**
     *
     * @param left byte index
     * @param right byte index
     * @return true if left is bigger, otherwise false
     * @throws IOException for the file
     */
    public boolean isGreaterThan (long left, long right) throws IOException {
        short leftValue= ByteBuffer.wrap(bufferpool.readIn(left)).getShort();
        short rightValue= ByteBuffer.wrap(bufferpool.readIn(right)).getShort();
        return leftValue > rightValue;
    }
}



