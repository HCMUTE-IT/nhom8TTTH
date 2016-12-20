package chuongnh.com.model;

import java.util.Date;

public class Poster {
	public Poster() {
		// TODO Auto-generated constructor stub
		DateCreated = (new Date()).toString();
	}
	public String Title;
	public String Id;
	public String Content;
	public String Description;
	public String DateCreated;
	public String Image;
	public String CourseId;

	public String CreatedBy;
}
