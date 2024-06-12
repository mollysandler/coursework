package Lab7;
import java.util.List;
import java.util.ArrayList;
import java.util.LinkedList;
import processing.core.PApplet;
import processing.core.PImage;
import java.util.Stack;

public class PathingMain extends PApplet {
   private List<PImage> imgs;
   private int current_image;
   private long next_time;
   private PImage background;
   private PImage obstacle;
   private PImage goal;
   private List<Point> path;

   private static final int TILE_SIZE = 32;
   private static final int ANIMATION_TIME = 100;

   private GridValues[][] grid;
   private static final int ROWS = 15;
   private static final int COLS = 20;

   private static enum GridValues { BACKGROUND, OBSTACLE, GOAL, SEARCHED };

   private Point wPos;

   private boolean drawPath = false;

	public void settings() {
      size(640,480);
	}
	
	/* runs once to set up world */
   public void setup()    { //dont touch

      path = new LinkedList<>();
      wPos = new Point(2, 2);
      imgs = new ArrayList<>();
      imgs.add(loadImage("images/wyvern1.bmp"));
      imgs.add(loadImage("images/wyvern2.bmp"));
      imgs.add(loadImage("images/wyvern3.bmp"));

      background = loadImage("images/grass.bmp");
      obstacle = loadImage("images/vein.bmp");
      goal = loadImage("images/water.bmp");

      grid = new GridValues[ROWS][COLS];
      initialize_grid(grid);

      current_image = 0;
      next_time = System.currentTimeMillis() + ANIMATION_TIME;
      noLoop();
      draw();
   }

	/* set up a 2D grid to represent the world */
   private static void initialize_grid(GridValues[][] grid)    { //dont touch
      for (int row = 0; row < grid.length; row++)
      {
         for (int col = 0; col < grid[row].length; col++)      {
            grid[row][col] = GridValues.BACKGROUND;
         }
      }

		//set up some obstacles
      for (int row = 2; row < 8; row++)      {
         grid[row][row + 5] = GridValues.OBSTACLE;
      }

      for (int row = 8; row < 12; row++)       {
         grid[row][19 - row] = GridValues.OBSTACLE;
      }

      for (int col = 1; col < 8; col++)       {
         grid[11][col] = GridValues.OBSTACLE;
      }

      grid[13][14] = GridValues.GOAL;
   }

   private void next_image()    {
      current_image = (current_image + 1) % imgs.size();
   } //dont touch


	/* runs over and over */
   public void draw()    { //dont touch
      // A simplified action scheduling handler
      long time = System.currentTimeMillis();
      if (time >= next_time)       {
         next_image();
         next_time = time + ANIMATION_TIME;
      }

      draw_grid();
      draw_path();

      image(imgs.get(current_image), wPos.x * TILE_SIZE, wPos.y * TILE_SIZE);
   }

   private void draw_grid()    { //dont touch
      for (int row = 0; row < grid.length; row++)
      {
         for (int col = 0; col < grid[row].length; col++)
         {
            draw_tile(row, col);
         }
      }
   }

   private void draw_path()    { //dont touch
      if (drawPath)       {
         for (Point p : path)          {
            fill(128, 0, 0);
            rect(p.x * TILE_SIZE + TILE_SIZE * 3 / 8,
               p.y * TILE_SIZE + TILE_SIZE * 3 / 8,
               TILE_SIZE / 4, TILE_SIZE / 4);
         }
      }
   }

   private void draw_tile(int row, int col)    { //dont touch
      switch (grid[row][col])       {
         case BACKGROUND:
            image(background, col * TILE_SIZE, row * TILE_SIZE);
            break;
         case OBSTACLE:
            image(obstacle, col * TILE_SIZE, row * TILE_SIZE);
            break;
         case SEARCHED:
            fill(0, 128);
            rect(col * TILE_SIZE + TILE_SIZE / 4,
               row * TILE_SIZE + TILE_SIZE / 4,
               TILE_SIZE / 2, TILE_SIZE / 2);
            break;
         case GOAL:
            image(goal, col * TILE_SIZE, row * TILE_SIZE);
            break;
      }
   }

   public static void main(String args[])    {
      PApplet.main("Lab7.PathingMain");
   } //dont touch

   public void keyPressed()    { //dont touch
      if (key == ' ')       {
			//clear out prior path
         path.clear();
			//example - replace with dfs	
         moveOnce(wPos, grid, path);
      }
      else if (key == 'p')       {
         drawPath ^= true;
         redraw();
      }
   }

