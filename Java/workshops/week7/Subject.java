public class Subject {
    private String code = null;
    private String title = null;
    private String coordinator = null;
    private Student[] studentList = new Student[1000];

    public Subject() {
        code = "undefined";
        title = "undefined";
        coordinator = "unassigned";
        for (int i = 0; i < studentList.length; i++) {
            studentList[i] = null;
        }
    }

    public Subject(String code, String title, String coordinator, Student[] studentList) {
        this.code = code;
        this.title = title;
        this.coordinator = coordinator;
        this.studentList = copy(studentList);
    }
   

    // copy constructor
    public Subject(Subject subject) {
        this.code = subject.code;
        this.title = subject.title;
        this.coordinator = subject.coordinator;
        this.studentList = copy(subject.studentList);
    }
    
    public static Student[] copy(Student[] origin) {
        Student[] newArray = new Student[origin.length];
        for (int i = 0; i < origin.length; i++) {
            if (origin[i] != null) {
                newArray[i] = origin[i];
            }
        }
        return newArray;
    }


    public String getCode() {
        return code;
    }

    public String getTitle() {
        return title;
    }

    public String getCoordinator() {
        return coordinator;
    }

    public Student[] getStudentList() {
        return copy(studentList);
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCoordinator(String coordinator) {
        this.coordinator = coordinator;
    }

    public String toString() {
        return code + " " + title + " " + coordinator;
    }

    public boolean equals(Subject subject) {
        return ((code.equals(subject.code)) && (title.equals(subject.title)) &&
                 (coordinator.equals(subject.coordinator)));
    }
    


}
