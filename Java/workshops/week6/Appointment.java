public class Appointment {
    
    private AppointmentTime startTime;
    private AppointmentTime endTime;
    private AppointmentDate date;
    
    public Appointment() {
        startTime = new AppointmentTime();
        endTime = new AppointmentTime();
        date = new AppointmentDate();
    }
    public Appointment(int startHour, int startMinute, int startSecond, 
                       int endHour, int endMinute, int endSecond, 
                       int month, int day, int year) {
        startTime = new AppointmentTime(startHour, startMinute, startSecond);
        endTime = new AppointmentTime(endHour, endMinute, endSecond);
        date = new AppointmentDate(month, day, year);
    }
    public Appointment(AppointmentDate date, AppointmentTime startTime, AppointmentTime endTime) {
        this.startTime = startTime;
        this.endTime = endTime;
        this.date = date;
    }
    public AppointmentTime getStartTime() {
        return startTime;
    }
    public AppointmentTime getEndTime() {
        return endTime;
    }
    public AppointmentDate getDate() {
        return date;
    }
    public void setAppointment(AppointmentDate date, AppointmentTime startTime,
                               AppointmentTime endTime) {
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
    }
    public void setStartTime(int startHour, int startMinute, int startSecond) {
        startTime.setTime(startHour, startMinute, startSecond);
    }
    public void setStartTime(AppointmentTime time) {
        startTime = time;
    }
    public void setEndTime(int endHour, int endMinute, int endSecond) {
        endTime.setTime(endHour, endMinute, endSecond);
    }
    public void setEndTime(AppointmentTime time) {
        endTime = time;
    }
    public void setDate(int month, int day, int year) {
        date.setDate(month, day, year);
    }
    public void setDate(AppointmentDate date) {
        this.date = date;
    }
    public String toString() {
        return (date + "\n" + startTime + " - " + endTime + "\n");
    }

}