	/* replace the below with a depth first search 
		this code provided only as an example of moving in
		in one direction for one tile - it mostly is for illustrating
		how you might test the occupancy grid and add nodes to path!
	*/
   private boolean moveOnce(Point pos, GridValues[][] grid, List<Point> path)    { //edit
      //System.out.println(path);
      try {
         Thread.sleep(200);
      } catch (Exception e) {}
      redraw();

      boolean node = false;

      //test if current pos is within bounds, not an obstacle, and not searched
      if (withinBounds(pos, grid) && grid[pos.y][pos.x] != GridValues.OBSTACLE && grid[pos.y][pos.x] != GridValues.SEARCHED) {

         //test if current pos is the goal
         if (grid[pos.y][pos.x] == GridValues.GOAL) {
            node = true;

         }
         //if not the goal
         else {

            //set current value as searched
            grid[pos.y][pos.x] = GridValues.SEARCHED;

            Point rightN = new Point(pos.x + 1, pos.y);
            Point downN = new Point(pos.x, pos.y + 1);
            Point leftN = new Point(pos.x - 1, pos.y);
            Point upN = new Point(pos.x, pos.y - 1);

            //give it move instructions in the order of RDLU like we are told to do
            node = moveOnce(rightN, grid, path)
                    || moveOnce(downN, grid, path)
                    || moveOnce(leftN, grid, path)
                    || moveOnce(upN, grid, path);
         }

      } //end of if statement about if pos is valid

      //if node is set as true, add it to the path
      if (node) {
         //System.out.print(pos);
         path.add(pos);
      }

      //return node
      return node;

      //Point rightN = new Point(pos.x + 1, pos.y);
      //Point downN = new Point(pos.x, pos.y + 1);
      //Point leftN = new Point(pos.x - 1, pos.y );
      //Point upN = new Point(pos.x, pos.y - 1);

      //Stack<Point> stack = new Stack();

      //if(grid[pos.x][pos.y] == GridValues.GOAL){
       //  path.add(0, pos);
         //return true;
      //}
     // if(withinBounds(upN, grid) || grid[upN.x][upN.y] != GridValues.SEARCHED || grid[upN.x][upN.y] != GridValues.OBSTACLE ) {
       //  stack.push(upN);
     // }
      //if(withinBounds(leftN, grid) || grid[leftN.x][leftN.y] != GridValues.SEARCHED || grid[leftN.x][leftN.y] != GridValues.OBSTACLE ) {
         //stack.push(leftN);
      //}
      //if(withinBounds(downN, grid) || grid[downN.x][downN.y] != GridValues.SEARCHED || grid[downN.x][downN.y] != GridValues.OBSTACLE ) {
        // stack.push(downN);
      //}
      //if(withinBounds(rightN, grid) || grid[rightN.x][rightN.y] != GridValues.SEARCHED || grid[rightN.x][rightN.y] != GridValues.OBSTACLE ) {
        // stack.push(rightN);
      //}

      //path.add(0, pos);
      //moveOnce(rightN, grid, path);
      //moveOnce(downN, grid, path);
      //moveOnce(leftN, grid, path);
     // moveOnce(upN, grid, path);
      //return true;
//
//      //test if this is a valid grid cell
//		if (withinBounds(rightN, grid)  &&
//         grid[rightN.y][rightN.x] != GridValues.OBSTACLE &&
//         grid[rightN.y][rightN.x] != GridValues.SEARCHED)    {
//
//			//check if my right neighbor is the goal
//           if (grid[rightN.y][rightN.x] == GridValues.GOAL) {
//         	path.add(0, rightN);
//         	return true;
//      	    }
//			//set this value as searched
//      	    grid[rightN.y][rightN.x] = GridValues.SEARCHED;
//           path.add(0, rightN);
//           moveOnce(rightN, grid, path);
//           return true;
//        }//end of big if
//
//
//      //test if this is a valid grid cell
//      else if (withinBounds(downN, grid)  &&
//              grid[downN.y][downN.x] != GridValues.OBSTACLE &&
//              grid[downN.y][downN.x] != GridValues.SEARCHED)    {
//
//         //check if my left neighbor is the goal
//         if (grid[downN.y][downN.x] == GridValues.GOAL) {
//            path.add(0, downN);
//            return true;
//         }
//         //set this value as searched
//         grid[downN.y][downN.x] = GridValues.SEARCHED;
//           path.add(0, downN);
//           moveOnce(downN, grid, path);
//           return true;
//
//        }
//
//      //test if this is a valid grid cell
//      else if (withinBounds(leftN, grid)  &&
//              grid[leftN.y][leftN.x] != GridValues.OBSTACLE &&
//              grid[leftN.y][leftN.x] != GridValues.SEARCHED)    {
//
//         //check if my left neighbor is the goal
//         if (grid[leftN.y][leftN.x] == GridValues.GOAL) {
//            path.add(0, leftN);
//            //System.out.println(leftN);
//            return true;
//         }
//         //set this value as searched
//         grid[leftN.y][leftN.x] = GridValues.SEARCHED;
//           path.add(0, leftN);
//           moveOnce(leftN, grid, path);
//           return true;
//
//        }
//
//      //test if this is a valid grid cell
//      else if (withinBounds(upN, grid)  &&
//              grid[upN.y][upN.x] != GridValues.OBSTACLE &&
//              grid[upN.y][upN.x] != GridValues.SEARCHED)    {
//
//         //check if my left neighbor is the goal
//         if (grid[upN.y][upN.x] == GridValues.GOAL) {
//            path.add(0, upN);
//            //System.out.println(upN);
//
//            return true;
//         }
//         //set this value as searched
//         grid[upN.y][upN.x] = GridValues.SEARCHED;
//           path.add(0, upN);
//           moveOnce(upN, grid, path);
//           return true;
//
//        }
//      return false;
//

   }//end of move!!!

   private static boolean withinBounds(Point p, GridValues[][] grid)    { //dont touch
      return p.y >= 0 && p.y < grid.length &&
         p.x >= 0 && p.x < grid[0].length;
   }
}