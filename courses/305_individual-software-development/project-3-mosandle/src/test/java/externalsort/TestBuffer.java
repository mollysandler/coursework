package externalsort;
import java.io.IOException;
import java.nio.ByteBuffer;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 * written test cases for the buffer class, which include the block and LRU classes
 * I am only writing for this one, but if I was being very comprehensive I would write for all
 * my code is not at full functional correctness, so many of these tests fail for mine
 * if working properly, they would all pass with near 100% branch coverage on the bufferpool class
 */
class TestBuffer {
    @Test
    void testReadInCacheMiss() throws IOException {
        ByteBuffer bb = ByteBuffer.allocate(10);
        bb.putShort((short) 1);
        bb.putShort((short) 2);
        bb.putShort((short) 3);
        bb.putShort((short) 4);
        bb.putShort((short) 5);
        byte[] asArray = bb.array();

        ReadingFromBytes read = new ReadingFromBytes(asArray);
        BufferPool bufferPool = new BufferPool(2, read);

        // Call readIn with a key that is not in the buffer pool
        byte[] result = bufferPool.readIn(4L);

        assertEquals(0, bufferPool.getCacheMissCounter());
        assertEquals(0, bufferPool.getDiskReadCounter());
        assertEquals(1, bufferPool.getCacheHitCounter());
    }


    @Test
    void testReadInCacheHit() throws IOException {
        ByteBuffer bb = ByteBuffer.allocate(10);
        bb.putShort((short) 1);
        bb.putShort((short) 2);
        bb.putShort((short) 3);
        bb.putShort((short) 4);
        bb.putShort((short) 5);
        byte[] asArray = bb.array();

        ReadingFromBytes read = new ReadingFromBytes(asArray);
        BufferPool bufferPool = new BufferPool(2, read);

        byte[] result = bufferPool.readIn(2L);

        byte[] expected = {3, 0};
        assertArrayEquals(expected, result);
        assertEquals(1, bufferPool.getCacheHitCounter());
        assertEquals(0, bufferPool.getCacheMissCounter());
        assertEquals(0, bufferPool.getDiskReadCounter());
    }

    @Test
    void testFlush() throws IOException {
        // Prepare data and buffer pool
        ByteBuffer bb = ByteBuffer.allocate(8);
        bb.putShort((short) 1);
        bb.putShort((short) 2);
        bb.putShort((short) 3);
        bb.putShort((short) 4);
        byte[] asArray = bb.array();

        ReadingFromBytes read = new ReadingFromBytes(asArray);
        BufferPool bufferPool = new BufferPool(2, read);
        // Call flush
        bufferPool.flush();
        // Verify the counters
        assertEquals(2, bufferPool.getDiskWriteCounter());
    }

    @Test
    void testGetters() throws IOException { //works
        ByteBuffer bb = ByteBuffer.allocate(8);
        bb.putShort((short) 1);
        bb.putShort((short) 2);
        bb.putShort((short) 3);
        bb.putShort((short) 4);
        byte[] asArray = bb.array();

        ReadingFromBytes read = new ReadingFromBytes(asArray);
        BufferPool bufferPool = new BufferPool(2, read);

        // Call getters and verify the counters
        assertEquals(0, bufferPool.getCacheHitCounter());
        assertEquals(0, bufferPool.getCacheMissCounter());
        assertEquals(0, bufferPool.getDiskReadCounter());
        assertEquals(0, bufferPool.getDiskWriteCounter());
    }

    @Test
    void Test2() throws IOException {
        ByteBuffer bb = ByteBuffer.allocate(8);
        bb.putShort((short) 3);
        bb.putShort((short) 4);
        bb.putShort((short) 1);
        bb.putShort((short) 2);
        byte[] asArray = bb.array();
        ReadingFromBytes read = new ReadingFromBytes(asArray);
        BufferPool buffer = new BufferPool(2, read); //capacity 2

        short oldFirstKey = ByteBuffer.wrap(buffer.readIn(0L)).getShort(0); //gonna miss bc its not there
        short oldSecondKey = ByteBuffer.wrap(buffer.readIn(4L)).getShort(0);//gonna miss bc its not there
        ByteBuffer newRecord = ByteBuffer.allocate(4);

        newRecord.putShort((short) 5);
        newRecord.putShort((short) 6);

        buffer.writeIn(4L, newRecord.array());
        short newFirstKey = ByteBuffer.wrap(buffer.readIn(0L)).getShort(0); //gonna hit bc its been added
        short newSecondKey = ByteBuffer.wrap(buffer.readIn(4L)).getShort(0); //gonna hit bc its been added

        assertEquals(3, oldFirstKey);
        assertEquals(1, oldSecondKey);
        assertEquals(3, newFirstKey);
        assertEquals(5, newSecondKey);

        buffer.flush();
    }

    @Test
    void testGetMethod() throws IOException { //correct if all working as expected, which it is not
        ByteBuffer bb = ByteBuffer.allocate(4);
        bb.putShort((short) 3); //add one record to the array
        bb.putShort((short) 4);
        byte[] asArray = bb.array();
        ReadingFromBytes read = new ReadingFromBytes(asArray);

        BufferPool buffer = new BufferPool(2, read);
        buffer.readIn(0L);
        assertEquals(0, buffer.getCacheHitCounter());
        assertEquals(1, buffer.getCacheMissCounter());

    }
}