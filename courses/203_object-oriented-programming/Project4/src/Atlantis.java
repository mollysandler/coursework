import processing.core.PImage;
import java.util.List;

public class Atlantis extends AnimationEntity { //reviewed and confirmed done
    private static final int ATLANTIS_ANIMATION_REPEAT_COUNT = 7;

    public Atlantis(String id, Point position, List<PImage> images, int actionPeriod, int animationPeriod) {
        super(id, images, position, actionPeriod, animationPeriod);
    }

    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        scheduler.unscheduleAllEvents(this);
        world.removeEntity(this);
    }

    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this,
                this.createAnimationAction(ATLANTIS_ANIMATION_REPEAT_COUNT),
                this.getAnimationPeriod());
    }

    public static Atlantis createAtlantis(String id, Point position, List<PImage> images, int actionPeriod, int animationPeriod)
    {
        return new Atlantis(id, position, images, actionPeriod, animationPeriod);
    }

}//end of class
