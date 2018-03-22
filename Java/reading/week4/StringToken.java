import java.util.StringTokenizer;

public class StringToken {
    public static void main(String[] args) {
        StringTokenizer wordFactory = new StringTokenizer("A single word can be critical");
        while (wordFactory.hasMoreTokens()) {
            System.out.println(wordFactory.nextToken() + " tokens left: "
                               + wordFactory.countTokens());
        }
    }
}

