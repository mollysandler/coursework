import processing.core.PImage;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Quake implements AnimationEntity {
    private final String id;
    private final List<PImage> images;
    private int imageIndex;
    private Point position;
    private final int animationPeriod = 0;
    private final int actionPeriod = 0;
    private static final String QUAKE_KEY = "quake";
    private static final String QUAKE_ID = "quake";
    private static final int QUAKE_ACTION_PERIOD = 1100;
    private static final int QUAKE_ANIMATION_PERIOD = 100;
    private static final int QUAKE_ANIMATION_REPEAT_COUNT = 10;

    public Quake(String quakeId, Point position, List<PImage> images) {
        this.id = quakeId;
        this.position = position;
        this.images = images;
    }


    @Override
    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        scheduler.unscheduleAllEvents(this);
        world.removeEntity(this);
    }

    @Override
    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this,
                this.createActivityAction(world, imageStore),
                this.actionPeriod);
        scheduler.scheduleEvent(this,
                this.createAnimationAction(QUAKE_ANIMATION_REPEAT_COUNT),
                this.getAnimationPeriod());
    }

    @Override
    public Action createActivityAction(WorldModel world, ImageStore imageStore) {
        return new ActivityAction(this, world, imageStore);
    }

    @Override
    public Action createAnimationAction(int repeatCount) {
        return new AnimationAction(this, repeatCount);
    }

    @Override
    public int getAnimationPeriod() {
        return this.animationPeriod;
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


    public static Quake createQuake(Point position, List<PImage> images) {
        return new Quake(QUAKE_ID, position, images);
    }
}//end of class
