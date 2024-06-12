package part3;

import java.util.ArrayList;
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

    public int getYearWithHighestEmissions(){
        double highest = 0;
        int year = 0;
        for(Map.Entry <Integer, Double> current : this.getEmissions().entrySet()) {
            int y = current.getKey();
            double total = current.getValue();
            if(total > highest){
                highest = total;
                year = y;
            }//end of if
        }//end of for

        return year;

    }//end of sector function

    private Sector getAverageEmissions(int startYear, int endYear) {
        List<Double> dataPoints = new ArrayList<>();
        double currentEmissions = 0.0;
        for (int year = startYear; year <= endYear; year++) {
            if (this.emissions.containsKey(year)) {
                currentEmissions = this.emissions.get(year);
            }
            dataPoints.add(currentEmissions);
        }

        double totalEmissions = 0.0;
        for (double dataPoint : dataPoints) {
            totalEmissions += dataPoint;
        }
        return totalEmissions / dataPoints.size();

        public static Sector sectorWithBiggestChangeInEmissions(List<Sector> sectors, int sYear, int eYear)   {
        double highestAverage = 0.0;
        Sector highestSector = null;
        for (Sector sector : sectors) {
            Sector sectorAverage = sector.getAverageEmissions(sYear, eYear);
            if (sectorAverage > highestAverage) {
                highestAverage = sectorAverage;
                highestSector = sector;
            }
        }
        return highestSector;
    }

    }
}
