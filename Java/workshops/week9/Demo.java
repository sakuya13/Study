/**
 * Demo
 */
public class Demo {

    public static void main(String[] args) {
        
        LibraryItem[] book = new Book[2];
        LibraryItem[] dvd = new DVD[2];

        book[0] = new Book(10000, "A Book", "fat");
        dvd[0] = new DVD(20000, "A DVD", 1999);
        dvd[1] = new DVD();
        book[1] = new Book();

        System.out.println(book[0].returnDescription());
        System.out.println();
        System.out.println(dvd[0].returnDescription());
        System.out.println();
        System.out.println(dvd[1].returnDescription());
        System.out.println();
        System.out.println(book[1].returnDescription());
    }
}