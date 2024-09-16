import processing.core.PImage;
import java.util.List;

public class Obstacle extends Entity { //reviewed and confirmed done
    public Obstacle(String id, Point position, List<PImage> images) {
        super(id, images, position);
    }

    public static Obstacle createObstacle(String id, Point position, List<PImage> images) {
        return new Obstacle(id, position, images);
    }

}//end of class
