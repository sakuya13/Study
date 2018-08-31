public class PizzaOrder {
    private Pizza pizza1 = null;
    private Pizza pizza2 = null;
    private Pizza pizza3 = null;
    private int numPizzas = 0;

    public PizzaOrder() {}
    
    public PizzaOrder(PizzaOrder original) {
        if (original != null) {
            if (original.pizza1 != null) { //TODO: must be orignial pizza! or wil be this.pizza
                pizza1 = new Pizza(original.pizza1);
            }
            if (original.pizza2 != null) {
                pizza2 = new Pizza(original.pizza2);
            }
            if (original.pizza3 != null) {
                pizza3 = new Pizza(original.pizza3);
            }
        } else {
            System.out.println("error26");
            System.exit(0);
        }
        numPizzas = original.numPizzas;
    }


    public void setNumPizzas(int numPizzas) {
        this.numPizzas = numPizzas;
    }

    public void setPizza1(Pizza pizza1) {
        this.pizza1 = pizza1;
    }

    public void setPizza2(Pizza pizza2) {
        this.pizza2 = pizza2;
    }
        
    public void setPizza3(Pizza pizza3) {
        this.pizza3 = pizza3;
    }

    public Pizza getPizza1() {
//        if (pizza1 != null) {
//            return new Pizza(pizza1);
//        }
//        return null;
        return pizza1;
    }

    public Pizza getPizza2() {
        //System.out.println(pizza2);
//        if (pizza2 != null) {
//            return new Pizza(pizza2);
//        }
//        return null;
        return pizza2;
    }

    public Pizza getPizza3() {
//        if (pizza3 != null) {
//            return new Pizza(pizza3);
//        }
//        return null;
        return pizza3;
    }
    
    public int getNumPizzas() {
        return numPizzas;
    }
    
    public double calcTotal() {
        if (numPizzas == 1) {
            return pizza1.calcCost();
        } else if (numPizzas == 2) {
            return (pizza1.calcCost() + pizza2.calcCost());
        } else {
            return (pizza1.calcCost() + pizza2.calcCost() + pizza3.calcCost());
        }
    }

    public static void main(String[] args) {
        Pizza pizza1 = new Pizza("large", 1, 0, 1);
        Pizza pizza2 = new Pizza("medium", 2, 2, 0);

        PizzaOrder order1 = new PizzaOrder();
        order1.setNumPizzas(2);
        order1.setPizza1(pizza1);
        order1.setPizza2(pizza2);
        double totalO1 = order1.calcTotal();

        PizzaOrder order2 = new PizzaOrder(order1);
        order2.getPizza1().setNumCheese(3);
        double totalO2 = order2.calcTotal();
        double origTotal = order1.calcTotal();
        System.out.println("O1 total cost: " + totalO1);
        System.out.println("O2 total cost: " + totalO2);
        System.out.println("O1 total cost after O2: " + origTotal);
    }
}
