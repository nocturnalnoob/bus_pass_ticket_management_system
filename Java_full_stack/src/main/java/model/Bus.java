package model;

public class Bus {
	private String aadhar;
    private String name;
    private String gender;
    private int age;

    // Getters
    public String getId() {
        return aadhar;
    }

    public String getName() {
        return name;
    }

    public String getSpecies() {
        return gender;
    }

    public int getAge() {
        return age;
    }
    
  

    // Setters
    public void setId(String aadhar) {
        this.aadhar = aadhar;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSpecies(String gender) {
        this.gender = gender;
    }

    public void setAge(int age) {
        this.age = age;
    }
}


