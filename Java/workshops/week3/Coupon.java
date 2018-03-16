import java.util.Scanner;

public class Coupon {
    public static void main(String[] args) {
        int candyPrice = 10;
        int gumballPrice = 3;

        Scanner keyboard = new Scanner(System.in);
        System.out.println("How many coupons do you have?");
        int couponNum = keyboard.nextInt();
        int candyNum = couponNum / candyPrice;
        int gumballNum = (couponNum - candyNum * candyPrice) / gumballPrice;
        
        System.out.println("couponNum: " + couponNum);
        System.out.println("candyNum: " + candyNum);
        System.out.println("gumballNum: " + gumballNum);
        System.out.println("remainNum: " + (couponNum - candyNum*candyPrice
                                            - gumballNum*gumballPrice));

    }
}
