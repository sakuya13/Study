import java.util.Scanner;
import java.io.*;

public class ToUpper {
    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        
        System.out.println("Enter a sentence:");
        String line = keyboard.nextLine();
        System.out.println(line.toUpperCase());
        
        keyboard.close();
    }
}
