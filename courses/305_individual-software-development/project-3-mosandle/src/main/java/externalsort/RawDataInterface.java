package externalsort;

import java.io.IOException;

public interface RawDataInterface {
    public int read(byte[] readIn) throws IOException;
    public void write(byte[] value) throws IOException;
    public void seek(long key) throws IOException;
    public long length() throws IOException;
}
