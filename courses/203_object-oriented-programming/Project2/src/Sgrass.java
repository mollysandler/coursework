import processing.core.PImage;

import java.util.*;

public class Sgrass implements ActiveEntity {
    private final String id;
    private final List<PImage> images;
    private int imageIndex;
    private Point position;
    private final int actionPeriod;
    private static final String FISH_ID_PREFIX = "fish -- ";
    private static final int FISH_CORRUPT_MIN = 20000;
    private static final int FISH_CORRUPT_MAX = 30000;
    private static final Random rand = new Random();

    public Sgrass(String id, Point position, List<PImage> images, int actionPeriod) {
        this.id = id;
        this.position = position;
        this.actionPeriod = actionPeriod;
        this.images = images;
    }

    @Override
    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        Optional<Point> openPt = world.findOpenAround(this.position);

        if (openPt.isPresent())
        {
            Fish fish = Fish.createFish(FISH_ID_PREFIX + this.id,
                    openPt.get(), FISH_CORRUPT_MIN +
                            rand.nextInt(FISH_CORRUPT_MAX - FISH_CORRUPT_MIN),
                    imageStore.getImageList(WorldModel.FISH_KEY));
            world.addEntity(fish);
            fish.scheduleActions(scheduler, world, imageStore);
        }

        scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.actionPeriod);
    }

    @Override
    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this,
                this.createActivityAction(world, imageStore),
                this.actionPeriod);
    }

    @Override
    public Action createActivityAction(WorldModel world, ImageStore imageStore) {
        return new ActivityAction(this, world, imageStore);

    }

    @Override
    public Point getPosition() {
        return this.position;
    }

    @Override
    public void setPosition(Point position) {
        this.position = position;
    }

    @Override
    public int getActionPeriod() {
        return this.actionPeriod;
    }

    @Override
    public PImage getCurrentImage() {
        return this.images.get(this.imageIndex);
    }

    @Override
    public void nextImage() {
        this.imageIndex = (this.imageIndex + 1) % this.images.size();

    }

    @Override
    public List<PImage> getImages(Map<String, List<PImage>> images, String key) {
        List<PImage> imgs = images.get(key);
        if (imgs == null) {
            imgs = new LinkedList<>();
            images.put(key, imgs);
        }
        return imgs;
    }

    public static Entity createSgrass(String id, Point position, int actionPeriod, List<PImage> images)
    {
        return new Sgrass(id, position, images, actionPeriod);
    }
}//end of class
