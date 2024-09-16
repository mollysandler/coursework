package calculator.project2calculatorgui;
import java.util.*;
import calculator.*;
import javafx.collections.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.util.*;
import javafx.event.*;
import javafx.fxml.FXML;
import javafx.scene.layout.*;
import javafx.scene.control.*;

public class HelloController {
    @FXML
    private GridPane gridpane;
    @FXML
    private TextField textfield;
    @FXML
    private TextField varName;
    @FXML
    private TextField varValue;
    @FXML
    private Button varCalc;
    @FXML
    private Button calculate;
    @FXML
    private RadioButton postfix;
    @FXML
    TableView <TableViewVariable> table;
    @FXML
    TableColumn<TableViewVariable, String> listName;
    @FXML
    TableColumn<TableViewVariable, Double> listValue;

    @FXML
    private ComboBox<Expression> history = new ComboBox<>();
    private final ArrayList<Expression> historyList = new ArrayList<>();
    private final HashMap<String, Double> environment = new HashMap<>();

    ObservableList<TableViewVariable> data = FXCollections.observableArrayList();


    private boolean isAResult;
    private Parser parserType;
    private static final String NEW_EQUATION = "please try again.";
    private static final String ZERO_EQUATION = "you can't divide by zero.";
    private static final String BAD_VARIABLE = "This is not a valid value for a variable";
    private static final String SPACE = "SPACE";
    private final String[] buttonList =
            {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "+", "-", "*", "/", "^", "%", SPACE};

    @FXML
    public void initialize() {
        for (int i = 0; i < this.gridpane.getColumnCount(); i++) {
            for (int j = 0; j < this.gridpane.getRowCount(); j++) {
                // Create a new Button with no text
                Button button = new Button(buttonList[j * 3 + i]); //makes a button in each spot of the board
                button.setMaxWidth(Integer.MAX_VALUE); //makes the button wide
                button.setOnAction(this::buttonHandle);
                this.gridpane.add(button, i, j); //add button to the window
            }
        }

        history.valueProperty().addListener((obs, oldVal, newVal) -> {
            if (newVal != null) {
                System.out.println(parserType);
                textfield.setText(parserType.toString(newVal));
                isAResult = false;
            }
        });

        history.setConverter(new StringConverter<Expression>() {

            @Override
            public String toString(Expression object){
                return parserType.toString(object);
            }
            @Override //needed for stringConverter
            public Expression fromString(String string){
                return null;
            }
        });

        listName.setCellValueFactory(new PropertyValueFactory<>("name"));
        listValue.setCellValueFactory(new PropertyValueFactory<>("value"));

        postfix.selectedProperty().addListener((obs, oldVal, newVal) -> {
            updateParser();
            updateHistoryList();
        });

        table.getSelectionModel().getSelectedItems().addListener((ListChangeListener<TableViewVariable>) change -> {
            for (TableViewVariable item : table.getSelectionModel().getSelectedItems()) {
                textfield.setText(textfield.getText() + item.getName());
            }
        });

        calculate.setOnAction(this::calcButtonHandle);
        varCalc.setOnAction(this::defineVariables);
    }//end of initialize

    /**
     *
     * @param e buttonClick actionEvent of operator or operand
     */
    private void buttonHandle(ActionEvent e) {
        Button clicked = (Button) e.getSource(); // get the thing that was clicked

        if(isAResult){
            textfield.setText("");
            isAResult = false;
        }
        if(!clicked.getText().equals(SPACE)){
            textfield.setText(textfield.getText() + clicked.getText());
        } else{
            textfield.setText(textfield.getText() + " ");
        }
    }

    /**
     *
     * @param e buttonClick actionEvent of calculate button
     */
    private void calcButtonHandle(ActionEvent e) {
        String equation = textfield.getText();
        Tree tree;
        try {
            updateParser();
            tree = new Tree(equation, parserType, environment);
            historyList.add(tree.getRoot());
            updateHistoryList();
        } catch (IllegalArgumentException m){
            textfield.setText(NEW_EQUATION);
            isAResult = true;
            return;
        }

        try {
            textfield.setText(Double.toString(tree.doMath()));

        } catch (ArithmeticException a) {
            textfield.setText(ZERO_EQUATION);

        }
        isAResult = true;
    }

    /**
     *
     * @param e Text entered into variable text-fields
     */
    private void defineVariables(ActionEvent e) {
        table.setVisible(true);
        String name = varName.getText();
        double value;
        String pattern = "[a-zA-Z_]\\w*";

        if(!name.matches(pattern)){
            textfield.setText(BAD_VARIABLE);
            isAResult = true;
            return;
        }

        try {
            value = Double.parseDouble(varValue.getText());
            environment.put(name, value);
            TableViewVariable tableEntry = new TableViewVariable(name, value);
            for(TableViewVariable vars: table.getItems()){
                if(vars.getName().equals(name)){
                    vars.setValue(value);
                    table.refresh();
                    return;
                }
            }
            table.getItems().add(tableEntry);
        } catch (NumberFormatException l) {
            textfield.setText(BAD_VARIABLE);
            isAResult = true;
        }
    }

    private void updateHistoryList() {
        history.setItems(FXCollections.observableArrayList(historyList));
    }

    private void updateParser() {
        if (postfix.isSelected()) {
            parserType = new Postfix();
        } else {
            parserType = new Prefix();
        }
    }


}//end of controller class