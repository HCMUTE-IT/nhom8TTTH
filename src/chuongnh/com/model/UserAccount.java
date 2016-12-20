package chuongnh.com.model;

import java.util.Date;

public class UserAccount {

	public UserAccount() {
		// TODO Auto-generated constructor stub
		Birthday =  new Date().toString();
		DateCreated=new Date().toString();
	}
	public long Id;
	public String UserName;
	public String Password;
	public String Fullname;
	public String Email;
	public String PhoneNumber;
	public String Birthday;
	public String DateCreated;
	public String Gender;
	public String Address;
	public String Image;
	
	public String RoleId;
}
