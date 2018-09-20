/**
 * ShoeDemo
 */
public class ShoeDemo {

    public static void main(String[] args) {
        Shoe[] shoes = new Shoe[4];

        shoes[0] = new Shoe("blue", "designer1", 3.5);
        shoes[1] = new DressShoe("red", "designer2", 3.6, Heel.FLAT); //LSP substitution priciple
        shoes[2] = new Boot("black", "designer3", 5.7, Heel.HEEL); //LSP substitution priciple
        shoes[3] = new TennisShoe("green", "designer4", 2.3, "df", "can"); //LSP substitution priciple

        System.out.println(shoes[1]); // which toString it use? late binding
    }
}