public class Movie {
    private String title;
    private int rank;
    private int runTime;
    private Character character;

    public Movie() {
        title = "Fat Love Cat";
        rank = 1;
        runTime = Integer.MAX_VALUE;
        character = new Character("Fatbu", "Fat", "R", title);
    }

    public Movie(String title, int rank, int runTime, Character character) {
        this.title = title;
        this.rank = rank;
        this.runTime = runTime; 
        this.character = character;
    }

//    public void setTitle(String title) {
//        this.title = title;
//    }
//
//
//    public void setRank(int rank) {
//        this.rank = rank;
//    }
//
//    public void setRunTime(int runTime) {
//        this.runTime = runTime;
//    }
//    
//    public void setCharactor(Character character) {
//        this.character = character;
//    }

    public String getTitle() {
        return title;
    }

    public int getRank() {
        return rank;
    }

    public int getRunTime() {
        return runTime;
    }

    public Character getCharacter() {
        return character;
    }

    public String toString() {
        return title + "\n" +  String.valueOf(rank) + "\n" + 
               String.valueOf(runTime) + "\n" + character.getCharacter();
    }

    public boolean equals(Movie movie) {
        return ((title == movie.title) && (rank == movie.rank) && 
                (runTime == movie.runTime));
    }        
}

