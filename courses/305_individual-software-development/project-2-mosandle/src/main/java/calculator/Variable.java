package calculator;
import java.util.*;

public class Variable implements Expression {
    private final String name;
    private final Map<String, Double> environment;

    /**
     *
     * @param name String of entered variable name
     * @param environment Map of variable name, variable value pair
     */
    public Variable(String name, Map<String, Double> environment) {
        this.name = name;
        this.environment = environment;
    }

    /**
     *
     * @return double value associated with variable name
     */
    @Override
    public double evaluate() {
        return environment.get(name);
    }

    /**
     *
     * @return String of variable name
     */
    @Override
    public String toString() {
        return this.name;
    }
}
