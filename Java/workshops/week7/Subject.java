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
        for (int i = 0; i < studentList.length; i++) {
            this.studentList[i] = studentList[i];
        }
    }
   

    // copy constructor
    public Subject(Subject subject) {
        this.code = subject.code;
        this.title = subject.title;
        this.coordinator = subject.coordinator;
        for (int i = 0; i < studentList.length; i++) {
            if (subject.studentList[i] != null) {
                this.studentList[i] = subject.studentList[i];
            }
        }
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
        Student[] copyList = new Student[1000];
        for (int i = 0; i < studentList.length; i++) {
            if (studentList[i] != null) {
                copyList[i] = new Student(studentList[i]);
            }
        }
        return copyList;
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
