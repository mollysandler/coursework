package test;
import main.Board;
import main.Player;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;


public class tests { //test class
    Player current = new Player("molly", 'x'); //player used for all the tests
    char [][] coords; //defines coords for all the tests

    @Test
    //         * tests if a win is returned correctly when 3 down is made
    public void testWinCol() {
        Board board = new Board(3);
        coords = new char[][]{{'x', ' ', ' '}, {'x', ' ', ' '}, {'x', ' ', ' '}};
        board.setBoardCoords(coords);
        board.checkCol(1, current);
        assertEquals(board.getState(), 1);
    }

    @Test
    //         * tests if a win is returned correctly when 3 diagonal is made
    public void testWinDiag() {
        Board board = new Board(3);
        coords = new char[][]{{'x', ' ', ' '}, {' ', 'x', ' '}, {' ', ' ', 'x'}};
        board.setBoardCoords(coords);
        board.checkDiag(current);
        assertEquals(board.getState(), 1);
    }
    @Test
    //tests if a win is returned correctly when 3 antidiagonal is made
    public void testWinAnti()  {
        Board board = new Board(3);
        coords = new char[][]{{' ', ' ', 'x'}, {' ', 'x', ' '}, {'x', ' ', ' '}};
        board.setBoardCoords(coords);
        board.checkAnti(current);
        assertEquals(board.getState(), 1);
    }

    @Test
    //         * tests if a win is returned correctly when 3 across is made
    public void testWinRow() {
        Board board = new Board(3);
        coords = new char[][]{{'x', 'x', 'x'}, {' ', ' ', ' '}, {' ', ' ', ' '}};
        board.setBoardCoords(coords);

        for(int i = 0; i < board.getSize(); i++){
            board.checkRow(board.getBoardCoords()[i], current);
        }
        assertEquals(board.getState(), 1);
    }

    @Test
    //* tests if a draw is returned correctly when all spaces are filled with no 3's
    public void testDraw()  {
        Board board = new Board(3);
        coords = new char[][]{{' ', ' ', 'x'}, {' ', ' ', 'x'}, {'x', ' ', ' '}};
        board.setBoardCoords(coords);
        board.checkWins(1, current);
        assertEquals(board.getState(), 0);
    }

}//end of tests class
