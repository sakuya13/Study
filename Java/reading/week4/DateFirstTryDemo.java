import java.util.Scanner;

public class DateFirstTryDemo {
    private int day;
    private String month;
    private int year;

    // constructors
    public DateFirstTryDemo() {
        month = "January";
        day = 1;
        year = 1000;
    }

    public DateFirstTryDemo(int monthInt, int day, int year) {
        setDate(monthInt, day, year);
    }
    
    public DateFirstTryDemo(String monthString, int day, int year) {
        setDate(monthString, day, year);
    }
    
    public DateFirstTryDemo(int year) {
        setDate(1, 1, year);
    }

    public DateFirstTryDemo(Date aDate) {
        if (aDate == null) {
            System.out.println("Fatal Error.");
            System.exit(0);
        }
        month = aDate.month;
        day = aDate.day;
        year = aDate.year;
    }

    /**
    Precondition: All instance variables of the calling object have values.
    Postcondition: The data in the calling object has been written to the screen.
    */    
    public void writeOutput() {
        System.out.println(this.month + " " + this.day + ", " + this.year);
    }

    public void readInput() {
        boolean tryAgain = true;
        Scanner keyboard = new Scanner(System.in);
        while (tryAgain) {
            System.out.println("Enter month, day, and year");
            System.out.println("as three integers:");
            System.out.println("do not use commas or other punctuations.");
            int monthInput = keyboard.nextInt();
            int dayInput = keyboard.nextInt();
            int yearInput = keyboard.nextInt();
            if (dateOK(monthInput, dayInput, yearInput)) {
                setDate(monthInput, dayInput, yearInput);
                tryAgain = false;
            }
            else
                System.out.println("Illegal date. Reenter input.");
        keyboard.close();
        }
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
    
    public int getDay() {  // accessor method 
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

    public void setDate(String monthString, int day, int year) {
        if (dateOK(monthString, day, year)) {
            this.month = monthString;
            this.day = day;
            this.year = year;
        }
        else {
            System.out.println("Fatal Error");
            System.exit(0);
        }
    }

    public void setDate(int month, int day, int year) {  // mutator method
        if (dateOK(month, day, year)) {
            this.month = monthString(month);
            this.day = day;
            this.year = year;
        }
        else 
            System.out.println("Fatal Error");
            System.exit(0);
    }
    
    public void setMonth(int monthNumber) {
        if ((monthNumber <= 0) || (monthNumber > 12)) {
            System.out.println("Fatal Error");
            System.exit(0);
        }
        else
            month = monthString(monthNumber);
    }

    private boolean dateOK(String monthString, int dayInt, int yearInt) {
        return ( monthOK(monthString) &&
                (dayInt >= 1) && (dayInt <= 31) &&
                (yearInt >= 1000) && (yearInt <= 9999) );
    }

    private boolean dateOK(int monthInt, int dayInt, int yearInt) {
        return ((monthInt >= 1) && (monthInt <= 12) &&
                (dayInt >= 1) && (dayInt <= 31) &&
                (yearInt >= 1000) && (yearInt <= 9999));
    }

    public boolean isBetween(int lowYear, int highYear) {
        return ((year > lowYear) && (year < highYear));
    }

    private String monthString(int monthNumber) {
        switch (monthNumber) {
            case 1:
                return "January";
            case 2:
                return "February";
            case 3:
                return "March";
            default:
                System.out.println("Fatal error!");
                System.exit(0);
                return "Error";
        }
    }

    public static void main(String[] args) {
        DateFirstTryDemo date1;
        date1 = new DateFirstTryDemo(); // create a new object of the class
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
        
        DateFirstTryDemo date = new DateFirstTryDemo();
        int year = 1882;
        date.setDate(3, 7, year);
        date.writeOutput();
    }    
}
