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

        for (int i = 0; i < enrollList.length; i++) {
            this.enrollList[i] = enrollList[i];
        }
    }
    
    
    public Student(Student student) {
        this.name = student.name;
        this.number = student.number;
        this.username = student.username;

        for (int i = 0; i < enrollList.length; i++) {
            if (student.enrollList[i] != null){
                this.enrollList[i] = student.enrollList[i];
            }
        }
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
        Subject[] newList = new Subject[4];
        for (int i = 0; i < newList.length; i++) {
            if (enrollList[i] != null) {
                newList[i] = new Subject(enrollList[i]);
            }
        }
        return newList;
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
