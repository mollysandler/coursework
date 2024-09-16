import processing.core.PImage;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public abstract class Entity {
    private final String id;
    private final List<PImage> images;
    private int imageIndex;
    private Point position;

    public Entity(String id, List<PImage> images, Point position){
        this.id = id;
        this.images = images;
        this.position = position;
    }

    public String getId() {
        return id;
    }

    public Point getPosition() {
        return position;
    }

    public void setPosition(Point position) {
        this.position = position;
    }

    public PImage getCurrentImage() {
        return this.images.get(this.imageIndex);
    }

    public void nextImage() {
        this.imageIndex = (this.imageIndex + 1) % this.images.size();
    }

    public List<PImage> getImages() {
        return new ArrayList<>(this.images);
    }
}//end of class
