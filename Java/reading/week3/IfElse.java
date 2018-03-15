import java.util.Scanner;


public class IfElse {
    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        
        System.out.println("Enter a:");
        int a = keyboard.nextInt();
        int b;
        String max1;
        String max2;

        if (a > 1)
            b = a + 1;
        else if (a == 1)
            b = a;
        else
            b = a - 1;

        System.out.println("b is: " + b);
        
        if (a >= b) max1 = "a";
        else        max1 = "b";
        System.out.println("max1 is: " + max1);
        
        max2 = (a >= b) ? "a" : "b";
        System.out.println("max2 is: " + max2);

        int c = keyboard.nextInt();
        switch (c) {
            case 0:
                //
                break;
            case 1:
                //
            case 2:
                // 
                break;
            default:
                // 
                break;
        }

        keyboard.close();    
    }
}
