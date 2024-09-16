package externalsort;
import org.junit.jupiter.api.Test;
import java.io.IOException;
import java.nio.ByteBuffer;

import static org.junit.jupiter.api.Assertions.*;


/**
 * not very comprehensive set of tests because the heap is used in the bufferpool tests as well
 * these tests do get around 100% branch coverage if all properly working
 */
class TestHeap {

    @Test
    void TestHeapNormal() throws IOException { //8 byte array
        ByteBuffer bb = ByteBuffer.allocate(8);
        bb.putShort((short) 3);
        bb.putShort((short) 4);
        bb.putShort((short) 1);
        bb.putShort((short) 2);
        byte[] asArray = bb.array();
        ReadingFromBytes read = new ReadingFromBytes(asArray);
        BufferPool buffer = new BufferPool(2, read); //capacity 2

        Heap heap = new Heap(buffer);
        heap.heapSort();
        assertEquals(8, read.read(asArray)); //read 8 bytes total
        for (int item : asArray) {
            System.out.println(item);
        }
    }


    @Test
    void TestHeapNoItems() throws IOException { //empty byte array
        ByteBuffer bb = ByteBuffer.allocate(0);
        byte[] asArray = bb.array();
        ReadingFromBytes read = new ReadingFromBytes(asArray);
        BufferPool buffer = new BufferPool(2, read); //capacity 2

        Heap heap = new Heap(buffer);
        heap.heapSort();
        assertEquals(0, read.read(asArray)); //read 8 bytes total
        for (int item : asArray) {
            System.out.println(item);
        }
    }

    @Test
    void testSwap() throws IOException {
        ByteBuffer bb = ByteBuffer.allocate(8);
        byte[] asArray = bb.array();
        ReadingFromBytes read = new ReadingFromBytes(asArray);

        BufferPool bufferPool = new BufferPool(2, read);
        Heap heap = new Heap(bufferPool);

        // Prepare buffer pool with two different byte arrays
        byte[] array1 = {1, 2, 3, 4};
        byte[] array2 = {5, 6, 7, 8};
        bufferPool.writeIn(0L, array1);
        bufferPool.writeIn(4L, array2);

        //swap
        heap.swap(0, 4);

        // Verify that byte arrays are swapped in buffer pool
        assertArrayEquals(array2, bufferPool.readIn(0L));
        assertArrayEquals(array1, bufferPool.readIn(4L));
    }

    //problem is most likely occurring somewhere in the heapify function
    @Test
    //fails
    void testHeapify() throws IOException {
        ByteBuffer bb = ByteBuffer.allocate(8);
        byte[] asArray = bb.array();
        ReadingFromBytes read = new ReadingFromBytes(asArray);
        BufferPool bufferPool = new BufferPool(2, read);
        Heap heap = new Heap(bufferPool);

        // Prepare buffer pool with multiple elements
        byte[] array = {4, 8, 2, 6, 1};
        bufferPool.writeIn(0L, array);

        // Perform heapify
        heap.heapify(5, 0);

        // Verify that heapify operation is performed correctly
        byte[] expected = {8, 6, 2, 4, 1};
        assertArrayEquals(expected, bufferPool.readIn(0L));
    }

    @Test
    //fails
    void testHeapSort() throws IOException { //array lengths are not right but when printing they are both 5
        ByteBuffer bb = ByteBuffer.allocate(8);
        byte[] asArray = bb.array();
        ReadingFromBytes read = new ReadingFromBytes(asArray);
        BufferPool bufferPool = new BufferPool(2, read);
        Heap heap = new Heap(bufferPool);

        // Prepare buffer pool with multiple elements
        byte[] array = {4, 8, 2, 6, 1};
        bufferPool.writeIn(0L, array);

        // Perform heap sort
        heap.heapSort();

        // Verify that buffer pool is sorted correctly
        byte[] expected = {1, 2, 4, 6, 8};
        for (int item : array) {
            System.out.println(item);
        }
        System.out.println(array.length);
        System.out.println(expected.length);

        assertArrayEquals(expected, bufferPool.readIn(0L));
    }

    @Test
    void testIsGreaterThan() throws IOException { //works
        ByteBuffer bb = ByteBuffer.allocate(10);
        byte[] asArray = bb.array();
        ReadingFromBytes read = new ReadingFromBytes(asArray);
        BufferPool bufferPool = new BufferPool(2, read);
        Heap heap = new Heap(bufferPool);

        // Prepare two byte arrays with different values
        byte[] array1 = {8, 0};
        byte[] array2 = {4, 0};
        bufferPool.writeIn(0L, array1);
        bufferPool.writeIn(4L, array2);

        // Verify that isGreaterThan method returns the correct result
        assertTrue(heap.isGreaterThan(0, 4));
        assertFalse(heap.isGreaterThan(4, 0));
    }

}

