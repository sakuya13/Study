import java.util.Scanner;


public class Greetings {
    public static void main(String[] args) {
        Scanner kb = new Scanner(System.in);
        System.out.println("Hello " + args[0] + " from " + args[1] + ".");
        System.out.println("I'VE ALWAYS WANTED TO GO TO " 
                            + args[1].toUpperCase() + ".");
    }
}


