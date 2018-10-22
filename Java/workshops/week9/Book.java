/**
 * Book
 */
public class Book extends LibraryItem{

    private final int BORROW_DAYS = 21;
    private String author = "John Dow";

    public Book() {
        super();
    }

    public Book(int code, String title, String author) {
        super(code, title);
        this.author = author;
    }

    @Override
    public String returnDescription() {
        return "Circulation Code: " + this.getCode() + "\n" +
               "Title: " + this.getTitle() + "\n" +
               "Author:" + author + "\n" +
               "Borrow time:" + BORROW_DAYS;
    }

    /**
     * @return the author
     */
    public String getAuthor() {
        return author;
    }

    /**
     * @param author the author to set
     */
    public void setAuthor(String author) {
        this.author = author;
    }
}