import java.util.Scanner;

public class Loop {
    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        
        System.out.println("Enter n:");
        int n = keyboard.nextInt();
        
        while (n > 0) {
            System.out.println("Nya!");
            n = n - 1;
        }        
        
        System.out.println("Enter a:");
        int a = keyboard.nextInt();

        do {
            System.out.println("Nya!");
            a -= 1;
        } while (a > 0); // notice that here is a ;
        
        System.out.println("Enter the upper-bound:");
        int upperBound = keyboard.nextInt();
        int sum = 0;
        for (int num = 1; num <= upperBound; num ++) {
            sum += num;
        }
        System.out.println("The result is: " + sum);
        keyboard.close();
    }
}
