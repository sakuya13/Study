/**
 * DressShoe
 */
public class DressShoe extends Shoe {
    
    private Heel heelType;


    /**
     * TODO constructor chaining
     * @param color
     * @param designer
     * @param size
     * @param heelType
     */
    public DressShoe(String color, String designer, double size, Heel heelType) {
        super(color, designer, size);
        this.heelType = heelType; 

    }

    /** 
     * TODO: constructor chaining to a overloaded constructor？
     */
    public DressShoe(DressShoe orig) {
        this(orig.getColor(), orig.getDesigner(), 
             orig.getSize(), orig.getHeelType());
    }

    /**
     * @return the heelType
     */
    public Heel getHeelType() {
        return heelType;
    }

    /**
     * @param heelType the heelType to set
     */
    public void setHeelType(Heel heelType) {
        this.heelType = heelType;
    }

    @Override
    public String toString() {
        return super.toString() + " " + heelType;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        } else if (getClass() != obj.getClass()) {
            return false; 
        } else {
            DressShoe otherShoe = (DressShoe)obj;
            return super.equals(otherShoe) && heelType == otherShoe.heelType;
        }
    }


    // public static void main(String[] args) {
    //     DressShoe ds1 = new DressShoe("red", "dave", 3.0, Heel.FLAT);
    //     DressShoe ds2 = new DressShoe("red", "dave", 3.0, Heel.FLAT);
    //     System.out.println(ds2);
    //     System.out.println(ds1.equals(ds2));
    // }

}