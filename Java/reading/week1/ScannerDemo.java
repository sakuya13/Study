import java.util.Scanner;

public class ScannerDemo{
    public static void main(String[] args){
        Scanner keyboard = new Scanner(System.in);
        Scanner keyboard1 = new Scanner(System.in);
        keyboard1.useDelimiter("##");

        System.out.println("Enter a number:");
        int num1 = keyboard.nextInt();
        System.out.println("Enter another number:");
        int num2 = keyboard.nextInt();
        
        System.out.println("num1: " + num1);
        System.out.println("num2: " + num2);
        System.out.println(num1 + num2);

        double d1, d2;
        System.out.println("Enter two double:");
        d1 = keyboard.nextDouble();
        d2 = keyboard.nextDouble();
        System.out.println("You entered" + d1 + "and" + d2);

        System.out.println("Next enter two words:");
        String word1 = keyboard1.next();  // the effect of use delimeter
        String word2 = keyboard1.next();
        System.out.println("You entered \"" + word1 + "\" and \"" + word2 + "\"");
        
        String junk1 = keyboard.nextLine();
        System.out.println("Enter a sentence:");
        String line = keyboard.nextLine(); // useDelimiter doesn't reflect on nextLine()?
        System.out.println("You entered: \"" + line + "\"");
        
        System.out.println("enter a int:");
        int n = keyboard.nextInt();
        String junk = keyboard.nextLine(); // junk is used to collect the '\n' from nextInt()
        System.out.println("enter a string:");
        String s1 = keyboard.nextLine();
        System.out.println("enter second string:");
        String s2 = keyboard.nextLine();
        System.out.println(n);
//        System.out.println(junk);
        System.out.println(s1);
        System.out.println(s2);
        
        keyboard.close();
        keyboard1.close();
    }
}
