import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;

class LoadLevels {

    // Keeping track of current level
    private int curLevel;

    // Constructor
    public LoadLevels (int level) {
        this.curLevel = level;
    }

    /*
    // Making HashMap from Points
    public HashMap<String, Point> makeMap(Point coordB, Point coordR, Point coordG) {
        HashMap<String, Point> map = new HashMap<String, Point>();

        map.put("blue", coordB);
        map.put("red", coordR);
        map.put("green", coordG);

        return map;
    }*/

    public void setLevel(int level){
         this.curLevel = level ;
    }
    public int getLevel(){
        return this.curLevel;
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
