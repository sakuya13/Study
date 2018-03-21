import java.util.Scanner; 

public class ReturnDemo {
    public String myMethod() {
        Scanner keyboard = new Scanner(System.in);
        System.out.println("Enter a line of text");
        String result = keyboard.nextLine();
        keyboard.close();
        return result + " was entered.";
    }
    public static void main(String[] args) {
        ReturnDemo fat = new ReturnDemo();
        System.out.println(fat.myMethod());
    }
}

