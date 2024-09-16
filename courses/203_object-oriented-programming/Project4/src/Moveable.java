import processing.core.PImage;
import java.util.List;

public abstract class Moveable extends AnimationEntity{ //reviewed and confirmed done
    PathingStrategy pathingStrategy;

    public Moveable(String id, List<PImage> images, Point position, int actionPeriod, int animationPeriod, PathingStrategy strategy){
        super(id, images, position, actionPeriod, animationPeriod);
        this.pathingStrategy = strategy;
    }

    abstract boolean move(WorldModel world, Entity target, EventScheduler scheduler);
    abstract Point nextPosition(WorldModel world, Point destPos);
}//end of class

