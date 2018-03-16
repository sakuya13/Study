import java.util.Scanner;

public class Coupons {
    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        
        System.out.println("How many coupons do you have:");
        int num = keyboard.nextInt();
        int remain = num;
        int candy = 0;
        int gumball = 0;
        
        while (remain >= 10) {
            candy++;
            remain -= 10;
        }

        while (remain >= 3) {
            gumball++;
            remain -= 3;
        }

        System.out.println("With " + num  + " coupon(s) you can get " + candy +
                           " candy bar(s) and " +
                           gumball + "  gumball(s). This will leave you with " +
                           remain + " coupon(s).");
        keyboard.close();
    }
}

