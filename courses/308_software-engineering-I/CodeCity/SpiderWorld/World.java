import processing.core.PApplet;

import java.util.ArrayList;
import java.util.HashMap;


public final class World {
    public final PApplet screen;
    private final float leftPadding = 9;
    private final float topPadding = 143;
    private int numRows;
    private float tileWidth;
    private int bgColor;
    private HashMap <String, ArrayList <Point>> levelMap;

    public World(PApplet screen) {
        this.screen = screen;
    }

    public void setLevel( HashMap <String, ArrayList< Point>> level ) {
        levelMap = level;
    }

    public void readLevel() {
//        edit if level has different size or background color
        numRows = 5;
        tileWidth = 60;
        bgColor = screen.color( 110, 113, 132 );
    }

    public void drawGrid() {
        screen.fill( bgColor );
        screen.stroke( 204, 204, 204 );
        screen.rect( leftPadding, topPadding, tileWidth * numRows, tileWidth * numRows );
        for ( int row = 1; row < numRows; row++ ) {
            screen.line( leftPadding, topPadding + tileWidth * row,
                    leftPadding + tileWidth * numRows, topPadding + tileWidth * row );
        }
        for ( int col = 1; col < numRows; col++ ) {
            screen.line( leftPadding + tileWidth * col, topPadding,
                    leftPadding + tileWidth * col, topPadding + tileWidth * numRows );
        }
    }

    public void drawEntities() {
        screen.image( screen.loadImage
                ( "/Users/mollysandler/Documents/coursework-1/308/SpiderWorld2/images/spider_east.png" ),
                leftPadding, topPadding );
        screen.textSize( 12 );

        // draw red diamonds
        if ( levelMap.containsKey( "red" ) ) {
            screen.fill( screen.color( 255, 89, 94 ) );
            for ( Point P : levelMap.get( "red" ) ) {
                float diamondX = (float) ( leftPadding + tileWidth * ( P.getX() + .5 ) - 5 );
                float diamondY = (float) ( topPadding + tileWidth * ( P.getY() + .5 ) + 5 );
                screen.text('◆', diamondX, diamondY );
            }
        }
        // draw blue diamonds
        if ( levelMap.containsKey( "blue" ) ) {
            screen.fill( screen.color( 63, 166, 231 ) );
            for ( Point P : levelMap.get( "blue" ) ) {
                float diamondX = (float) ( leftPadding + tileWidth * ( P.getX() + .5 ) - 5 );
                float diamondY = (float) ( topPadding + tileWidth * ( P.getY() + .5 ) + 5 );
                screen.text('◆', diamondX, diamondY );
            }
        }
        // draw green diamonds
        if ( levelMap.containsKey( "green" ) ) {
            screen.fill( screen.color( 138, 201, 38 ) );
            for ( Point P : levelMap.get( "green" ) ) {
                float diamondX = (float) (leftPadding + tileWidth * ( P.getX() + .5 ) - 5);
                float diamondY = (float) ( topPadding + tileWidth * ( P.getY() + .5 ) + 5 );
                screen.text('◆', diamondX, diamondY );
            }
        }
    }

    public void drawWorld() {
        readLevel();
        drawGrid();
        drawEntities();
    }
}
