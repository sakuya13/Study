public class Workshop1 {
    public static void main(String[] args) {
        System.out.println("David");
        System.out.println("Address");
        System.out.println("12345");

        hello();

        try {
            System.out.println((int) '4');
            System.out.println(fac(5));

            System.out.println(fac(-6));
   
        } catch (ArithmeticException e) {
            System.err.println(e);
        }
        System.out.println("abc");
    }

    public static void hello() {
        String hello = "Hello World!";
        System.out.println(hello);
        System.out.println(hello.toUpperCase());
        hello = "So Long!";
        
        for (int i=1; i<11; i++) {
            System.out.println(hello);
        }


        int b = 0;
        while (b<=5) {    
            System.out.println(b);
            b++;
        }
        
        b = 0;
        do {
            System.out.println(b);
            b++;
        } while (b<=5);


        for (int i=1; i<=5; i++) {
            for (int j=1; j<=i; j++) {
                System.out.print(i);
            }
            System.out.println();
        }
        
        for (int i=1; i<=5; i++) {
            for (int j=1; j<=i; j++) {
                System.out.print(j);
            }
            System.out.println();
        }
    }

    public static int fac(int n) {
        if (n<0) {
            throw new ArithmeticException("negative input");
        }
        if (n == 0) {
            return 1;
        }
        return n * fac(n-1);
    }

}


