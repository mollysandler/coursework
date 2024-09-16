package externalsort;
import java.io.IOException;

/**
 * bufferpool class
 * implements rawDataInterface so can have a bunch of different implementations for testing
 * is separate from the LRU class so LRU could be injected in, or any other type of method to determine the pools
 * currently using LRU but if new tpyes are added it could add a parameter to change it (like MRU, etc)
 */
public class BufferPool implements RawDataInterface{
    private static final int SIZEOFBLOCK = 4096; //can be easily changed for testing
    RawDataInterface file;
    private int cacheHitCounter;
    private int cacheMissCounter;
    private int diskReadCounter;
    private int diskWriteCounter;
    private final LRU lru;

    /**
     *
     * @param capacity amount of bufferpools allowed
     * @param file the file being used
     */
    public BufferPool(int capacity, RawDataInterface file) {
        this.file = file;
        this.lru = new LRU(capacity);
    }

    @Override //from raw data interface
    public int read(byte[] readIn) throws IOException {
        return file.read(readIn);
    }

    @Override //from raw data interface
    public void write(byte[] value) throws IOException {
        file.write(value);
    }

    @Override //from raw data interface
    public void seek(long key) throws IOException {
        file.seek(key);
    }

    @Override //from raw data interface
    public long length() throws IOException{
        return file.length();
    }

    /**
     *
     * @return all below return their value to be printed in the stats
     */
    public int getCacheHitCounter() { return cacheHitCounter; }

    public int getCacheMissCounter() { return cacheMissCounter; }

    public int getDiskReadCounter() { return diskReadCounter; }

    public int getDiskWriteCounter() { return diskWriteCounter; }


    /**
     *
     * @param key is a byte index into the file
     * @return the bytes read in
     * @throws IOException for file
     */
    public byte[] readIn(Long key) throws IOException {
        //key is a byteIndex

        long blockIndex = key / SIZEOFBLOCK;
        byte[] readIn = new byte[SIZEOFBLOCK];

        if(lru.posInBufferPool(Math.toIntExact(key))){ //if the key is in the buffer pool already
            file.seek(blockIndex * SIZEOFBLOCK);
            if(!lru.readRecordIn(Math.toIntExact(key), readIn)){
                file.read(readIn);
            }
            cacheMissCounter++;
            diskReadCounter++;
            lru.addRecord(Math.toIntExact(key), readIn);
        } else {
            cacheHitCounter++;
        }

        byte[] ret = new byte[4];
        lru.readRecordIn(Math.toIntExact(key), ret);
        return ret;

    }

    /**
     *
     * @param key byte index into the file
     * @param value writes the value into value at that key
     * @throws IOException for the file
     */
    public void writeIn(Long key, byte[] value) throws IOException {
        //key is a byteIndex
        long blockIndex = key / SIZEOFBLOCK;

        byte[] readIn = new byte[SIZEOFBLOCK];

        if(lru.posInBufferPool(Math.toIntExact(key))){ //if the key is in the buffer pool already
            file.seek(blockIndex * SIZEOFBLOCK);
            cacheMissCounter++;
            diskReadCounter++;
            lru.addRecord(Math.toIntExact(key), readIn);
        } else {
            cacheHitCounter++;
        }
        lru.writeRecordOut(Math.toIntExact(key), value);
        diskWriteCounter++;
    }

    /**
     * flushes out the final buffers at the end of the file
     * @throws IOException for the file
     */
    public void flush() throws IOException {
        for(Block entry : lru.getLRU()) {
            file.seek(entry.position());
            file.write(entry.getBlock());
            diskWriteCounter++;
        }
    }
}//end of LRUBufferPool