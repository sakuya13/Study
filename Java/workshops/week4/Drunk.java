import java.util.Scanner;

public class Drunk {
    
    private void printStar() {
        for (double i=60; i>0; i--) {
            System.out.print("*");
        }
        System.out.println();
    }

    private void printBar() {
        for (double i=60; i>0; i--) {
            System.out.print("-");
        }
        System.out.println();
    } 
    
    private void printMessage(double speed, String drunk) {
        if (60 < speed && speed < 65) {
            if (drunk.equals("N")) {
                printStar();
                System.out.println("Warning");
                System.out.println();
                printBar();
                System.out.println("You have a fine of $0.0");
                printStar();
            }
            else {
                printStar();
                System.out.println("Warning + Take a Shower");
                System.out.println();
                printBar();
                System.out.println("You have a fine of $0.0");
                printStar();
            }
        }
        else if (70 >= speed && speed > 65) {
            if (drunk.equals("Y")) {
                printStar();
                System.out.println("$7.0 fine for each km/hr over 60 km/hr + Take a shower");
                System.out.println();    
                printBar();
                System.out.println("You have a fine of $" + (speed-60)*7);
                printStar();
            }
            else {
                printStar();
                System.out.println("$5.0 fine for each km/hr over 60 km/hr");
                System.out.println();
                printBar();
                System.out.println("You have a fine of $" + (speed-60)*5);
                printStar();
            }
        }
        else if (speed > 70) {
            if (drunk.equals("Y")) {
                printStar();
                System.out.println("$15 fine for each km/hr over 60 km/hr \n" +
                                   "Spend the day/night in cell until become sober");
                System.out.println();
                printBar();
                System.out.println("You have a fine of $" + (speed-60)*15);
                printStar();
            }
            else {
                printStar();
                System.out.println("$10 fine for each km/hr over 60 km/hr");
                System.out.println();
                printBar();
                System.out.println("You have a fine of $" + (speed-60)*10);
                printStar();
            }
        }    
    }

    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        System.out.print("Please enter speed: ");
        double speed = keyboard.nextInt();
        System.out.println();
        
        if (speed < 60)
            System.out.println("Good driver!");
        else {
            System.out.print("Is the driver drunk? ('Y' for drunk, 'N' otherwise): ");
            String drunk = keyboard.next();
            System.out.println();
            Drunk stat = new Drunk();
            stat.printMessage(speed, drunk);
        }
        keyboard.close();
    }
}
