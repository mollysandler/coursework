import java.util.List;
import processing.core.PImage;

final class Background //reviewed and confirmed done
{
   private String id;
   private final List<PImage> images;
   private int imageIndex;

   public Background(String id, List<PImage> images)
   {
      this.id = id;
      this.images = images;
   }

   public PImage getCurrentImage()
   {
      return ((Background)this).images
              .get(((Background)this).imageIndex);
   }





}//end of class
