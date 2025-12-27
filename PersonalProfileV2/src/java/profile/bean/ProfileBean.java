package profile.bean;

public class ProfileBean {
    private String name;
    private String studentId;
    private String program;
    private String email;
    private String hobby;
    private String intro;
    
    public ProfileBean() {
        name=null;
        studentId=null;
        program=null;
        email=null;
        hobby=null;
        intro=null;
    }
    
    public ProfileBean(String name, String studentId, String program, String email, String hobby, String intro) {
        this.name=name;
        this.studentId=studentId;
        this.program=program;
        this.email=email;
        this.hobby=hobby;
        this.intro=intro;
    }
    
    public String getName(){return name;}
    public String getStudentId(){return studentId;}
    public String getProgram(){return program;}
    public String getEmail(){return email;}
    public String getHobby(){return hobby;}
    public String getIntro(){return intro;}
    
    public void setName(String Name){this.name=name;}
    public void setStudentId(String studentId){this.studentId=studentId;}
    public void setProgram(String program){this.program=program;}
    public void setEmail(String email){this.email=email;}
    public void setHobby(String hobby){this.hobby=hobby;}
    public void setIntro(String intro){this.intro=intro;}
    
}
