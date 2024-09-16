package externalsort;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class LinkedList <T> {
    private Node<T> head;
    private Node<T> tail;
    private int size;

    private static class Node<T> {
        T data;
        Node<T> prev;
        Node<T> next;

        Node(T data) {
            this.data = data;
            this.prev = null;
            this.next = null;
        }
    }

    public void add(T data) {
        Node<T> newNode = new Node<>(data);
        if (head == null) {
            head = newNode;
        } else {
            newNode.prev = tail;
            tail.next = newNode;
        }
        tail = newNode;
        size++;
    }

    public boolean remove(T data) {
        if (head == null) {
            return false;
        }

        if (head.data.equals(data)) {
            head = head.next;
            if (head != null) {
                head.prev = null;
            } else {
                tail = null;
            }
            size--;
            return true;
        }

        if (tail.data.equals(data)) {
            tail = tail.prev;
            if (tail != null) {
                tail.next = null;
            } else {
                head = null;
            }
            size--;
            return true;
        }

        Node<T> current = head;
        while (current != null) {
            if (current.data.equals(data)) {
                current.prev.next = current.next;
                current.next.prev = current.prev;
                size--;
                return true;
            }
            current = current.next;
        }

        return false;
    }

    public int size() {
        return size;
    }

    public void displayForward() {
        Node<T> current = head;
        while (current != null) {
            System.out.print(current.data + " ");
            current = current.next;
        }
        System.out.println();
    }

    public void moveToStart(Node <T> node) {
        if (node == null || node == head) {
            return; // if node is head or null
        }

        if (node == tail) { //if node is tail
            tail = node.prev;
            tail.next = null;
        } else {
            node.prev.next = node.next;
            node.next.prev = node.prev;
        }

        node.prev = null;
        node.next = head;
        head.prev = node;
        head = node;
    }
/*
    public static class BufferPool implements RawDataInterface{
        RawDataInterface file;

        private int cacheHitCounter;
        private int cacheMissCounter;
        private int diskReadCounter;
        private int diskWriteCounter;

        private final int capacity;
        private final Map<Long, Node> cache;
        private final Node head;
        private final Node tail;

        public LRUBufferPool(int capacity, RawDataInterface file) {
            this.file = file;
            this.capacity = capacity;
            this.cache = new HashMap<>();
            this.head = new Node(null, null);
            this.tail = new Node(null, null);
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

        public Map<Long, Node> getCache() {
            return cache;
        }

        public int getCacheHitCounter() { return cacheHitCounter; }

        public int getCacheMissCounter() { return cacheMissCounter; }

        public int getDiskReadCounter() { return diskReadCounter; }

        public int getDiskWriteCounter() { return diskWriteCounter; }

        public byte[] retrieve(Long key) throws IOException {
            long blockIndex = key / 4096;
            Node node = cache.get(blockIndex);
            if (node == null) {
                file.seek(blockIndex * 4096);
                byte[] readIn = new byte[4096];
                file.read(readIn);
                cacheMissCounter++;
                diskReadCounter++;
                node = put(blockIndex, readIn);
            } else {
                cacheHitCounter++;
            }

            byte[] value = new byte[4];
            moveToHead(node);
            return value;
        }

        public Node put(Long key, byte[] value) throws IOException {
            long blockIndex = key / 4096;
            Node node = cache.get(blockIndex);
            if (node == null) {
                if (cache.size() >= capacity) {
                    evictTail();
                }

                node = new Node(key, value);
                cache.put(key, node); //cache put not recursion put
                addToHead(node);
            } else {
                node.value = value;
                moveToHead(node);
            }
            return node;
        }

        private void moveToHead(Node node) {
            removeNode(node);
            addToHead(node);
        }

        private void removeNode(Node node) {
            node.prev.next = node.next;
            node.next.prev = node.prev;
        }

        private void addToHead(Node node) {
            node.next = head.next;
            node.prev = head;
            head.next.prev = node;
            head.next = node;
        }

        private void evictTail() throws IOException {
            Node tailNode = tail.prev;
            removeNode(tailNode);
            cache.remove(tailNode.key);
            if (tailNode.key != null && tailNode.value != null) {
                if (file != null) {
                    file.seek(tailNode.key * 4096);
                    file.write(tailNode.value);
                    diskWriteCounter++;
                } else {
                    throw new IllegalStateException("File object is null");
                }
            }
        }

        public void flush() throws IOException {
            for(Node entry : cache.values()) {
                file.seek(entry.key * 4096);
                file.write(entry.value);
                diskWriteCounter++;
            }
        }

        static class Node {
            private final Long key;
            byte[] value;
            private Node prev;
            private Node next;

            public Node(Long key, byte[] value) {
                this.key = key;
                this.value = value;
            }
        }

    }//end of LRUBufferPool

 */
}//end of linkedList class
