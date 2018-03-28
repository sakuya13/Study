public class AppointmentTime {
    
    private int hour;
    private int minute;
    private int second;
    
    public AppointmentTime() {
        hour = 0;
        minute = 0;
        second = 0;
    }
    public AppointmentTime(int hour, int minute, int second) {
        setTime(hour, minute, second);
    }
    public void setTime(int hour, int minute, int second) {
        if (timeOK(hour, minute, second)) {
            this.hour = hour;
            this.minute = minute;
            this.second = second;
        } else {
            System.out.println("Fatal Error!");
            System.exit(0);
        }
    }
    public void setHour(int hour) {
        setTime(hour, this.minute, this.second);
    }
    public void setMinute(int minute) {
        setTime(this.hour, minute, this.second);
    }
    public void setSecond(int second) {
        setTime(this.hour, this.minute, second);
    }
    public int getHour() {
        return hour;
    }
    public int getMinute() {
        return minute;
    }
    public int getSecond() {
        return second;
    }
    public String toString() {
        return (hour + " : " + minute + " : " + second);
    }
    private boolean timeOK(int hour, int minute, int second) {
        if (hour < 0 || hour > 24) {
            return false;
        }
        if (minute < 0 || minute > 60) {
            return false;
        }
        if (second < 0 || second > 60) {
            return false;
        }
        return true;
    }
}
