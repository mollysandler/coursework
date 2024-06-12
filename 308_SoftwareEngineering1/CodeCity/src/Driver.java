import org.json.JSONObject;
import java.util.*;
import processing.core.PApplet;

/**
 * @author molly sandler
 */


public class Driver extends PApplet {
    private final int gridSize = 70; // size of each grid square
    private final int gridWidth = 10; // # of squares horizontally
    private final int gridHeight = 10; // # of squares vertically
    private HashMap<String, int[]> buildings = new HashMap<>(); // to store block color and size
    private final DrawBuildings build = new DrawBuildings();
    private final Builder builder = new Builder();

    @Override
    public void settings() {
        size(gridWidth * gridSize, gridHeight * gridSize);
    }

    @Override
    public void setup() {
        System.out.println(buildings);

        JSONObject classes = Parsing.loadData("/Users/mollysandler/Documents/coursework-1/308/CodeCity/SpiderWorld");
        //System.out.println(classes);
        builder.addFromJSON(classes);
        //System.out.println(classes);
        System.out.println(builder.getBuildings());

        for (BuildingNode bn : builder.getBuildings()) {
            build.displayBuildingAtGridLocation(buildings, bn.displayPos.getX(),
                    bn.displayPos.getY(), bn.getColor()[0], bn.getColor()[1], bn.getColor()[2], bn.getDisplayLength());
        }
    }

        @Override
        public void draw () {
            background(255, 255, 255);
            buildings.forEach((key, info) -> {
                fill(info[0], info[1], info[2]);
                int[] coords = build.parseCoordinates(key);
                rect(coords[0] * gridSize, coords[1] * gridSize, info[3] * gridSize, info[3] * gridSize);
            });
        }

        public static void main (String[]args){
            GitClone gitClone = new GitClone("git@github.com:mollysandler/SpiderWorld.git");
            gitClone.cloneRepo();
            PApplet.main("Driver");
        }
    }
