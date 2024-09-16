/*
Action: ideally what our various entities might do in our virutal world
 */

final class ActivityAction implements Action {

   private final ActiveEntity entity;
   private final WorldModel world;
   private final ImageStore imageStore;

   public ActivityAction(ActiveEntity entity, WorldModel world, ImageStore imageStore) {
      this.entity = entity;
      this.world = world;
      this.imageStore = imageStore;
   }

   public void executeAction(EventScheduler scheduler) {
      entity.executeActivity(world, imageStore, scheduler);
   }

}//end of class
