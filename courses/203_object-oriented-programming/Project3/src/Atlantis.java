import processing.core.PImage;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Atlantis extends AnimationEntity {
    private static final int ATLANTIS_ANIMATION_PERIOD = 70;
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
        return new Atlantis(id, position, images, 0, 0);
    }

}//end of classs
