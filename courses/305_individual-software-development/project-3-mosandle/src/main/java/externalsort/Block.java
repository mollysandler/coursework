package externalsort;

/**
 * block class defining the chunk getting read in
 */
public class Block {
    private static final int SIZEOFBLOCK = 4096; //can be changed easily for testing
    private final int key;
    private final byte[] chunk;

    public Block(byte[] chunk, int key){
        this.key = key;
        this.chunk = chunk;
    }

    /**
     *
     * @param pos the byte index into the file
     * @return t/f depending on if it is in the file
     */
    public boolean posInBlock(int pos){
        //byte index = pos
        return pos >= (this.key * SIZEOFBLOCK) && pos < ((this.key + 1) * SIZEOFBLOCK);
    }

    /**
     *
     * @param pos the byte index in the file
     * @param item where to read in the content into
     */
    public void readAtPos(int pos, byte[] item) {
        //byte index = pos

        int offset = pos - (this.key * SIZEOFBLOCK);
        int length = Math.min(item.length, chunk.length - offset);
        System.arraycopy(chunk, offset, item, 0, length);
    }

    /**
     *
     * @param pos the byte index in the file
     * @param item where to write the content into
     */
    public void writeAtPos(int pos, byte[] item) {
        //byte index = pos

        int offset = pos - (this.key * SIZEOFBLOCK);
        int length = Math.min(item.length, chunk.length - offset);
        System.arraycopy(item, 0, chunk, offset, length);
    }

    /**
     *
     * @return the starting index of the block in the file
     */
    public int position(){
        return key * SIZEOFBLOCK;
    }

    /**
     *
     * @return the block
     */
    public byte[] getBlock() {
        return chunk;
    }

    public byte[] getChunk() {
        return this.chunk;
    }
}
