package part2;

public class Emission {
    private double CO2;
    private double N20;
    private double CH4;

    public Emission(double CO2, double N2O, double CH4) {
        double co2 = CO2;
        double n2o = N2O;
        double ch4 = CH4;
        System.out.println("co2: " + CO2);
        System.out.println("n20: " + N2O);
        System.out.println("ch4: " + CH4);

    }//end of constructor

    public double getCO2(){
        return CO2;
    }
    public double getN2O(){
        return N20;
    }
    public double getCH4(){
        return CH4;
    }

}//end of Emission
