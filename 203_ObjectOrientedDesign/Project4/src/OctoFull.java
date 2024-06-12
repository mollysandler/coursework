import processing.core.PImage;
import java.util.List;
import java.util.Optional;

public class OctoFull extends Octo{ //reviewed and confirmed done
    private static final PathingStrategy OCTO_MOVEMENT = new SingleStepPathingStrategy();
    private static final int MOCTO_ACTION_PERIOD = 5;
    private static final int MOCTO_ANIMATION_PERIOD = 6;

    public OctoFull(String id, int resourceLimit, Point position,  int actionPeriod, int animationPeriod, List<PImage> images) {
            super(id, images, resourceLimit, position, actionPeriod, animationPeriod, OCTO_MOVEMENT);
    }

    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        MutantOctoFull mut1 = new MutantOctoFull(WorldModel.MOCTO_KEY, imageStore.getImageList(WorldModel.MOCTO_KEY),
                this.getResourceLimit(), this.getPosition(),
                MOCTO_ACTION_PERIOD, MOCTO_ANIMATION_PERIOD);

        Optional<Entity> fullTarget = world.findNearest(this.getPosition(), Atlantis.class);
        Optional<Entity> nearestSludge = world.findNearest(this.getPosition(), Sludge.class);

        if (nearestSludge.isPresent()) {
            if (this.getPosition().adjacent(nearestSludge.get().getPosition())) {
                scheduler.unscheduleAllEvents(this);
                world.removeEntity(this);

                world.addEntity(mut1);
                mut1.scheduleActions(scheduler, world, imageStore);
            }
        }

            if (fullTarget.isPresent() &&
                    this.move(world, fullTarget.get(), scheduler)) {
                //at atlantis trigger animation
                ((Atlantis) fullTarget.get()).scheduleActions(scheduler, world, imageStore);

                //transform to unfull
                this.transform(world, scheduler, imageStore);
            }
            else {
                scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.getActionPeriod());
            }//end of else
    }//end of method

    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.getActionPeriod());
        scheduler.scheduleEvent(this, this.createAnimationAction( 0), this.getAnimationPeriod());
    }

        public boolean move(WorldModel world, Entity target, EventScheduler scheduler) {
            if (this.getPosition().adjacent(target.getPosition()))
            {
                return true;
            }
            else {
                Point nextPos = this.nextPosition(world, target.getPosition());

                if (!this.getPosition().equals(nextPos)) {
                    Optional<Entity> occupant = world.getOccupant(nextPos);
                    occupant.ifPresent(scheduler::unscheduleAllEvents);

                    world.moveEntity(this, nextPos);
                }
                return false;
            }
        }

        public boolean transform(WorldModel world, EventScheduler scheduler, ImageStore imageStore) {
        OctoNotFull octo = OctoNotFull.createOctoNotFull(this.getId(), this.getResourceLimit(),
                this.getPosition(), this.getActionPeriod(), this.getAnimationPeriod(), this.getImages());
        world.removeEntity(this);
        scheduler.unscheduleAllEvents(this);

        world.addEntity(octo);
        octo.scheduleActions(scheduler, world, imageStore);
        return true;
    }


    public static OctoFull createOctoFull(String id, int resourceLimit, Point position, int actionPeriod, int animationPeriod, List<PImage> images)
    {
        return new OctoFull(id, resourceLimit, position, actionPeriod, animationPeriod, images);
    }

}//end of class