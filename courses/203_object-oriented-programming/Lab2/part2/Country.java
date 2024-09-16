package part2;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Country {
    private String country;
    private Map <Integer, Emission> emissions;

    public Country(String key, Map<Integer, Emission> value) {
    }


    public String getName(){
        return country;
    }

    public Map<Integer, Emission> getEmissions(){
        return emissions;
    }


    public int getYearWithHighestEmissions(){
        double highest = 0;
        int year = 0;
        for(Map.Entry<Integer, Emission> current : this.emissions.entrySet()) {
            Emission e = current.getValue();
            int y = current.getKey();
            double total = e.getCO2() + e.getN2O() + e.getCH4();
            if(total > highest){
                highest = total;
                year = y;
            }//end of if

        }//end of for

        return year;
    }//end of country


}//end of class