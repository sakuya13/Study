/**
 * LibraryItem
 */
public abstract class LibraryItem {
    private int code = 0;
    private String title = "My Item";

    public LibraryItem() {}

    public LibraryItem(int code, String title) {
        this.code = code;
        this.title = title;
    }

    public abstract String returnDescription();

    /**
     * @return the code
     */
    public int getCode() {
        return code;
    }
    
    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param code the code to set
     */
    public void setCode(int code) {
        this.code = code;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }


}