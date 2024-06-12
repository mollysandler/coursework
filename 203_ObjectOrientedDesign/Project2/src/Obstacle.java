import processing.core.PImage;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class Obstacle implements Entity{
    private final String id;
    private final List<PImage> images;
    private int imageIndex;
    private Point position;
    private final int actionPeriod = 0;

    public Obstacle(String id, Point position, List<PImage> images) {
        this.id = id;
        this.position = position;
        this.images = images;
    }


    @Override
    public Point getPosition() {
        return this.position;
    }

    @Override
    public void setPosition(Point position) {
        this.position = position;
    }

    @Override
    public int getActionPeriod() {
        return this.actionPeriod;
    }

    @Override
    public PImage getCurrentImage() {
        return this.images.get(this.imageIndex);

    }

    @Override
    public void nextImage() {
        this.imageIndex = (this.imageIndex + 1) % this.images.size();

    }

    @Override
    public List<PImage> getImages(Map<String, List<PImage>> images, String key) {
        List<PImage> imgs = images.get(key);
        if (imgs == null) {
            imgs = new LinkedList<>();
            images.put(key, imgs);
        }
        return imgs;
    }

    public static Obstacle createObstacle(String id, Point position, List<PImage> images) {
        return new Obstacle(id, position, images);
    }
}//end of class
