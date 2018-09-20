/**
 * Shoe
 */
public class Shoe {

    private String color;
    private String designer;
    private double size;



    public Shoe(String color, String designer, double size) {
        this.color = color;
        this.designer = designer;
        this.size = size;

    }

    /**
     * @return the color
     */
    public String getColor() {
        return color;
    }

    /**
     * @return the designer
     */
    public String getDesigner() {
        return designer;
    }

    /**
     * @return the size
     */
    public double getSize() {
        return size;
    }

    /**
     * @param color the color to set
     */
    public void setColor(String color) {
        this.color = color;
    }

    /**
     * @param designer the designer to set
     */
    public void setDesigner(String designer) {
        this.designer = designer;
    }

    /**
     * @param size the size to set
     */
    public void setSize(double size) {
        this.size = size;
    }
    
    @Override
    public String toString() {
        return color + " " + designer + " " + size;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        } else if (getClass() != obj.getClass()) {
            return false; 
        } else {
            Shoe otherShoe = (Shoe)obj;
            return color.equals(otherShoe.color) && 
                    designer.equals(otherShoe.designer) &&
                    (size == otherShoe.size);
        }
    }

    public static void main(String[] args) {
        Shoe s = new Shoe("red", "david", 300);
        System.out.println(s);
    }
}