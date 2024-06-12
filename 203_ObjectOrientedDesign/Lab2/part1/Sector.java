package part1;

import java.util.Map;

public class Sector {
    private String name;
    private Map<Integer, Double> emissions;

    public Sector(String transport, Map<Integer, Double> emissions) {
    }


    public String getName(){
        return name;
    }

    public Map<Integer, Double> getEmissions(){
        return emissions;
    }
}//end of sector
