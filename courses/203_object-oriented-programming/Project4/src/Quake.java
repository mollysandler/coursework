import processing.core.PImage;
import java.util.List;

public class Quake extends AnimationEntity { //reviewed and confirmed done? the 0's are kinda sus
    private static final String QUAKE_ID = "quake";
    private static final int QUAKE_ANIMATION_REPEAT_COUNT = 10;

    public Quake(String quakeId, Point position, List<PImage> images) {
        super(quakeId, images, position, 0, 0);
    }

    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        scheduler.unscheduleAllEvents(this);
        world.removeEntity(this);
    }
    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this,
                this.createActivityAction(world, imageStore),
                this.getActionPeriod());
        scheduler.scheduleEvent(this,
                this.createAnimationAction(QUAKE_ANIMATION_REPEAT_COUNT),
                this.getAnimationPeriod());
    }

    public static Quake createQuake(Point position, List<PImage> images) {
        return new Quake(QUAKE_ID, position, images);
    }
}//end of class
