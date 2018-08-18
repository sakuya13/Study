public class Compass {
    public static void main(String[] args) {
        if (args.length >0 ) {
            switch (args[0].charAt(0)) { // or use charAt(index of string)
                case 'N':
                    System.out.println("0");
                    break;
                case 'S':
                    System.out.println("180");
                    break;
                case 'W':
                    System.out.println("270");
                    break;
                case 'E':
                    System.out.println("90");
                    break;
                default:
                    System.exit(0);
            }
        } else {
            System.out.println("No args input");
        }
    }
}






