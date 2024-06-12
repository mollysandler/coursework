import processing.core.PImage;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Atlantis implements AnimationEntity{
    private final String id;
    private final List<PImage> images;
    private int imageIndex;
    private Point position;
    private final int animationPeriod;
    private final int actionPeriod;
    private static final int ATLANTIS_ANIMATION_PERIOD = 70;
    private static final int ATLANTIS_ANIMATION_REPEAT_COUNT = 7;

    public Atlantis(String id, Point position, List<PImage> images, int actionPeriod, int animationPeriod) {
        this.id = id;
        this.position = position;
        this.images = images;
        this.animationPeriod = animationPeriod;
        this.actionPeriod = actionPeriod;
    }

    @Override
    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        scheduler.unscheduleAllEvents(this);
        world.removeEntity(this);
    }

    @Override
    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this,
                this.createAnimationAction(ATLANTIS_ANIMATION_REPEAT_COUNT),
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
        return animationPeriod;
    }

    @Override
    public Point getPosition() {
        return position;
    }

    @Override
    public void setPosition(Point position) {
        this.position = position;
    }

    @Override
    public int getActionPeriod() {
        return actionPeriod;
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
        if (imgs == null)
        {
            imgs = new LinkedList<>();
            images.put(key, imgs);
        }
        return imgs;
    }

    public static Atlantis createAtlantis(String id, Point position, List<PImage> images, int actionPeriod, int animationPeriod)
    {
        return new Atlantis(id, position, images, 0, 0);
    }

}//end of classs
