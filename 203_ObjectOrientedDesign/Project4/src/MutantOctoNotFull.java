import processing.core.PImage;
import java.util.List;
import java.util.Optional;

public class MutantOctoNotFull extends Octo{ //reviewed and confirmed done
    private int resourceCount;
    private static final PathingStrategy OCTO_MOVEMENT = new AStarPathingStrategy();

    public MutantOctoNotFull(String id, List<PImage> images, int resourceLimit, Point position, int actionPeriod, int animationPeriod,
                       int resourceCount) {
        super(id, images, resourceLimit, position, actionPeriod, animationPeriod, OCTO_MOVEMENT);
        this.resourceCount = resourceCount;
    }


    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        Optional<Entity> notFullTarget = world.findNearest(this.getPosition(), Shrimp.class);

        if (notFullTarget.isEmpty() ||
                !this.move(world, notFullTarget.get(), scheduler) ||
                !this.transform(world, scheduler, imageStore))
        {
            scheduler.scheduleEvent(this,
                    this.createActivityAction(world, imageStore),
                    this.getActionPeriod());
        }
    }

    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.getActionPeriod());
        scheduler.scheduleEvent(this, this.createAnimationAction(0), this.getAnimationPeriod());
    }

    @Override
    public boolean move(WorldModel world, Entity target, EventScheduler scheduler) {
        if (this.getPosition().adjacent(target.getPosition()))
        {
            this.resourceCount += 1;
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

    public boolean transform(WorldModel world, EventScheduler scheduler, ImageStore imageStore) {
        if (this.resourceCount >= this.getResourceLimit())
        {
            MutantOctoFull octo = MutantOctoFull.createMutantOctoFull(this.getId(), this.getResourceLimit(),
                    this.getPosition(), 20, this.getAnimationPeriod(),
                    this.getImages());

            world.removeEntity(this);
            scheduler.unscheduleAllEvents(this);

            world.addEntity(octo);
            octo.scheduleActions(scheduler, world, imageStore);

            return true;
        }

        return false;
    }
    public static MutantOctoNotFull createMutantOctoNotFull(String id, int resourceLimit, Point position, int actionPeriod, int animationPeriod, List<PImage> images)
    {
        return new MutantOctoNotFull(id, images, resourceLimit, position, actionPeriod, animationPeriod, 0);
    }

}//end of class
