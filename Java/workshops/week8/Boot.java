/**
 * Boot
 */
public class Boot extends Shoe {

    private Heel heelType;

    public Boot(String color, String designer, double size, Heel heelType) {
        super(color, designer, size);
        this.heelType = heelType;
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
    public boolean equals(Object obj) {
        if (obj == null)
            return false;
        else if (getClass() != obj.getClass())
            return false;
        else {
            Boot other = (Boot) obj;
            return super.equals(obj) && heelType == other.heelType;
        }
    }

    @Override
    public String toString() {
        // return String.join(" ", super.toString(), heelType);
        return super.toString() + " " + heelType;
    }
    

}