import processing.core.PImage;
import java.util.List;
import java.util.Optional;

public class MutantOctoFull extends Octo{ //reviewed and confirmed done
    private static final PathingStrategy OCTO_MOVEMENT = new AStarPathingStrategy();

    public MutantOctoFull(String id, List<PImage> images, int resourceLimit, Point position,  int actionPeriod, int animationPeriod) {
        super(id, images, resourceLimit, position, actionPeriod, animationPeriod, OCTO_MOVEMENT);
    }

    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        Optional<Entity> fullTarget = world.findNearest(this.getPosition(), Atlantis.class);

        if (fullTarget.isPresent() &&
                this.move(world, fullTarget.get(), scheduler))
        {
            //at atlantis trigger animation
            ((Atlantis) fullTarget.get()).scheduleActions(scheduler, world, imageStore);

            //transform to unfull
            this.transform(world, scheduler, imageStore);
        }
        else
        {
            scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.getActionPeriod());
        }
    }

    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.getActionPeriod());
        scheduler.scheduleEvent(this, this.createAnimationAction( 0), this.getAnimationPeriod());
    }

    public boolean move(WorldModel world, Entity target, EventScheduler scheduler) {
        if (this.getPosition().adjacent(target.getPosition()))
        {
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
        MutantOctoNotFull octo = MutantOctoNotFull.createMutantOctoNotFull(this.getId(), this.getResourceLimit(),
                this.getPosition(), 20, this.getAnimationPeriod(), this.getImages());
        world.removeEntity(this);
        scheduler.unscheduleAllEvents(this);

        world.addEntity(octo);
        octo.scheduleActions(scheduler, world, imageStore);
        return true;
    }


    public static MutantOctoFull createMutantOctoFull(String id, int resourceLimit, Point position, int actionPeriod, int animationPeriod, List<PImage> images)
    {
        return new MutantOctoFull(id, images, resourceLimit, position, actionPeriod, animationPeriod);
    }
}//end of class