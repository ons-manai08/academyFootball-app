package com.project.payload.request;

import java.util.Set;

import javax.validation.constraints.*;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder 
public class SignupRequest {
    @NotBlank
    @Size(min = 3, max = 20)
    private String username;
 
    @NotBlank
    @Size(max = 50)
    @Email
    private String email;
    
    private Set<String> role;
    
    @NotBlank
    @Size(min = 6, max = 40)
    private String password;
    
    //@NotBlank
	@Size(max = 120)
	private String phone;
	
    @NotNull
	private int age;
  
    /*@Override
	public String toString() {
		return "SignupRequest [username=" + username + ", email=" + email + ", role=" + role + ", password=" + password
				+ ", phone=" + phone + ", age=" + age + "]";
	}

	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	public SignupRequest(@NotBlank @Size(min = 3, max = 20) String username,
			@NotBlank @Size(max = 50) @Email String email, Set<String> role,
			@NotBlank @Size(min = 6, max = 40) String password, @NotBlank @Size(max = 120) String phone,
			@NotBlank String age) {
		super();
		this.username = username;
		this.email = email;
		this.role = role;
		this.password = password;
		this.phone = phone;
		this.age = age;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getUsername() {
        return username;
    }
 
    public void setUsername(String username) {
        this.username = username;
    }
 
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
 
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
    
    public Set<String> getRole() {
      return this.role;
    }
    
    public void setRole(Set<String> role) {
      this.role = role;
    }*/
}
