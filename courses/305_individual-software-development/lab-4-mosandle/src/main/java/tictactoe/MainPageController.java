package tictactoe;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.layout.VBox;
import javafx.scene.layout.GridPane;
import javafx.scene.control.Button;
import javafx.scene.text.Text;

public class MainPageController {
    @FXML
    private VBox game;
    @FXML
    private GridPane gridpane;
    @FXML
    private Text mainText;

    Board board = new Board(3);
    private final Player player1 = new Player("molly", 'X');
    private final Player player2 = new Player("molly", '0');
    int turnCount; //nobody has gone yet

    public void handleStartNewGame(ActionEvent actionEvent) {
        turnCount = 0;
        this.game.setVisible(true);
        this.resetGrid();

    }//end of new game starter

    @FXML
    public void initialize() {
        turnCount = 0;
        for (int i = 0; i < this.gridpane.getColumnCount(); i++) {
            for (int j = 0; j < this.gridpane.getRowCount(); j++) {
                // Create a new Button with no text
                Button button = new Button(""); //makes a button in each spot of the board
                button.setMaxWidth(Integer.MAX_VALUE); //makes the button wide
                button.setOnAction(this::buttonHandle);
                this.gridpane.add(button, i, j); //add button to the window
                board.getBoardCoords()[i][j] = '\0';
            }
        }
    }//end of initialize

    private void buttonHandle(ActionEvent e) {
        Player current;
        String playerSymbol;

        if (turnCount % 2 == 0) {
            current = player1;
        } else {
            current = player2;
        }

        mainText.setText("Current player: " + current.getSymbol());

        // Now you don't have direct access to the button, so you
        // need to "obtain" it.
        Button clicked = (Button) e.getSource(); // get the thing that was clicked
        int row = GridPane.getRowIndex(clicked);
        int column = GridPane.getColumnIndex(clicked);
        // Find the row and column in the GridPane that this button appears in

        playerSymbol = String.valueOf(current.getSymbol());
        String finalPlayerSymbol = playerSymbol;

        if(board.getBoardCoords()[row][column] == '\0'){
            clicked.setText(finalPlayerSymbol); //lambda dynamic button adding
            board.getBoardCoords()[row][column] = current.getSymbol();
            whoWins(column + 1, current); //row does not work...?
            turnCount++;
        } else{
            mainText.setText("This is full. Try again.");
        }
    }

    private void whoWins(int i, Player current) {
        if (board.checkWins(i, current)){
            mainText.setText("Player " + current.getSymbol() + " has won!");
            board = new Board(3);
            this.gridpane.setDisable(true);
        } else if(turnCount == 8){
            mainText.setText("This is a draw!");
            board = new Board(3);
            this.gridpane.setDisable(true);
        }
    }

    //used at the end to clear the buttons and start over
    private void resetGrid() {
        this.gridpane.getChildren().stream().filter(Button.class::isInstance)
                .map(n -> (Button) n)
                .forEach(b -> b.setText(""));
        this.gridpane.setDisable(false);
    }//end of reset grid
}