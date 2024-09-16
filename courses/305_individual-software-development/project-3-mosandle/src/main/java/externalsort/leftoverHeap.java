package externalsort;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.Map;

//when askeing for an index, i find the block its asking for by dividng by 4096
//then i multiple that number by 4096 to get the actual index
//and then i return the record from inside that block
//check in cache for 0, 1, 2, 3 etc the block index

/*


public class leftoverHeap {
    private int[] heapArray;
    private int size;
    private final int capacity;
    private final BufferPool bufferpool;

    public leftoverHeap(int capacity, BufferPool bufferpool) {
        this.capacity = capacity;
        this.size = 0;
        this.heapArray = new int[capacity];
        this.bufferpool = bufferpool;
    }

    public int[] getHeapArray() { return heapArray; }

    private int parent(int index) { return (index - 1) / 2; }

    private void swapInternal(int i, int j) {
        int temp = heapArray[i];
        heapArray[i] = heapArray[j];
        heapArray[j] = temp;
    }

    private void swapWithBufferPool(int i, int j) throws IOException {
        byte[] iValue = bufferpool.retrieve((long) heapArray[i]);
        byte[] jValue = bufferpool.retrieve((long) heapArray[j]);

        bufferpool.put((long) heapArray[j], iValue);
        bufferpool.put((long) heapArray[i], jValue);
    }

    private void swap(int i, int j) throws IOException {
        if (bufferpool == null) {
            swapInternal(i, j);
        } else {
            swapWithBufferPool(i, j);
        }
    }
/*
    private void swap(int i, int j) throws IOException {
        if (bufferpool == null) {
            int temp = heapArray[i];
            heapArray[i] = heapArray[j];
            heapArray[j] = temp;
        } else{
            byte[] iValue = bufferpool.retrieve((long) heapArray[i]);
            byte[] jValue = bufferpool.retrieve((long) heapArray[j]);

            bufferpool.put((long) heapArray[j], iValue);
            bufferpool.put((long) heapArray[i], jValue);
        }
    }

 */
