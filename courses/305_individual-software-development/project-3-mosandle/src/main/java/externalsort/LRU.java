package externalsort;
import java.util.LinkedList;
import java.util.List;

/**
 * LRU class determining that the pools are changed using least recently used
 * uses java linked list
 */
public class LRU {
    private static final int SIZEOFBLOCK = 4096; //can be easily changed for testing

    private final LinkedList<Block> leastRecent;
    int capacity;

    public LRU(int size){
        this.leastRecent = new LinkedList<>();
        this.capacity = size;
    }

    /**
     * does not like my return for this function
     * @param key byte index into the file
     * @param block to write the record into
     * @return the block added
     */
    public Block addRecord(int key, byte[] block){
        Block addedRecord = new Block(block, key / SIZEOFBLOCK);
        Block removedRecord = null;
        if(leastRecent.size() >= capacity){
            removedRecord = leastRecent.removeLast();
        }
        leastRecent.addFirst(addedRecord);
        return removedRecord;
    }

    /**
     *
     * @param key byte index into array
     * @param bufferPool byte array
     * @return t/f if it is reaadable from bufferpool
     */
    public boolean readRecordIn(int key, byte[] bufferPool){
        Block block = null;
        for(Block b : leastRecent){
            if(b.posInBlock(key)) {
                block = b;
            }
        }
        if(block != null){
            block.readAtPos(key, bufferPool);

            leastRecent.remove(block);
            leastRecent.addFirst(block);
            return true;
        }
        return false;
    }//end of function

    /**
     *
     * @param key byte index into file
     * @param bufferPool byte array
     */
    public void writeRecordOut(int key, byte[] bufferPool){
        Block block = null;
        for(Block b: leastRecent){
            if(b.posInBlock(key)){
                block = b;
            }
        }
        if(block != null){
            block.writeAtPos(key, bufferPool);

            leastRecent.remove(block);
            leastRecent.addFirst(block);
        }
    }//end of function

    /**
     *
     * @param key byte index into the file
     * @return t/f depending on if it is in the cache or not
     */
    public boolean posInBufferPool(int key){
        for(Block b : leastRecent){
            if(b.posInBlock(key)) {
                return false;
            }
        }
        return true;
    }

    /**
     *
     * @return the lru bufferpool
     */
    public List<Block> getLRU(){
        return leastRecent;
    }


}//end of LRU class
