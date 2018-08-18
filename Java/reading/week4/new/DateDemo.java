public class DateDemo {
    public static void main(String[] args) {
        Date date1 = new Date();
        Date date2 = new Date();
//        date1.day = 31; //will trigger error because the instance variables are private
        date1.writeOutput();
        System.out.println(date1.fractionDone(5));
        date2.makeItNewYear();
        date2.writeOutput();
        date2.yellIfNewYear();
        System.out.println(date2.toString());
        date1.setDate("August", 8, 2000);
        date1.writeOutput();
        if (date1.dateOk(date1.getMonth(), date1.getDay(), date1.getYear())) {
            System.out.println("correct date");
        }
        // call static method with class name
        if (Date.dateOk(date1.getMonth(), date1.getDay(), date1.getYear())) {
            System.out.println("correct date");
        }
    }
}


