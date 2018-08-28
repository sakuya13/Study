public class Test {
    public static void main(String[] args) {
        Date myDate = new Date(5,"July",1991);
        Appointment myAppointment = new Appointment(14,16,myDate);

        System.out.print(myAppointment.toString());
    }
}


