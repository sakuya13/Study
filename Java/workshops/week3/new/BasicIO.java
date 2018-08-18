import java.util.Scanner;

public class BasicIO {
    static Scanner keyboard = new Scanner(System.in);

    public static void q1() {
        System.out.println("enter first float: ");
//        float i, j;
        float i = keyboard.nextFloat();
        System.out.println("enter second float: ");
        float j = keyboard.nextFloat();

        float sum = i + j;
        System.out.println("Their sum is: " + sum);
        
        float difference = Math.abs(i-j);
        System.out.println("Their difference is: " + difference);

        float product = i * j;
        System.out.println("Their product is: " + product);
        
    }

    public static void q2() {
        System.out.println("Enter the radius: ");
        int r = keyboard.nextInt();

        double volume = (4/3) * Math.PI * Math.pow(r, 3);
        double surface = 4 * Math.PI * Math.pow(r, 2);
        System.out.println("Volume: " + volume);
        System.out.println("Surface: " + surface);    
    }

    public static void q3() {
        System.out.println("enter hour: ");
        int hours = keyboard.nextInt();
        double wage;
        if (hours < 40) {
            wage = hours * 8.25;
            System.out.println("Your wage is: " + wage);
        } else if (hours >= 40) {
            wage = 40 * 8.25 + (hours - 40) * 1.5;
            System.out.println("Your wage is: " + wage);
        } else {
            System.out.println("invalid hour!");
        }
    }

    public static void main(String[] args) {
        q3();
    }

}


