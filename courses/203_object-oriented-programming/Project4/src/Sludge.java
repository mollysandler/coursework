import processing.core.PImage;
import java.util.List;

public class Sludge extends Entity{ //reviewed and confirmed done
        private static final String SLUDGE_ID = "sludge";

        public Sludge(String id, List<PImage> images, Point position) {
            super(SLUDGE_ID, images, position);
        }

        public static Sludge createSludge(String id, Point position, List<PImage> images) {
            return new Sludge(SLUDGE_ID, images, position);
        }
    }//end of class

