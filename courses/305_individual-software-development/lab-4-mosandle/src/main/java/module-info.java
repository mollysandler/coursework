module com.example.lab4tictactoegui {
    requires javafx.controls;
    requires javafx.fxml;
    requires org.testng;
    requires junit;


    opens tictactoe to javafx.fxml;
    exports tictactoe;
    exports test;
}