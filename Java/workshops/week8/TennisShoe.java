/**
 * TennisShoe
 */
public class TennisShoe extends Shoe {

    private String sole;
    private String canvas;

    public TennisShoe(String color, String designer, double size, String sole,
                      String canvas) {

        super(color, designer, size);
        this.sole = sole;
        this.canvas = canvas;


    }

    /**
     * @return the canvas
     */
    public String getCanvas() {
        return canvas;
    }

    /**
     * @return the sole
     */
    public String getSole() {
        return sole;
    }

    /**
     * @param canvas the canvas to set
     */
    public void setCanvas(String canvas) {
        this.canvas = canvas;
    }

    /**
     * @param sole the sole to set
     */
    public void setSole(String sole) {
        this.sole = sole;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null)
            return false;
        else if (getClass() != obj.getClass())
            return false;
        else {
            TennisShoe other = (TennisShoe) obj;
            return super.equals(obj) && canvas == other.canvas && 
                   sole == other.sole;
        }
    }

    @Override
    public String toString() {
        return String.join(" ", super.toString(), canvas, sole);
    }
    
}