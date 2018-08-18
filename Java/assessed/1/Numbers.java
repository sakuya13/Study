import java.util.Scanner;

public class Numbers {
    public static void main(String[] args) {
        Scanner kb = new Scanner(System.in);
        int i = Integer.parseInt(args[0]);
        int j = Integer.parseInt(args[1]);

        System.out.println(i+j);
        System.out.println(i-j);
//        System.out.println(Math.abs(i-j));
        System.out.println(i*j);
        System.out.println(i/j);
        System.out.println(i%j);
    }
}