/*
    public void insert(int item) throws IOException {
        if (size >= capacity) {
            throw new IllegalStateException("The heap is already full");
        }
        heapArray[size] = item;
        size++;
        heapifyUp(size - 1); //calling get in the swap so could be here
        //System.out.println("Suspicious in heap.insert");
    }

    private void heapifyUp(int index) throws IOException {
        while (index > 0 && isGreaterThan(heapArray[index], heapArray[parent(index)])) {
            swap(index, parent(index));
            //System.out.println("Suspicious in heapifyUp");
            index = parent(index);
        }
    }

    public void heapify(int[] arr, int n, int i) throws IOException {
        int largest = i; // Initialize largest as root
        int left = 2 * i + 1; // Left child
        int right = 2 * i + 2; // Right child

        if (left < n && isGreaterThan(arr[left], arr[largest]))
            largest = left;

        if (right < n && isGreaterThan(arr[right], arr[largest]))
            largest = right;

        if (largest != i) {
//            int swap = arr[i];
//            arr[i] = arr[largest];
//            arr[largest] = swap;
            swap(i, largest);
            heapify(arr, n, largest);
            //System.out.println("Suspicious in heapify");
        }
    }

    public void heapSort(int[] arr) throws IOException {
        int n = arr.length;

        for (int i = n / 2 - 1; i >= 0; i--) {
            heapify(arr, n, i);
            //System.out.println("Suspicious in heapSort");

        }

        for (int i = n - 1; i >= 0; i--) {
            swap(0, i);
            heapify(arr, i, 0);
            //System.out.println("Suspicious in heapSort");

        }
    }

    public boolean isGreaterThan (int left, int right) throws IOException {
        if(bufferpool == null){
            //System.out.println("Comparing " + left + " and " + right);
            return left > right;
        }
        short leftValue= ByteBuffer.wrap(bufferpool.retrieve((long)left)).getShort();
        short rightValue= ByteBuffer.wrap(bufferpool.retrieve((long)right)).getShort();
        //System.out.println("Suspicious in isGreaterThan");

        //System.out.println("Comparing " + left + " (" + leftValue + ") and " + right + " (" + rightValue + ")");
        return leftValue > rightValue;
    }












 */



    /*

    package externalsort;
import java.io.IOException;
import java.util.*;

    public class LRUBufferPool implements RawDataInterface{
        RawDataInterface file;

        private int cacheHitCounter;
        private int cacheMissCounter;
        private int diskReadCounter;
        private int diskWriteCounter;

        private final int capacity;
        private final Map<Long, externalsort.LRUBufferPool.Node> cache;
        private final externalsort.LRUBufferPool.Node head;
        private final externalsort.LRUBufferPool.Node tail;

        public LRUBufferPool(int capacity, RawDataInterface file) {
            this.file = file;
            this.capacity = capacity;
            this.cache = new HashMap<>();
            this.head = new externalsort.LRUBufferPool.Node(null, null);
            this.tail = new externalsort.LRUBufferPool.Node(null, null);
            this.head.next = this.tail;
            this.tail.prev = this.head;
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

        public long length() throws IOException{
            return file.length();
        }

        public Map<Long, externalsort.LRUBufferPool.Node> getCache() {
            return cache;
        }

        public int getCacheHitCounter() { return cacheHitCounter; }

        public int getCacheMissCounter() { return cacheMissCounter; }

        public int getDiskReadCounter() { return diskReadCounter; }

        public int getDiskWriteCounter() { return diskWriteCounter; }

        public byte[] retrieve(Long key) throws IOException {
            long blockIndex = (long) Math.floor(key / 4096);
            long byteIndex = key;
            //this function needs to be edited
            //the given input to this function is a byte index to the RandomAccess file
            //need to read in 4096 bytes at once in a "block" to the cache
            //need to get the block that the given key is in (1, 2, 3, etc) must be an integer (but actually a long)
            //check if that block is already in in the cache
            //if yes, it is a hit and we read the specific byte from that block
            //if no, we read that entire block into the cache with put
            //using LRUBufferpool rules and it is +cachemiss and +cachediskread




            externalsort.LRUBufferPool.Node node = cache.get(key);
            if (node == null) { //if the node is not in the cache
                file.seek(key); //go to that point in the file
                byte[] readIn = new byte[4]; //read it in
                file.read(readIn);
                cacheMissCounter++;
                diskReadCounter++;
                node = put(key, readIn); //add it to the cache at that key with the value it read
            } else {
                cacheHitCounter++;
            }
            moveToHead(node); //move the given node to the head of the list
            return node.value; //return its value
        }

        public externalsort.LRUBufferPool.Node put(Long key, byte[] value) throws IOException {

            //this function needs to be edited using the same block and byte index rules from the retrieve function

            externalsort.LRUBufferPool.Node node = cache.get(key);
            if (node == null) { //if the node is not in the cache
                if (cache.size() >= capacity) { //if the size is too big
                    evictTail(); //evict the LRU buffer
                }

                node = new externalsort.LRUBufferPool.Node(key, value); //make a new node with that key and value
                cache.put(key, node); //
                addToHead(node);
            } else {
                node.value = value;
                moveToHead(node);
            }
            return node;
        }

        private void moveToHead(externalsort.LRUBufferPool.Node node) {
            removeNode(node);
            addToHead(node);
        }

        private void removeNode(externalsort.LRUBufferPool.Node node) {
            node.prev.next = node.next;
            node.next.prev = node.prev;
        }

        private void addToHead(externalsort.LRUBufferPool.Node node) {
            node.next = head.next;
            node.prev = head;
            head.next.prev = node;
            head.next = node;
        }

        private void evictTail() throws IOException {
            externalsort.LRUBufferPool.Node tailNode = tail.prev;
            removeNode(tailNode);
            cache.remove(tailNode.key);
            if (tailNode.key != null && tailNode.value != null) {
                if (file != null) {
                    file.seek(tailNode.key);
                    file.write(tailNode.value);
                    diskWriteCounter++;
                } else {
                    throw new IllegalStateException("File object is null");
                }
            }
        }

        public void flush() throws IOException {
            for(externalsort.LRUBufferPool.Node entry : cache.values()) {
                file.seek(entry.key);
                file.write(entry.value);
                if(entry.dirty){
                    diskWriteCounter++;
                }
            }
        }

        static class Node {
            private final Long key;
            byte[] value;
            private externalsort.LRUBufferPool.Node prev;
            private externalsort.LRUBufferPool.Node next;
            private boolean dirty;

            public Node(Long key, byte[] value) {
                this.key = key;
                this.value = value;
            }
        }

    }//end of LRUBufferPool
    }

     */





