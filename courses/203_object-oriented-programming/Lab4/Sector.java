import java.util.*;

public class Sector implements GreenhouseGasEmitter{

    private final String name;
    private final Map <Integer, Double> emissions;

    public Sector(String name, Map<Integer, Double> emissions) {
        this.name = name;
        this.emissions = emissions;
    }

    public Sector(String name) {
        this.name = name;
        this.emissions = new HashMap<>();
    }

    public String toString() {
        return this.name;
    }

    public String getName() {
        return name;
    }

    @Override
    public double getTotalEmissionsInYear(int year) {
        return emissions.get(year);
    }

    public Map<Integer, Double> getEmissions() {
        return emissions;
    }

    public double getAverageEmissions(int startYear, int endYear) {
        List<Double> dataPoints = new ArrayList<>();
        double currentEmissions = 0.0;
        for (int year = startYear; year <= endYear; year++) {
            if (this.emissions.containsKey(year)) {
                currentEmissions = this.emissions.get(year);
            }
            dataPoints.add(currentEmissions);
        }

        return dataPoints.stream().mapToDouble(d -> d).sum() / dataPoints.size();
    }

    public int getYearWithHighestEmissions() {
        return this.getEmissions().entrySet().stream()
                .max(Comparator.comparingDouble(Map.Entry::getValue))
                .orElseThrow()
                .getKey();
    }

    public static Sector sectorWithBiggestChangeInEmissions(List<Sector> sectors, int startYear, int endYear) {
        return sectors.stream()
                .max(Comparator.comparingDouble(s -> s.getAverageEmissions(startYear, endYear)))
                .orElseThrow();
    }

}//end of class
