package part1;
import java.util.Map;

public class Util {
    public static int getYearWithHighestEmissions(Country country ){
        double highest = 0;
        int year = 0;
        for(Map.Entry <Integer, Emission> current : country.getEmissions().entrySet()) {
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

    public static int getYearWithHighestEmissions(Sector sector){
        double highest = 0;
        int year = 0;
        for(Map.Entry <Integer, Double> current : sector.getEmissions().entrySet()) {
            int y = current.getKey();
            double total = current.getValue();
            if(total > highest){
                highest = total;
                year = y;
            }//end of if

        }//end of for

        return year;

    }//end of sector

}//end of util
