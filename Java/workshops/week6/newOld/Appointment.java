public class Appointment {
    private int startTime;
    private int endTime;
    private Date date;

    public Appointment() {
        startTime = 0;
        endTime = 0;
        date = new Date();
    }
    
    public Appointment(int startTime, int endTime, Date date) {
        this.startTime = startTime;
        this.endTime = endTime;
        this.date = date;
    }

    public int getStartTime() {
        return startTime;
    }

    public int getEndTime() {
        return endTime;
    }

    public void setTime(int startTime, int endTime) {
        this.startTime = startTime;
        this.endTime = endTime;
    }
    
    public String toString() {
        return String.format("%2d:00 - %2d:00\n", startTime, endTime) + 
               date.toString() + "\n";
    }
    

}

