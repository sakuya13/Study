public class NestedLoops {
    public static void main(String[] args) {
        int rowNum, columnNum;
        for (rowNum = 1; rowNum <= 3; rowNum++) {
            for (columnNum = 1; columnNum <= 2; columnNum++) {
                System.out.print(" row " + rowNum + " column " + columnNum);
                System.out.println();
            }
        }
    }
}
