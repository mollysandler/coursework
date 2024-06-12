package part3;

import java.util.List;
import java.util.Map;

public class Country {
    private String country;
    private Map<Integer, Emission> emissions;

    public Country(String key, Map<Integer, Emission> value) {
    }

    public String getName() {
        return country;
    }

    public Map<Integer, Emission> getEmissions() {
        return emissions;
    }

    public int getYearWithHighestEmissions() {
        double highest = 0;
        int year = 0;
        for (Map.Entry<Integer, Emission> current : this.getEmissions().entrySet()) {
            Emission e = current.getValue();
            int y = current.getKey();
            double total = e.getCO2() + e.getN2O() + e.getCH4();
            if (total > highest) {
                highest = total;
                year = y;
            }//end of if

        }//end of for

        return year;
    }//end of country


    public static Country countryWithHighestCH4InYear(List<Country> countries, int year) {
        double highest = 0;
        Country c = null;
        for (Country country : countries) {
            double chem = country.getEmissions().get(year).getCH4();
            if (chem > highest) {
                highest = chem;
                c = country;
            }
        }
        return c;
    }//end of country

    public static Country countryWithHighestChangeInEmissions(List<Country> countries, int startYear, int endYear) {
        double highest = 0;
        Country c = null;
        /*double start = startYear.getCO2() + startYear.getN2O() + startYear.getCH4(); //total start year
        double end = endYear.getCO2() + endYear.getN2O() + endYear.getCH4(); //total end year
        double change = Math.abs(end - start);
*/
        for (Country country : countries) {
            double startEm = country.getEmissions().get(startYear).getCH4() +
                    country.getEmissions().get(startYear).getN2O() +
                    country.getEmissions().get(startYear).getCO2();
            double endEm = country.getEmissions().get(endYear).getCH4() +
                    country.getEmissions().get(startYear).getN2O() +
                    country.getEmissions().get(startYear).getCO2();
            double change = endEm - startEm;

            if (change > highest) {
                highest = change;
                c = country;
            }
        }
        System.out.println(c.getName() + ", " + highest);
        return c;
    }
}//end of class