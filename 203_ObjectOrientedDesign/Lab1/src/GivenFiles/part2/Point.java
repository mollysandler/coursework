package GivenFiles.part2;

import java.lang.Math;
import static java.lang.Math.atan2;

public class Point { //define class
        private final double xcoord; //define private variables
        private final double ycoord;


        public Point(double A, double B) { //initialize
            this.xcoord = A;
            this.ycoord = B;
        }

        public double getX() { //get them for public
            return xcoord;
        }
        public double getY() {
            return ycoord;
    }

    public double getRadius() {
            return Math.sqrt( ((ycoord*ycoord) + (xcoord*xcoord)) ); //using distance formula
        }

        public double getAngle() {
            return (Math.atan2(ycoord, xcoord)); //using a math function
        }

        public Point rotate90() {
            return new Point(-ycoord, xcoord);

            /*
            this.setX(-ycoord); //make x negative y
            this.setY(xcoord); //make y x
            return new Point(xcoord,ycoord);*/
        }
} //end of point


