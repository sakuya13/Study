public class Date {
    // instance variables: good to be private
    private String month;
    private int day;
    private int year;

    // constructor
    public Date() {
        // anything u need
        month = "January";
        day = 1;
        year = 1000;
    }

    public Date(String month, int day, int year) {
        if (dateOk(month, day, year)) {
            this.month = month;
            this.day = day;
            this.year = year;
        } else {
            System.out.print("invalid input");
            System.exit(1);
        }
    }
    

    private static final String[] monthStrings = {"January", "Feburary", 
                                                  "March", "April",
                                                  "May", "June", "July", 
                                                  "August", "September",
                                                  "October", "November", 
                                                  "December"};

    public void yellIfNewYear() { // methods can be private when they are only used as helper to define other methods in the same class
        if (day == 1 && month == "January") {
            System.out.println("Hurrah!");
        } else {
            System.out.println("Not New Year's Day.");
        }
    }

    public double fractionDone(int targetDay) {
        double localDay = day;
        return localDay / targetDay;
    }

    // accessors
    public int getDay() {
        return this.day;
    }

    public int getYear() {
        return this.year;
    }

    public String getMonth() {
        return this.month;
    }

    // mutators
    public void setDate(String newMonth, int newDay, int NewYear) {
        day = newDay;
        month = newMonth;
        year = NewYear;
    }

    public void makeItNewYear() {
        day = 1;
        month = "January";
    }

    // helpers
    public boolean equals(Date otherDate) {
        return ((month.equals(otherDate.month)) && (day == otherDate.day) &&
                (year == otherDate.year));
    }

    public String toString() {
        return (month + " " + day + " " + year);
    }

    public static boolean dateOk(String theMonth, int theDay, int theYear) {
        return (monthOk(theMonth) && (theDay > 0 && theDay < 32) && 
            (theYear > 1000 && theYear < 9999));
    }
    
    private static boolean monthOk(String month) {
        for (int i=0; i<monthStrings.length; i++) {
            if (month.equals(monthStrings[i])) {
                return true;
            }
        }
        return false;
    }
    

    // IO
    public void writeOutput() {
        System.out.println(month + " " + day + ", " + year);
    }
}


