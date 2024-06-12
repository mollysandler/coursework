import processing.core.PImage;
import java.util.List;
import java.util.Optional;

public class OctoNotFull extends Octo{ //reviewed and confirmed done
    private int resourceCount;
    private static final PathingStrategy OCTO_MOVEMENT = new AStarPathingStrategy();
    private static final int MOCTO_ACTION_PERIOD = 5;
    private static final int MOCTO_ANIMATION_PERIOD = 6;

    public OctoNotFull(String id, int resourceLimit, Point position, int actionPeriod, int animationPeriod, List<PImage> images,
                       int resourceCount) {
        super(id, images, resourceLimit, position, actionPeriod, animationPeriod, OCTO_MOVEMENT);
        this.resourceCount = resourceCount;
    }


    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        MutantOctoNotFull mut1 = new MutantOctoNotFull(WorldModel.MOCTO_KEY, imageStore.getImageList(WorldModel.MOCTO_KEY),
                this.getResourceLimit(), this.getPosition(),
                MOCTO_ACTION_PERIOD, MOCTO_ANIMATION_PERIOD, this.resourceCount);

        Optional<Entity> notFullTarget = world.findNearest(this.getPosition(), Fish.class);
        Optional<Entity> nearestSludge = world.findNearest(this.getPosition(), Sludge.class);


        if (nearestSludge.isPresent()) {
            if (this.getPosition().adjacent(nearestSludge.get().getPosition())) {
                scheduler.unscheduleAllEvents(this);
                world.removeEntity(this);

                world.addEntity(mut1);
                mut1.scheduleActions(scheduler, world, imageStore);
            }
        }

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
            OctoFull octo = OctoFull.createOctoFull(this.getId(), this.getResourceLimit(),
                    this.getPosition(), this.getActionPeriod(), this.getAnimationPeriod(),
                    this.getImages());

            world.removeEntity(this);
            scheduler.unscheduleAllEvents(this);

            world.addEntity(octo);
            octo.scheduleActions(scheduler, world, imageStore);

            return true;
        }

        return false;
    }
    public static OctoNotFull createOctoNotFull(String id, int resourceLimit, Point position, int actionPeriod, int animationPeriod, List<PImage> images)
    {
        return new OctoNotFull(id, resourceLimit, position, actionPeriod, animationPeriod, images, 0);
    }

}//end of class
