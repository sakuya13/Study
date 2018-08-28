public class Character {
    private String charName;
    private String actName;
    private String rating;
    private String movieTitle;


    public Character(String charName, String actName, String rating, String movieTitle) {
        this.charName = charName;
        this.actName = actName;
        this.rating = rating;
        this.movieTitle = movieTitle;
    }
    
    public String getCharacter() {
        return charName + "\n" + actName + "\n" + rating + "\n" + movieTitle; 
    }

}
