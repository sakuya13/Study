/**
 * DVD
 */
public class DVD extends LibraryItem {
    
    private final int BORROW_DAYS = 7;
    private int year = 1900;

    public DVD(){
        super();
    }

    public DVD(int code, String title, int year) {
        super(code, title);
        this.year = year;
    }

    @Override
    public String returnDescription() {
        return "Circulation Code: " + this.getCode() + "\n" +
               "Title: " + this.getTitle() + "\n" +
               "Realease Year:" + year + "\n" +
               "Borrow time:" + BORROW_DAYS;
    }
    
    /**
     * @return the year
     */
    public int getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(int year) {
        this.year = year;
    }

}