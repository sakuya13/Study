//import java.util.Scanner;
import java.util.*;

public class Temperatures {
    static String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", 
                            "Friday"};
    
    public static void main(String[] args) {
        Scanner kb = new Scanner(System.in);
        int[] temperatures = new int[days.length];
        for (int i=0; i<temperatures.length; i++) { // use the length of the array as the upper bound of the loop
            temperatures[i] = 0; // initialise the value of each item in array to 0
        }


        for (int i=0; i<days.length; i++) {
            System.out.print("Please enter temperature for" + days[i] + ": ");
            int temp = kb.nextInt();
            temperatures[i] = temp;
        }
        System.out.println();
        System.out.println("Histogram of Temperatures");
        System.out.println("-------------------------");

        for (int i=0; i<days.length; i++) {
            System.out.println(days[i] + "\t\t|  " + printStars(temperatures[i]));
        }
    }

    public static String printStars(int temp) {
        String stars = ""; // must initialise the default value before any operations (e.g. the concatenation below)
        for (int j=0; j<temp; j++) {
            stars += "*";
        }
        return stars;
    }


//        System.out.println(temperatures);
}


            
            
