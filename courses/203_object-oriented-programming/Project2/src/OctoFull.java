import processing.core.PImage;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class OctoFull implements Octo{
    private final String id;
    private final List<PImage> images;
    private int imageIndex;
    private Point position;
    private final int resourceLimit;
    private final int animationPeriod;
    private final int actionPeriod;

    public OctoFull(String id, Point position, List<PImage> images, int resourceLimit, int resourceLimit1, int actionPeriod, int animationPeriod) {
        this.id = id;
        this.images = images;
        this.position = position;
        this.resourceLimit = resourceLimit;
        this.animationPeriod = animationPeriod;
        this.actionPeriod = actionPeriod;
    }

    @Override
    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
            Optional<Entity> fullTarget = world.findNearest(this.position, Atlantis.class);

            if (fullTarget.isPresent() &&
                    this.move(world, fullTarget.get(), scheduler))
            {
                //at atlantis trigger animation
                ((Atlantis) fullTarget.get()).scheduleActions(scheduler, world, imageStore);

                //transform to unfull
                this.transform(world, scheduler, imageStore);
            }
            else
            {
                scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.actionPeriod);
            }
        }

    @Override
    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.actionPeriod);
        scheduler.scheduleEvent(this, this.createAnimationAction( 0), this.getAnimationPeriod());
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

    @Override
    public boolean move(WorldModel world, Entity target, EventScheduler scheduler) {
        if (this.position.adjacent(target.getPosition()))
        {
            return true;
        }
        else
        {
            Point nextPos = this.nextPosition(world, target.getPosition());

            if (!this.position.equals(nextPos))
            {
                Optional<Entity> occupant = world.getOccupant(nextPos);
                occupant.ifPresent(scheduler::unscheduleAllEvents);

                world.moveEntity(this, nextPos);
            }
            return false;
        }
    }

    @Override
    public Point nextPosition(WorldModel world, Point destPos) {
        int horiz = Integer.signum(destPos.x - this.position.x);
        Point newPos = new Point(this.position.x + horiz,
                this.position.y);

        if (horiz == 0 || world.isOccupied(newPos))
        {
            int vert = Integer.signum(destPos.y - this.position.y);
            newPos = new Point(this.position.x,
                    this.position.y + vert);

            if (vert == 0 || world.isOccupied(newPos))
            {
                newPos = this.position;
            }
        }

        return newPos;
    }

    @Override
    public boolean transform(WorldModel world, EventScheduler scheduler, ImageStore imageStore) {
        OctoNotFull octo = OctoNotFull.createOctoNotFull(this.id, this.resourceLimit, this.position, this.actionPeriod, this.animationPeriod, this.images);
        world.removeEntity(this);
        scheduler.unscheduleAllEvents(this);

        world.addEntity(octo);
        octo.scheduleActions(scheduler, world, imageStore);
        return true;
    }


    public static OctoFull createOctoFull(String id, int resourceLimit, Point position, int actionPeriod, int animationPeriod, List<PImage> images)
    {
        return new OctoFull(id, position, images, resourceLimit, resourceLimit, actionPeriod, animationPeriod);
    }
}//end of class