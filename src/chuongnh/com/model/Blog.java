package chuongnh.com.model;

import java.util.Date;

public class Blog {

	public Blog() {
		// TODO Auto-generated constructor stub
		DateCreated = new Date().toString();
	}

	public String Id;
	public String Title;
	public String Content;
	public String Image;

	public String DateCreated;
	public String CreatedBy;
}
