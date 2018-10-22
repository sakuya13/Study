/**
 * NegativeNumberException
 */
public class NegativeNumberException extends Exception {

    public NegativeNumberException() {
        super("Negative Number Not Allowed!");
    }

    public NegativeNumberException(String message) {
        super(message);
    }
}