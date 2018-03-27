/* Static methods can access static variable.
**/
public class InovacationCounter {
//    private static final int numberOfInovacations = 0;
    private static int numberOfInovacations = 0;

    public void demoMethod() {
        numberOfInovacations++;
    }
    
    public void outPutCount() {
        numberOfInovacations++;
        System.out.println("Number of inovacations so far = " + numberOfInovacations);
    }
    
    public static int numberSoFar() {
        numberOfInovacations++;
        return numberOfInovacations;
    }

    public static void main(String[] args) {
        int i;
        InovacationCounter object1 = new InovacationCounter();
        for (i = 1; i <= 5; i++)
            object1.demoMethod();
        object1.outPutCount();

        InovacationCounter object2 = new InovacationCounter();
        for (i = 1; i <= 5; i++) {
            object2.demoMethod();
            object2.outPutCount();
        }

    System.out.println("Total number of inovacations = " + numberSoFar());

    }

}
