import java.util.Scanner;

public class Float {
    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);

        System.out.println("Enter d1:");
        double d1 = keyboard.nextDouble();
        System.out.println("Enter d2:");
        double d2 = keyboard.nextDouble();
        double sum = d1 + d2;
        System.out.println("Sum is: " + sum);
        double product = d1 * d2;
        System.out.println("Product is: " + product);
        
        keyboard.close();
    }
}
