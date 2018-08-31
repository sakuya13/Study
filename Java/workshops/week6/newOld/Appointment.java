import java.util.Arrays;

public class Appointment {
    private int startTime;
    private int endTime;
    private Date date;

    public Appointment() {
        //startTime = 0;
        //endTime = 0;
        //date = new Date();
        this(0,0,new Date());

//        Arrays.sort(a, new Comparator<Integer>() {
//            public int compare(Integer x, Integer y) {
//                return -(x-y);
//            }
//        });
    }
    
    public Appointment(int startTime, int endTime, Date date) {
        this.startTime = startTime;
        this.endTime = endTime;
        this.date = date;
    }
    
    // copy constructor
    public Appointment(Appointment original) {
        startTime = original.startTime;
        endTime = original.endTime;
        date = new Date(original.date);
    }
    
    // accessor for class type instance variable
    public Date getDate() {
        return new Date(date);
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
        return String.format("%2d:00 - %2d:00\n", startTime, endTime) + date.toString() + "\n";
    }
    

}

