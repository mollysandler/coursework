import processing.core.PImage;
import java.util.*;

public class Sgrass extends ActiveEntity { //reviewed and confirmed done
    private static final String FISH_ID_PREFIX = "fish -- ";
    private static final int FISH_CORRUPT_MIN = 20000;
    private static final int FISH_CORRUPT_MAX = 30000;
    private static final Random rand = new Random();

    public Sgrass(String id, List<PImage> images, Point position, int actionPeriod) {
        super(id, images, position, actionPeriod);
    }

    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        Optional<Point> openPt = world.findOpenAround(this.getPosition());

        if (openPt.isPresent())
        {
            Fish fish = Fish.createFish(FISH_ID_PREFIX + this.getId(),
                    openPt.get(), FISH_CORRUPT_MIN +
                            rand.nextInt(FISH_CORRUPT_MAX - FISH_CORRUPT_MIN),
                    imageStore.getImageList(WorldModel.FISH_KEY));
            world.addEntity(fish);
            fish.scheduleActions(scheduler, world, imageStore);
        }

        scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.getActionPeriod());
    }

    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this,
                this.createActivityAction(world, imageStore),
                this.getActionPeriod());
    }

    public static Sgrass createSgrass(String id, List<PImage> images, Point position, int actionPeriod)
    {
        return new Sgrass(id, images, position, actionPeriod);
    }
}//end of class
