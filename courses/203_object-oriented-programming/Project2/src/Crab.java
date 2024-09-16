import processing.core.PImage;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class Crab implements Moveable{
    private final String id;
    private final List<PImage> images;
    private int imageIndex;
    private Point position;
    private final int animationPeriod;
    private final int actionPeriod;
    private static final String QUAKE_KEY = "quake";

    public Crab(String id, Point position, int actionPeriod, int animationPeriod, List<PImage> images) {
        this.id = id;
        this.images = images;
        this.position = position;
        this.animationPeriod = animationPeriod;
        this.actionPeriod = actionPeriod;
    }

    @Override
    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        Optional<Entity> crabTarget = world.findNearest(this.position, Sgrass.class);
        long nextPeriod = this.actionPeriod;

        if (crabTarget.isPresent())
        {
            Point tgtPos = crabTarget.get().getPosition();

            if (this.move(world, crabTarget.get(), scheduler))
            {
                Quake quake = Quake.createQuake(tgtPos, imageStore.getImageList(QUAKE_KEY));

                world.addEntity(quake);
                nextPeriod += this.actionPeriod;
                quake.scheduleActions(scheduler, world, imageStore);
            }
        }

        scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), nextPeriod);
    }

    @Override
    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {
        scheduler.scheduleEvent(this, this.createActivityAction(world, imageStore), this.actionPeriod);
        scheduler.scheduleEvent(this, this.createAnimationAction(0), this.getAnimationPeriod());
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

    @Override
    public boolean move(WorldModel world, Entity target, EventScheduler scheduler) {
        if (this.position.adjacent(target.getPosition()))
        {
            world.removeEntity(target);
            scheduler.unscheduleAllEvents(target);
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

        Optional<Entity> occupant = world.getOccupant(newPos);

        if (horiz == 0 ||
                (occupant.isPresent() && !(occupant.get() instanceof Fish )))
        {
            int vert = Integer.signum(destPos.y - this.position.y);
            newPos = new Point(this.position.x, this.position.y + vert);
            occupant = world.getOccupant(newPos);

            if (vert == 0 ||
                    (occupant.isPresent() && !(occupant.get() instanceof Fish)))
            {
                newPos = this.position;
            }
        }

        return newPos;
    }


    public static Crab createCrab(String id, Point position, int actionPeriod, int animationPeriod, List<PImage> images )
    {
        return new Crab(id, position, actionPeriod, animationPeriod, images);
    }
}//end of class
