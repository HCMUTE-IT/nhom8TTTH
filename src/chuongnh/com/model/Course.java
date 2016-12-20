package chuongnh.com.model;

import java.util.Date;

public class Course {

	public Course() {
		// TODO Auto-generated constructor stub
		DateCreated = new Date().toString();
	}

	public String Id;
	public String CourseName;
	public String Description;
	public String DateCreated;
	public String Image;

	public String CreatedBy;
}
