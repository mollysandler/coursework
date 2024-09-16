package test;
import tictactoe.Board;
import tictactoe.Player;
import static org.testng.AssertJUnit.assertEquals;
import org.junit.Test;

public class Tests {
    Player current = new Player("molly", 'x'); //player used for all the tests
    char [][] coords; //defines coords for all the tests

    @Test
    public void testWinCol() {
        Board board = new Board(3);
        coords = new char[][]{{'x', ' ', ' '}, {'x', ' ', ' '}, {'x', ' ', ' '}};
        board.setBoardCoords(coords);
        board.checkCol(1, current);
        assertEquals(board.getState(), 1);
    }

    @Test
    public void testWinDiag() {
        Board board = new Board(3);
        coords = new char[][]{{'x', ' ', ' '}, {' ', 'x', ' '}, {' ', ' ', 'x'}};
        board.setBoardCoords(coords);
        board.checkDiag(current);
        assertEquals(board.getState(), 1);
    }
    @Test
    public void testWinAnti()  {
        Board board = new Board(3);
        coords = new char[][]{{' ', ' ', 'x'}, {' ', 'x', ' '}, {'x', ' ', ' '}};
        board.setBoardCoords(coords);
        board.checkAnti(current);
        assertEquals(board.getState(), 1);
    }

    @Test
    public void testWinRow() {
        Board board = new Board(3);
        coords = new char[][]{{'x', 'x', 'x'}, {' ', ' ', ' '}, {' ', ' ', ' '}};
        board.setBoardCoords(coords);
        for(int i = 0; i < board.getSize(); i++){
            board.checkRow(board.getBoardCoords()[i], current);
        }
        assertEquals(board.getState(), 1);
    }

}//end of tests class

