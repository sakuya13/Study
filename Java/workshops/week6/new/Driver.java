public class Driver {
    public static void main(String[] args) {
        Movie myMovie = new Movie();

        myMovie.setTitle("Fat loves cat more than anyone!");
        myMovie.setRank(1);
        myMovie.setRunTime(100000);

        System.out.println(myMovie.toString());
    }
}

