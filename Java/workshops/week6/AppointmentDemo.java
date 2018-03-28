import java.util.Scanner;

public class AppointmentDemo {
    public static void main(String[] args) {
        Appointment appointment = new Appointment();
        
        System.out.println("After default constructor: " + appointment);

        appointment.setDate(4, 9, 2014);
        appointment.setStartTime(16, 0, 0);
        appointment.setEndTime(17, 0, 0);

        System.out.println("After call the mutators: " + appointment);
    }
}



