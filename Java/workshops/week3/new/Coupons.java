import java.util.Scanner;

public class Coupons {
    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        System.out.println("How many coupons do you have: ");
        int coupons = keyboard.nextInt();
        calculate(coupons);
    }

    public static void calculate(int coupons) {
        int candy = coupons / 10;
        int gumballs = (coupons - (candy * 10)) % 3;
        int remaining = coupons - candy * 10 - gumballs * 3;
        System.out.println(
                "With " + coupons + " coupon(s) you can get " 
                + candy + " candy bar(s) and " + gumballs + 
                " gumball(s). This will leave you with " +
                remaining + " coupon(s).");
    }

}
