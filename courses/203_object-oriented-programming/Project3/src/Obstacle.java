import processing.core.PImage;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Obstacle extends Entity {
    public Obstacle(String id, Point position, List<PImage> images) {
        super(id, images, position);
    }

    public static Obstacle createObstacle(String id, Point position, List<PImage> images) {
        return new Obstacle(id, position, images);
    }

}//end of class
