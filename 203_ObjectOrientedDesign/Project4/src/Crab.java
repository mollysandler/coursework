import processing.core.PImage;
import java.util.List;
import java.util.Optional;


public class Crab extends  Moveable{ //reviewed and confirmed done

    private static final String QUAKE_KEY = "quake";
    private static final PathingStrategy CRAB_MOVEMENT = new AStarPathingStrategy();

    public Crab(String id, List<PImage> images, Point position, int actionPeriod, int animationPeriod) {
        super(id, images, position, actionPeriod, animationPeriod, CRAB_MOVEMENT);
    }

    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        Optional<Entity> crabTarget = world.findNearest(this.getPosition(), Sgrass.class);
        long nextPeriod = this.getActionPeriod();

        if (crabTarget.isPresent())
        {
            Point tgtPos = crabTarget.get().getPosition();
            if (this.move(world, crabTarget.get(), scheduler))
            {
                Quake quake = Quake.createQuake(tgtPos, imageStore.getImageList(QUAKE_KEY));

                world.addEntity(quake);
                nextPeriod += this.getActionPeriod();
                quake.scheduleActions(scheduler, world, imageStore);
            }
        }

        scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), nextPeriod);
    }

    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.getActionPeriod());
        scheduler.scheduleEvent(this, this.createAnimationAction(0), this.getAnimationPeriod());
    }

    public boolean move(WorldModel world, Entity target, EventScheduler scheduler) {
        if (this.getPosition().adjacent(target.getPosition()))
        {
            world.removeEntity(target);
            scheduler.unscheduleAllEvents(target);
            return true;
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
                (p1, p2) -> Point.neighbors(p1, p2),
                PathingStrategy.CARDINAL_NEIGHBORS);
        if (path.size() == 0) {
            return this.getPosition();
        } else {
            return path.get(0);
        }
    }

    public static Crab createCrab(String id, List<PImage> images, Point position, int actionPeriod, int animationPeriod)
    {
        return new Crab(id, images, position, actionPeriod, animationPeriod);
    }

}//end of class
