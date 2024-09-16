package externalsort;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;

public class ReadingFromFile implements RawDataInterface  {
    private final RandomAccessFile file;

    public ReadingFromFile(RandomAccessFile file) {
        this.file = file;
    }

    @Override
    public int read(byte[] readIn) throws IOException {
        return file.read(readIn);
    }

    @Override
    public void write(byte[] value) throws IOException {
        file.write(value);
    }

    @Override
    public void seek(long key) throws IOException {
        file.seek(key);
    }

    @Override
    public long length() throws IOException {
        return file.length();
    }
}
