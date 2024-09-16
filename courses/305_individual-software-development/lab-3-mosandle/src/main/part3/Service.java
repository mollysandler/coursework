package main.part3;

public class Service {

	private final Database database;

    public Service(Database database) {
        this.database = database;
    }

    public boolean query(String query) {
        return database.isAvailable();
    }

    public String getDatabaseID() {
        return "Using database with id: " + String.valueOf(database.getUniqueId());
    }
}
