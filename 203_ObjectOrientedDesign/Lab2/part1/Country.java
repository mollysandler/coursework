package part1;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Country {
    private String country;
    private Map <Integer, Emission> emissions;

    public Country(String country, Map<Integer, Emission> emissions) {
    }


    public String getName(){
        return country;
    }

    public Map<Integer, Emission> getEmissions(){
        return emissions;
    }
}


