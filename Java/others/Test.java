public class Test {
    public static void main(String[] args) {
        int j = 5;
        for (int i = 0; i<j; i++) {
            if (i <= j--)
                System.out.println((i*j) + " ");
        }
    }
}

