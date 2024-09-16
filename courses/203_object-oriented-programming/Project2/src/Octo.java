import processing.core.PImage;

import java.util.List;

public interface Octo extends Moveable{
    public boolean transform(WorldModel world, EventScheduler scheduler, ImageStore imageStore);
}
