import java.util.Scanner;

public class Lecture {
    public static void main(String[] args) {
        print1();
        decrement();
        io1();
        io2();

    }
    
    public static void print1() {
        System.out.println("Bob\n");
        System.out.println("Bobby\rKev\b\n");
        System.out.println("1 + 1 = " + 1 + 1);
        System.out.println("1 + 1 = " + (1 + 1));
    }
    
    public static void decrement() {
        int x = 10;
        int y = 5;
        System.out.println(x++ - ++y); // which one to use in which situation?
        System.out.println(++x - y++);
    }

    public static void io1() {
        Scanner keyboard = new Scanner(System.in);
        
        System.out.println("input an integer: ");
        // > 1
        // > +2
        // > = 4
        int n = keyboard.nextInt();
        keyboard.nextLine(); // throw the newline character
        String line1 = keyboard.nextLine();
        String line2 = keyboard.nextLine();
        System.out.println(line1);
    }


    public static void io2() { // TODO: this is wrong
        // 1 2 
        // 3 4

        Scanner kb1 = new Scanner(System.in);
        Scanner kb2 = new Scanner(System.in);
        System.out.println("enter two num: ");
        int num1 = kb1.nextInt();
        int num2 = kb2.nextInt();
        System.out.println("enter two num: ");
        int num3 = kb1.nextInt();
        int num4 = kb2.nextInt();
        System.out.println("num1 * num2 = " + num1*num2);
        System.out.println("num3 * num4 = " + num3*num4);
    }
}


