package Pack;
//Model file for database table login(meaning users). Get & set for all attributes.
public class User {
	String username;
	String name;
	String birthdate;
	String password;

    public User() {
    }
    
    public User(String username, String name, String birthdate, String password) {
		this.username = username;
		this.name = name;
		this.birthdate = birthdate;
		this.password = password;
	}
	
    public String getUsername() {
		return username;
	}
	
    public void setUsername(String username) {
		this.username = username;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public String getBirthdate() {
		return birthdate;
	}
	
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
    
    
    
}

