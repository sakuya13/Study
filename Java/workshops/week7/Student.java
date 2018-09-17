public class Student {
    private String name = null;
    private int number = 0;
    private String username = null;
    private Subject[] enrollList = new Subject[4];

    public Student() {
        name = "undefined";
        number = 0;
        username = "undefined";

        for (int i = 0; i < enrollList.length; i++) {
            enrollList[i] = null;
        }
    }

    // copy constructor
    public Student(String name, int number, String username, Subject[] enrollList) {
        this.name = name;
        this.number = number;
        this.username = username;
        this.enrollList = copy(enrollList);
    }
    
    
    public Student(Student student) {
        this.name = student.name;
        this.number = student.number;
        this.username = student.username;
        this.enrollList = copy(student.enrollList);
    }

    // TODO: there is no copy constructors for an array
    public static Subject[] copy(Subject[] origin) {
        Subject[] newArray = new Subject[origin.length];
        for (int i = 0; i < origin.length; i++) {
            if (origin[i] != null) {
                newArray[i] = origin[i];
            }
        }
        return newArray;
    }


    public void setName(String name) {
        this.name = name;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getName() {
        return name;
    }

    public int getNumber() {
        return number;
    }

    public String getUsername() {
        return username;
    }
    
    public Subject[] getEnrollList() {
        return copy(enrollList);
    }
    
    public String toString() {
        return name + " " + Integer.toString(number) + " " + username + "\n" + enrollList[0] +
                "\n" + enrollList[1] + "\n" + enrollList[2] + "\n" + enrollList[3];
    }
    
    public boolean equals(Student student) {
        return (name.equals(student.name) && (number == student.number) &&
                username.equals(student.username));
    }
    
    public void enroll(Subject subject) {
       for (int i = 0; i < enrollList.length; i++) {
           if (enrollList[i] == null) {
               enrollList[i] = new Subject(subject);
               break;
           }
       }
    }
    
    public void unenroll(Subject subject) {
        for (int i = 0; i < enrollList.length; i++ ) {
            if (enrollList[i] != null) {
                if (subject.equals(enrollList[i])) {
                    enrollList[i] = null;
                }
            }
        }
    }

}
