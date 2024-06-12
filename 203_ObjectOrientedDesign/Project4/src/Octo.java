import processing.core.PImage;
import java.util.List;

public abstract class Octo extends Moveable{ //reviewed and confirmed done
    private final int resourceLimit;

    public Octo(String id, List<PImage> images, int resourceLimit, Point position, int actionPeriod,
                int animationPeriod, PathingStrategy strategy) {
        super(id, images, position, actionPeriod, animationPeriod, strategy);
        this.resourceLimit = resourceLimit;
    }

    public int getResourceLimit(){
        return this.resourceLimit;
    }

    public Point nextPosition(WorldModel world, Point destPos) {
        List<Point> path = pathingStrategy.computePath(this.getPosition(), destPos,
                p -> world.withinBounds(p) && (!(world.getOccupancyCell(p) instanceof Entity)),
                (p1, p2) -> Point.neighbors(p1, p2),
                PathingStrategy.CARDINAL_NEIGHBORS);
        if (path.size() == 0) {
            return this.getPosition();
        } else {
            return path.get(0);
        }
    }

    public abstract boolean transform(WorldModel world, EventScheduler scheduler, ImageStore imageStore);
    public abstract boolean move(WorldModel world, Entity target, EventScheduler scheduler);

    }//end of class
