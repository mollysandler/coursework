/*
Helper For Lab 8
*/
import processing.core.*;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.io.PrintWriter;

public class drawPoints extends PApplet {
	static String file;

	public void settings() {
    size(500, 500);
	}
  
	public void setup() {
    	background(180);
    	noLoop();
  	}

  	public void draw() {
		List<Point> stuff = null;
		try {
			stuff = getPoints();

		} catch (IOException e) {
			e.printStackTrace();
		}

		assert stuff != null;
		List<Point> newPoint = stuff.stream().filter(z -> z.getZ() <= 2.0)
					.map(x -> new Point((x.getX() * .5) - 150,
							(x.getY() * .5) - 37, (x.getZ() * .5))).toList();
			for(Point point: newPoint){
				ellipse((float) point.getX(), (float) point.getY(), 1, 1);
			}
  	}

	  public List<Point> getPoints() throws IOException {

		ArrayList<Point> points = new ArrayList<>();

		  String[] lines = loadStrings(file);

		  double x, y, z;

		  for(String line: lines) {
			  if (line.length() > 0) {
				  String[] words = line.split(",");
				  x = Double.parseDouble(words[0]);
				  y = Double.parseDouble(words[1]);
				  z = Double.parseDouble(words[2]);
				  Point point = new Point(x, y, z);
				  points.add(point);

			  }//end of if

		  }//end of for

		  FileWriter file = new FileWriter("drawMe.txt");
		  PrintWriter write = new PrintWriter(file);
		  for(Point point: points){
			  write.println(point.getX() + "," + point.getY() + "," + point.getZ());
		  }
		  write.close();


		  return points;

	}//end of method

	public static void main (String args[]){
		if(args.length >= 1){
			file = args[0];
		}
				  PApplet.main("drawPoints");
			  }//end of main
}//end of class
