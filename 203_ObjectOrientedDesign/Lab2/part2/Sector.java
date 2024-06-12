package part2;

import java.util.List;
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

    public int getYearWithHighestEmissions(){ //done i think
        double highest = 0;
        int year = 0;
        for(Map.Entry <Integer, Double> current : this.emissions.entrySet()) {
            int y = current.getKey();
            double total = current.getValue();
            if(total > highest){
                highest = total;
                year = y;
            }//end of if

        }//end of for

        return year;

    }//end of sector function


}//end of class
