import java.util.Scanner;

public class POS {
    static int[] notes = {5000, 2000, 1000, 500, 200, 100, 50, 20, 10, 5};
 
    public static void main(String[] args) {
        Scanner kb = new Scanner(System.in);
        System.out.print("Please enter the change (without $): ");
        double change = kb.nextDouble();
        System.out.println();
        System.out.println("Please give the customer: ");
        System.out.println();

        int changeInCent = (int) (change * 100);

        for (int i = 0; i < notes.length; i++) {
            int n = cal(changeInCent, notes[i]);
            System.out.println(noteToString(notes[i]) + "\t\t" + n);
            changeInCent %= notes[i];
        }
    }
    
    public static String noteToString(int note) {
        if (note >= 100) {
            return "$" + String.valueOf(note / 100);
        } else {
            return String.valueOf(note) + "c";
        }
    }

    public static int cal(int changeInCent, int note) {
        return changeInCent / note;
    }
}


