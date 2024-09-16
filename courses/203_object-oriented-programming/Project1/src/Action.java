/*
Action: ideally what our various entities might do in our virutal world
 */

final class Action
{

   private final ActionKind kind;
   private final Entity entity;
   private final WorldModel world;
   private final ImageStore imageStore;
   private final int repeatCount;

   public Action(ActionKind kind, Entity entity, WorldModel world,
      ImageStore imageStore, int repeatCount)
   {
      this.kind = kind;
      this.entity = entity;
      this.world = world;
      this.imageStore = imageStore;
      this.repeatCount = repeatCount;
   }

   public void executeAction(EventScheduler scheduler) //moved in uml
   {
      switch (this.kind)
      {
         case ACTIVITY:
            this.executeActivityAction(scheduler);
            break;

         case ANIMATION:
            this.executeAnimationAction(scheduler);
            break;
      }
   }

   private void executeAnimationAction(EventScheduler scheduler)
   {
      this.entity.nextImage();

      if (this.repeatCount != 1)
      {
         scheduler.scheduleEvent(this.entity,
                 this.entity.createAnimationAction(Math.max(this.repeatCount - 1, 0)),
                 this.entity.getAnimationPeriod());
      }
   }

   private void executeActivityAction(EventScheduler scheduler)
   {
      switch (this.entity.getKind()) {
         case OCTO_FULL -> this.entity.executeOctoFullActivity(this.world,
                 this.imageStore, scheduler);
         case OCTO_NOT_FULL -> this.entity.executeOctoNotFullActivity(this.world,
                 this.imageStore, scheduler);
         case FISH -> this.entity.executeFishActivity(this.world, this.imageStore,
                 scheduler);
         case CRAB -> this.entity.executeCrabActivity(this.world,
                 this.imageStore, scheduler);
         case QUAKE -> this.entity.executeQuakeActivity(this.world, this.imageStore,
                 scheduler);
         case SGRASS -> this.entity.executeSgrassActivity(this.world, this.imageStore,
                 scheduler);
         case ATLANTIS -> this.entity.executeAtlantisActivity(this.world, this.imageStore,
                 scheduler);
         default -> throw new UnsupportedOperationException(
                 String.format("executeActivityAction not supported for %s",
                         this.entity.getKind()));
      }
   }
}//end of class
