import java.text.*;
import java.util.Locale;


public class FirstProgram {
    public static void main(String[] args) {
        System.out.println("Hello Reader.");
        System.out.println("Welcome to Java!");

        System.out.println("Let's calculate this!");
        int answer = 2 + 2;
        System.out.println("2 Plus 2 is " + answer);
        // format specifier        
        double distance = 55 * .5;
        System.out.println(distance);
        System.out.printf("start%6.2f", distance);
        System.out.println(" metres away.");
        System.out.printf("start%-6.2f", distance);
        System.out.println(" metres away.");
        
        double price = 19.8;
        String name = "magic apple";
        System.out.printf("%6.2f for each %s.%n", // %n - line breaks
                price, name);
        System.out.println("WOW!");

        System.out.println("China as Location:");
        NumberFormat moneyFormater
            = NumberFormat.getCurrencyInstance(Locale.CHINA);

        System.out.println(moneyFormater.format(19.8));
        System.out.println(moneyFormater.format(19.91111111));

        System.out.println(moneyFormater.format(19));
         
        }
}

