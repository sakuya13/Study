import java.text.DecimalFormat;

public class DecimalFormatDemo{
    public static void main(String[] args){
        DecimalFormat pattern00dot000 = new DecimalFormat("00.000");
        DecimalFormat pattern0dot00 = new DecimalFormat("0.00");

        double d = 12.3456789;
        System.out.println(pattern00dot000.format(d));
        
        DecimalFormat percent = new DecimalFormat("0.00%");
        System.out.println(percent.format(0.308));

//         DecimalFormat eNotation1 = new DecimalFormat("#0.###E0");
//         DecimalFormat eNotation2 = new DecimalFormat("00.###E0");
 
//         System.out.println(eNotation1.Format(123.456));
//         System.out.println(eNotation2.Format(123.456));

    }
    
}
