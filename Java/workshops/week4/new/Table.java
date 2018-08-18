public class Table {
    public static void main(String[] args) {
        System.out.printf("%4s ", "*");
        for (int i=1; i<11; i++) {
            System.out.printf("|%4d ", i);
        }
        System.out.println();

        for (int i=1; i<11; i++) {
            for (int j=1; j<11; j++) {
                System.out.print("-----+");
            }
            System.out.print("-----");
            System.out.println();

            System.out.printf("%4d ", i);
            for (int j=1; j<11; j++) {
                System.out.printf("|%4d ", i*j);
            }
            System.out.println();
        }
    }
}


