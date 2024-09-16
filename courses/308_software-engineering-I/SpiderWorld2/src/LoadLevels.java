import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
/**
 * @author aayush joshi
 */
class LoadLevels {

    // Keeping track of current level
    private final int curLevel;

    // Constructor
    public LoadLevels (int level) {
        this.curLevel = level;
    }

    // Making levels with given coordinates, and saving it in local files
    public void saveHashMap(HashMap<String, ArrayList<Point>> map) {
        String fileName = "level" + this.curLevel;

        try (FileOutputStream fos = new FileOutputStream(fileName);
             ObjectOutputStream oos = new ObjectOutputStream(fos)) {
            oos.writeObject(map);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Loading existing level file
    public HashMap<String, ArrayList<Point>> loadHashMap() {
        String fileName = "level" + this.curLevel;
        HashMap<String, ArrayList<Point>> map = null;

        try (FileInputStream fis = new FileInputStream(fileName);
             ObjectInputStream ois = new ObjectInputStream(fis)) {
            map = (HashMap<String, ArrayList<Point>>) ois.readObject();
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return map;
    }
}
