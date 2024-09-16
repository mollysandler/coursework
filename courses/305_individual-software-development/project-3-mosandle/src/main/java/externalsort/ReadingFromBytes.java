package externalsort;

import java.io.IOException;

public class ReadingFromBytes implements RawDataInterface{
    private final byte[] input;
    private long pointer;

    ReadingFromBytes(byte[] input){
        this.input = input;
        this.pointer = 0;
    }
    @Override
    public int read(byte[] readIn) {
        for(long i = 0; i < readIn.length; i++){
            readIn[(int) i] = input[(int) (pointer + i)];
        }
        return readIn.length;
    }

    @Override
    public void write(byte[] value) {
        for(long i = 0; i < value.length - 1; i++){
            input[(int) (i + pointer)] = value[(int) i];
        }
    }

    @Override
    public void seek(long key) {
        pointer = key;
    }

    @Override
    public long length() throws IOException {
        return input.length;
    }
}
