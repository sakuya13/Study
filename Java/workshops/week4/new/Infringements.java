import java.util.Scanner;

public class Infringements {
    public static void main(String[] args) {
        Scanner kb = new Scanner(System.in);

        System.out.print("Please enter speed: ");
        int speed = kb.nextInt();
        System.out.print("Is the driver drunk? ");
        String drunk = kb.next();
        
        if (60 < speed && speed < 65) {
            System.out.println("Warning");
        } else if (60 < speed && speed < 65 && drunk == "Y") {
            System.out.println("Warning + Take a shower");
        } else if (speed > 65 && speed <= 70) {
            System.out.println("$5 fine for each km/hr over 60 km/hr");
            System.out.print("You have a fine of $" + (speed - 60) * 5);
            System.out.println();
        }
        
        kb.close();
    }

}
