public class Wage {
    public static void main(String[] args) {
        int hour = Integer.parseInt(args[0]);
        double wage;

        if (hour < 40) {
            wage = 8.25 * hour;
        }
        else {
            wage = 8.25 * 40 + (hour - 40) * 1.5;
        }
        System.out.println("Your wage is: " + wage);
    }
}
