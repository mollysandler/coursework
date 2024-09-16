import processing.core.PImage;
import java.util.List;
import java.util.Random;

public class Barrel extends ActiveEntity { //reviewed and confirmed done
    private static final String SLUDGE_KEY = "sludge";

    private static final int SHRIMP_ANIMATION_MIN = 50;
    private static final int SHRIMP_ANIMATION_MAX = 150;
    private static final String SHRIMP_ID_SUFFIX = " -- shrimp";
    private static final int SHRIMP_PERIOD_SCALE = 4;

    private static final Random rand = new Random();

    public Barrel(String id, Point position, List<PImage> images, int actionPeriod) {
        super(id, images, position, actionPeriod);
    }

    public static Barrel createBarrel(String id, Point position, List<PImage> images) {
        return new Barrel(id, position, images, 0);
    }

    @Override
    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler) {
        Point pos = this.getPosition();  // store current position before removing
        Point pos1 = new Point(this.getPosition().x + 1, this.getPosition().y);
        Point pos2 = new Point(this.getPosition().x - 1, this.getPosition().y);
        Point pos3 = new Point(this.getPosition().x, this.getPosition().y + 1);
        Point pos4 = new Point(this.getPosition().x, this.getPosition().y - 1);

        Point pos5 = new Point(this.getPosition().x + 1, this.getPosition().y + 1);
        Point pos6 = new Point(this.getPosition().x + 1, this.getPosition().y - 1);
        Point pos7 = new Point(this.getPosition().x - 1 , this.getPosition().y + 1);
        Point pos8 = new Point(this.getPosition().x - 1, this.getPosition().y - 1);



        Sludge sludge1 = Sludge.createSludge(this.getId(), pos1, imageStore.getImageList(SLUDGE_KEY));
        Sludge sludge2 = Sludge.createSludge(this.getId(), pos2, imageStore.getImageList(SLUDGE_KEY));
        Sludge sludge3 = Sludge.createSludge(this.getId(), pos3, imageStore.getImageList(SLUDGE_KEY));
        Sludge sludge4 = Sludge.createSludge(this.getId(), pos4, imageStore.getImageList(SLUDGE_KEY));


        Shrimp shrimp1 = Shrimp.createShrimp(this.getId() + SHRIMP_ID_SUFFIX, pos5, 4000 / SHRIMP_PERIOD_SCALE,
                SHRIMP_ANIMATION_MIN + rand.nextInt(SHRIMP_ANIMATION_MAX - SHRIMP_ANIMATION_MIN),
                imageStore.getImageList(WorldModel.SHRIMP_KEY));
        Shrimp shrimp2 = Shrimp.createShrimp(this.getId() + SHRIMP_ID_SUFFIX, pos6, 4000 / SHRIMP_PERIOD_SCALE,
                SHRIMP_ANIMATION_MIN + rand.nextInt(SHRIMP_ANIMATION_MAX - SHRIMP_ANIMATION_MIN),
                imageStore.getImageList(WorldModel.SHRIMP_KEY));
        Shrimp shrimp3 = Shrimp.createShrimp(this.getId() + SHRIMP_ID_SUFFIX, pos7, 4000 / SHRIMP_PERIOD_SCALE,
                SHRIMP_ANIMATION_MIN + rand.nextInt(SHRIMP_ANIMATION_MAX - SHRIMP_ANIMATION_MIN),
                imageStore.getImageList(WorldModel.SHRIMP_KEY));
        Shrimp shrimp4 = Shrimp.createShrimp(this.getId() + SHRIMP_ID_SUFFIX, pos8, 4000 / SHRIMP_PERIOD_SCALE,
                SHRIMP_ANIMATION_MIN + rand.nextInt(SHRIMP_ANIMATION_MAX - SHRIMP_ANIMATION_MIN),
                imageStore.getImageList(WorldModel.SHRIMP_KEY));


        if (!world.isOccupied(pos1)) {
            world.addEntity(sludge1);
        }
        if (!world.isOccupied(pos2)) {
            world.addEntity(sludge2);
        }
        if (!world.isOccupied(pos3)) {
            world.addEntity(sludge3);
        }
        if (!world.isOccupied(pos4)) {
            world.addEntity(sludge4);
        }

        if (!world.isOccupied(pos5)) {
            world.addEntity(shrimp1);
            shrimp1.scheduleActions(scheduler, world, imageStore);

        }
        if (!world.isOccupied(pos6)) {
            world.addEntity(shrimp2);
            shrimp2.scheduleActions(scheduler, world, imageStore);

        }
        if (!world.isOccupied(pos7)) {
            world.addEntity(shrimp3);
            shrimp3.scheduleActions(scheduler, world, imageStore);

        }
        if (!world.isOccupied(pos8)) {
            world.addEntity(shrimp4);
            shrimp4.scheduleActions(scheduler, world, imageStore);
        }
    }

    @Override
    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore) {

    }

}//end of class

