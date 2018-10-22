import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * InputException
 */
public class InputExceptionDemo {

    static Scanner s = new Scanner(System.in);
    /**
     * 
     * @return
     * @throws NegativeNumberException If the exception is checked and not catched in the method, must use this warning signiture.
     */
    private static int nonnegativeReader() throws NegativeNumberException { 
        String numStr;
        int num;
        numStr = s.nextLine();
        try {
            num = Integer.parseInt(numStr);
        } catch (NumberFormatException e) {
            throw new InputMismatchException();
        }
        if (num < 0) {
            throw new NegativeNumberException();
        }
        return num;
    }
    
    public static void main(String[] args) {
        int num = 0;
        System.out.println("Please enter two nonnegative integers: ");
        boolean done = false;
        while (! done) {
            try {
            num = nonnegativeReader();
            done = true;
            } catch (InputMismatchException e) {
                s.nextLine();
                System.out.println("Invalid input.");
                System.out.println("Try again.");
            } catch (NegativeNumberException e) {
                s.nextLine();
                System.out.println(e.getMessage());
                System.out.println("Try again.");
            }
        }
        System.out.println("You entered " + num);
    }       
}
