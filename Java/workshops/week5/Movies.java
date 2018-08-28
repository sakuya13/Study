import java.util.StringTokenizer;

public class Movies {
    private static String FAVOURABLE = "1. fat is cute, 2. fat is cute";

    public static void printMovies() {
        System.out.println("1. fat is cute");
    }

    public static void printMovies(int rank, String movie) {
        System.out.println(rank + ". " + movie);
    }
    
    public static void printMovies(String movies) {
        StringTokenizer tk = new StringTokenizer(movies, ","); //the extra args will only add more delimiters but still keep the space
        int i = 1;
        while (tk.hasMoreTokens()) {
            System.out.println(i + ". " + tk.nextToken().replaceAll("^\\s", ""));
            i++;
        }
    }

//    public static void printMovies(String movies) {
//        String[] movieStrings = movies.split(", "); // use split() to define a specific delimiter
//        for (int i=0; i < movieStrings.length; i++) {
//            System.out.println((i+1) + ". " + movieStrings[i]);
//        }
//    }

    public static boolean isAFavourable(String movie) {
        return FAVOURABLE.contains(movie);
    }

    public static void main(String[] args) {
        printMovies();
        printMovies(1, "fat is cute");
        printMovies(2, "fat is cute");
        System.out.println(isAFavourable("fat"));
        printMovies("The Avenger, Iron Man, Thor");

//        System.out.printf("%s, %d, %n", "fat", 12);
//        System.out.printf("%s, %d, ", "fat", 12);
//        System.out.println();

    }
}


