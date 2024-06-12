import processing.core.PImage;
import java.util.List;
import java.util.Random;

public class Fish extends ActiveEntity{ //reviewed and confirmed done
    private static final int CRAB_ANIMATION_MIN = 50;
    private static final int CRAB_ANIMATION_MAX = 150;

    private static final String CRAB_KEY = "crab";
    private static final String CRAB_ID_SUFFIX = " -- crab";
    private static final int CRAB_PERIOD_SCALE = 4;
    private static final Random rand = new Random();


    public Fish(String id, Point position, int actionPeriod, List<PImage> images) {
        super(id, images, position, actionPeriod);
    }

    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        Point pos = this.getPosition();  // store current position before removing

        world.removeEntity(this);
        scheduler.unscheduleAllEvents(this);

        Crab crab = Crab.createCrab(this.getId() + CRAB_ID_SUFFIX, imageStore.getImageList(CRAB_KEY), pos, this.getActionPeriod() / CRAB_PERIOD_SCALE,
                CRAB_ANIMATION_MIN + rand.nextInt(CRAB_ANIMATION_MAX - CRAB_ANIMATION_MIN));

        world.addEntity(crab);
        crab.scheduleActions(scheduler, world, imageStore);
    }

    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this,
                this.createActivityAction(world, imageStore),
                this.getActionPeriod());
    }


    public static Fish createFish(String id, Point position, int actionPeriod, List<PImage> images) {
        return new Fish(id, position, actionPeriod, images);
    }
}//end of class
