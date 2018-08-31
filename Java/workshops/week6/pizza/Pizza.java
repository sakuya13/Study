public class Pizza {
    private String size = "small";
    private int numCheese = 0, numPep = 0, numHam = 0;
    
    public Pizza() {}

    public Pizza(String size, int numCheese, int numPep, int numHam) {
        this.size = size;
        this.numCheese = numCheese;
        this.numPep = numPep;
        this.numHam = numHam;
    }
    
    public Pizza(Pizza original) {
        if (original == null) {
            System.out.println("error21");
            System.exit(0);
        } else {
            size = original.size;
            numCheese = original.numCheese;
            numPep = original.numPep;
            numHam = original.numHam;
        }
    }

    public String getSize() {
        return size;
    }

    public int getNumCheese() {
        return numCheese;
    }

    public int getNumPep() {
        return numPep;
    }

    public int getNumHam() {
        return numHam;
    }

    public void setSize(String size) {
        if (sizeOk(size)) {
            this.size = size;
        } else {
            System.out.print("Invalid input!");
            System.exit(0);
        }
    }

    public void setNumCheese(int numCheese) {
        if (numCheese > 0) {
            this.numCheese = numCheese;
        } else {
            System.out.print("Invalid input!");
            System.exit(0);
        }
    }


    public void setNumPep(int numPep) {
        if (numPep > 0) {
            this.numPep = numPep;
        } else {
            System.out.print("Invalid input!");
            System.exit(0);
        }
    }

    public void setNumHam(int numHam) {
        if (numHam > 0) {
            this.numHam = numHam;
        } else {
            System.out.print("Invalid input!");
            System.exit(0);
        }
    }

    private boolean sizeOk(String size) {
        return (size.equals("small") || size.equals("medium") || size.equals("large"));
    }

    public double calcCost() {
        double toppingCost = 2.0*(numHam + numPep + numCheese);
        if (size.equals("small")) {
            return (10.0 + toppingCost);
        } else if (size.equals("medium")) {
            return (12.0 + toppingCost);
        } else if (size.equals("large")) {
            return (14.0 + toppingCost);
        } else {
            System.out.println("Something wrong!");
            //return -1.0;
            throw new IllegalArgumentException();
        }
    }
    
    public String getDescription() {
        return "A " + size + " pizza with " + numCheese + " cheese, " +  numPep + " pepperoni and "
               + numHam + " ham toppings should cost a total of $" + this.calcCost() + ".";
    }
    
}
