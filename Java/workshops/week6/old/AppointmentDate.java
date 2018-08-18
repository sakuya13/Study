public class AppointmentDate {

    private int day;
    private int year;
    private int month;

    public AppointmentDate() {
        month = 1;
        day = 1;
        year = 1000;
    }
    public AppointmentDate(int month, int day, int year) {
        setDate(month, day, year);
    }
    public int getDay() {
        return day;
    }
    public int getMonth() {
        return month;
    }
    public int getYear() {
        return year;
    }
    public String toString() {
        return (day + " / " + month + " / " + year);
    }
    public void setDate (int month, int day, int year) {
        if (dateOK (month, day, year)) {
            this.month = month;
            this.year = year;
            this.day = day;
        }
        else {
            System.out.println("Fatal Error!Date");
            System.exit(0);
        }
    }
    public void setYear(int year) {
        setDate(this.month, this.day, year);
    }
    public void setMonth(int month) {
        setDate(month, this.day, this.year);
    }
    public void setDay(int day) {
        setDate(this.month, day, this.year);
    }
    private boolean dateOK(int month, int day, int year) {
        // valid year
        if (year > 9999 || year < 1000) {
            return false;
        }
        // valid month
        if (month < 0 || month > 12) {
            return false;
        }
        // valid day
        if (month == 1 || month == 3 || month == 5 ||
            month == 7 || month == 8 || month == 10 ||
            month == 12) {
            if (day > 31 || day < 1) {
                return false;
            }
        } else if (month == 4 || month == 6 ||
            month == 9 || month ==11) {
            if (month > 30) {
                return false;
            }
        } else {
            if (isLeapYear(year)) {
                if (day > 29) {
                    return false;
                }
            } else {
                if  (day > 28) {
                    return false;
                }
            }
        }

        return true;
    }
    private boolean isLeapYear(int year) {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }
}

