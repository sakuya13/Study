import java.lang.Math;

public class VolumeSurface {
    public static void main(String[] args) {
        double r = 10.0;
        double volume;
        double surface;

        volume = (4.0/3) * PI * pow(r, 3);
        surface = 4 * PI * pow(r, 2);
        
        System.out.println("The volume is: " + volume);
        System.out.println("The volume is: " + surface);
    }
}
