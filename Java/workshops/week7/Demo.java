public class Demo {
   public static void main(String[] args) {
       Subject first = new Subject("COMP90041", "Software Development", "Bob", new Student[1000]);
       Subject second = new Subject("COMP90054", "AI", "Nir", new Student[1000]);
       Student theman = new Student("Fat", 843643, "thefat", new Subject[4]);

       theman.enroll(first);
       theman.enroll(second);
       theman.unenroll(first);
       theman.enroll(first);
       System.out.println(theman.toString());

   } 
}
