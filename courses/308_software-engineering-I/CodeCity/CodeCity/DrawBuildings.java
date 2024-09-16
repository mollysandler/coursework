import processing.core.PApplet;
import java.util.HashMap;
import java.util.Map;

public class DrawBuildings extends PApplet {
    /**
     * @author riya badadare
     */

    private final int gridSize = 50; // size of each grid square
    private final int gridWidth = 10; // # of squares horizontally
    private final int gridHeight = 10; // # of squares vertically

    // to display a colored block at a specific grid location
    public void displayBuildingAtGridLocation(HashMap buildings, int gridX, int gridY,
                                              int colorR, int colorG, int colorB, int blockSize) {
        //System.out.println("hello display building");
        // debugging from thurs lab: when run from the driver, it gets to here and fails becuase
        buildings.put(gridX + "," + gridY, new int[]{colorR, colorG, colorB, blockSize});
    }

    // to parse coordinates from string
    public int[] parseCoordinates(String coord) {
        String[] parts = coord.split(",");
        return new int[]{Integer.parseInt(parts[0]), Integer.parseInt(parts[1])};
    }
}
