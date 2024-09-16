package externalsort;
import java.io.IOException;
import java.io.RandomAccessFile;

/**
 * A package for Heap-sorting large binary files.
 *
 * @author Molly Sandler, contact: mosandle@calpoly.edu
 */

public class Driver {
    private static final String NON_NUMBER_BYTES = "please enter a number for the number of bytes.";
    private static final String STATS = "STATS";
    private static final String SPACES = "    ";

    /**
     *
     * @param args main terminal args
     * @throws IOException for file
     */
    public static void main(String[] args) throws IOException {
        if (args.length != 2) {
            throw new IllegalArgumentException(
                    """
                            Expected exactly 2 arguments.
                            One for a file name to sort, and one for the number of buffers in
                            the buffer pool.
                            """
            );
        }

        RandomAccessFile file = new RandomAccessFile(args[0], "rw");

        RawDataInterface newfile = new ReadingFromFile(file);
        int numBuffers;

        try {
            numBuffers = Integer.parseInt(args[1]);
        } catch (NumberFormatException e) {
            System.out.println(NON_NUMBER_BYTES);
            file.close();
            return;
        }

        BufferPool bufferpool = new BufferPool(numBuffers, newfile);

        //heap of size 16
        //bufferpool 2
        //2 record blocks

        Heap heap = new Heap(bufferpool);

        //gets the running time of the sorting here
        long startTime = System.currentTimeMillis();
        heap.heapSort();
        long endTime = System.currentTimeMillis();
        long runningTime = endTime - startTime;

        bufferpool.flush();
        writeRecordPairs(file);
        writeStatOutput(args[0], runningTime, bufferpool);

        file.close();
    }

    /**
     * prints out the sorted records
     * @param file the randomaccessfile being used
     * @throws IOException for file
     */
    public static void writeRecordPairs(RandomAccessFile file) throws IOException {
        long fileLen = file.length();
        long numBlocks = fileLen / 4096;

        for(int i = 0; i < numBlocks; i++){
            if (i != 0 && i % 8 == 0) {
                System.out.println();
            }
            file.seek(i * 4096L);
            short key = file.readShort();
            short value = file.readShort();
            System.out.print(key + " " + value);
            if (i < numBlocks - 1) {
                System.out.print(SPACES);
            }
        }
        System.out.println();
    }

    /**
     * prints out the stats
     * @param fileName name of file in argument to print out
     * @param runningTime the final running time of the sorting
     * @param bufferpool the created bufferpool
     */
    private static void writeStatOutput(String fileName, long runningTime, BufferPool bufferpool){
        System.out.println(STATS);
        System.out.println("File name: " + fileName);
        System.out.println("Cache Hits: " + bufferpool.getCacheHitCounter());
        System.out.println("Cache Misses: " + bufferpool.getCacheMissCounter());
        System.out.println("Disk Reads: " + bufferpool.getDiskReadCounter());
        System.out.println("Disk Writes: " + bufferpool.getDiskWriteCounter());
        System.out.println("Time to sort: " + runningTime);
    }

}//end of Driver
