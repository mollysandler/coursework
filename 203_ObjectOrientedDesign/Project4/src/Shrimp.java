import processing.core.PImage;
import java.util.List;
import java.util.Optional;

public class Shrimp extends Moveable {  //reviewed and confirmed done
    private static final PathingStrategy SHRIMP_MOVEMENT = new AStarPathingStrategy();

    public Shrimp(String id, List<PImage> images, Point position, int actionPeriod, int animationPeriod) {
        super(id, images, position, actionPeriod, animationPeriod, SHRIMP_MOVEMENT);
    }

    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        Optional<Entity> notFullTarget = world.findNearest(this.getPosition(), Sgrass.class);

        if (notFullTarget.isEmpty() ||
                !this.move(world, notFullTarget.get(), scheduler)) {

            scheduler.scheduleEvent(this,
                    this.createActivityAction(world, imageStore),
                    this.getActionPeriod());
        }
    }

        public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.getActionPeriod());
        scheduler.scheduleEvent(this, this.createAnimationAction( 0), this.getAnimationPeriod());
    }

    public boolean move(WorldModel world, Entity target, EventScheduler scheduler) {
        if (this.getPosition().adjacent(target.getPosition()))
        {
            world.removeEntity(target);
            scheduler.unscheduleAllEvents(target);
            return false;
        }
        else
        {
            Point nextPos = this.nextPosition(world, target.getPosition());

            if (!this.getPosition().equals(nextPos))
            {
                Optional<Entity> occupant = world.getOccupant(nextPos);
                occupant.ifPresent(scheduler::unscheduleAllEvents);

                world.moveEntity(this, nextPos);
            }
            return false;
        }
    }

    public Point nextPosition(WorldModel world, Point destPos) {
        List<Point> path = pathingStrategy.computePath(this.getPosition(), destPos,
                p -> world.withinBounds(p) && (!(world.getOccupancyCell(p) instanceof Entity)),
                Point::neighbors,
                PathingStrategy.CARDINAL_NEIGHBORS);
        if (path.size() == 0) {
            return this.getPosition();
        } else {
            return path.get(0);
        }
    }

    public static Shrimp createShrimp(String id, Point position, int actionPeriod, int animationPeriod, List<PImage> images)
    {
        return new Shrimp(id, images, position, actionPeriod, animationPeriod);
    }

}//end of class