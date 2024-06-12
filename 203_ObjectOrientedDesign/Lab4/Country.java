import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Country implements GreenhouseGasEmitter{

    private final String name;
    private final Map<Integer, Emission> emissions;

    private static class YearPair {
        public int year1;
        public int year2;
    }

    public Country(String name, Map<Integer, Emission> emissions) {
        this.name = name;
        this.emissions = emissions;
    }

    public Country(String name) {
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
    public double getTotalEmissionsInYear(int year) { //this is not right!!
       Emission total = emissions.get(year);
        return total.getTotal();
    }

    public Map<Integer, Emission> getEmissions() {
        return emissions;
    }

    public int getYearWithHighestEmissions() {
        return this.getEmissions().entrySet().stream()
                .max(Comparator.comparingDouble(c -> c.getValue().getTotal()))
                .orElseThrow()
                .getKey();
    }

    public double getDelta(int startYear, int endYear) {
        return Math.abs(this.emissions.get(startYear).getTotal() - this.emissions.get(endYear).getTotal());
    }

    public static Country countryWithHighestCH4InYear(List<Country> countries, int year) {
        return countries.stream()
                .max(Comparator.comparingDouble(c -> c.getEmissions().get(year).getCH4()))
                .orElseThrow();
    }

    public static Country countryWithHighestChangeInEmissions(List<Country> countries, int startYear, int endYear) {
        Country country = countries.stream()
                .max(Comparator.comparingDouble(c -> c.getDelta(startYear, endYear)))
                .orElseThrow();
        System.out.println(country.getName());
        System.out.println(country.getDelta(startYear, endYear));
        return country;
    }

}
