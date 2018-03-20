public class DateFirstTryDemo {
    public int day;
    public String month;
    public int year;

    public void writeOutput() {
        System.out.println(month + " " + day + ", " + year);
    }

    public void makeItNewYears() {
        month = "January";
        day = 1;
    }
    
    public void yellIfNewYear() {
        if (month.equals("January") &&  day == 1)
            System.out.println("Hurrah!");
        else
            System.out.println("Not New Years Day.");
    }
    
    public int getDay() {
        return day;
    }

    public int getNextYear() {
        return year + 1;
    }

    public void happyGreeting() {
        while (day >= 1) {
            System.out.println("Happy Days!");
            day -= 1;
        }
    }

    public static void main(String[] args) {
        DateFirstTryDemo date1, date2;
        date1 = new DateFirstTryDemo(); // create a new object of the class
        date2 = new DateFirstTryDemo();
        date1.month = "December";  // create a instance variable
        date1.year = 2012;
        date1.day = 31;
        System.out.println("date1:");
        
        date1.writeOutput();
        System.out.println("day: " + date1.getDay());
        date1.happyGreeting();

        date1.makeItNewYears();
        date1.writeOutput();
        date1.yellIfNewYear();
        System.out.println("Next year is: " + date1.getNextYear());
        
    }
    
}
