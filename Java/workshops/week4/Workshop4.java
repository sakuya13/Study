import java.util.Scanner;

public class Workshop4 {
        
    private String getResult(int temperature) {
        String result = "";
        while (temperature > 0) {
            result += "*";
            temperature -= 1;
        }
        return result;
    }

    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        System.out.println("Please enter temperature for Monday:");
        int monday = keyboard.nextInt();
        System.out.println("Please enter temperature for Tuesday:");
        int tuesday = keyboard.nextInt();
        System.out.println("Please enter temperature for Wednesday:");
        int wednesday = keyboard.nextInt();
        System.out.println("Please enter temperature for Thursday:");
        int thursday = keyboard.nextInt();
        System.out.println("Please enter temperature for Friday:");
        int friday = keyboard.nextInt();
        
        System.out.println("Histogram of Temperature");
        for (int i = 23; i >= 0; i--) {
            System.out.print("-");
        }
        System.out.println();
        
        Workshop4 temp = new Workshop4();

        System.out.println("Monday    | " + temp. getResult(monday));
        System.out.println("Tuesday   | " + temp.getResult(tuesday));
        System.out.println("Wednesday | " + temp.getResult(wednesday));
        System.out.println("Thurday   | " + temp.getResult(thursday));
        System.out.println("Friday    | " + temp.getResult(friday));
        keyboard.close();
    }
}
