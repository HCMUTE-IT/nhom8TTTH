package chuongnh.com.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import chuongnh.com.model.*;
import chuongnh.com.model.Class;

public class CourseUtils {
	private ResultSet rs = null;

	public CourseUtils() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Course> getArray() throws SQLException {
		/*HOA CODE*/
		ArrayList<Course> courses = new ArrayList<>();
		String sql = "SELECT * FROM Course";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while(rs.next())
			{
				Course course = new Course();
				course.Id = rs.getString("Id");
				course.CourseName = rs.getString("CourseName");
				course.Description = rs.getString("Description");
				course.DateCreated = rs.getString("DateCreated");
				course.Image =rs.getString("Image");
				course.CreatedBy = rs.getString("CreatedBy");
				courses.add(course);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//ConnectMysql.closeConnet();
		return courses;
	}
	
	
	public Course get(String Id) throws SQLException {
		/*HOA CODE*/
		Course course = new Course();
		String sql = "SELECT * FROM Course WHERE Id='"+Id+"'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while(rs.next())
			{
				course.Id = rs.getString("Id");
				course.CourseName = rs.getString("CourseName");
				course.Description = rs.getString("Description");
				course.DateCreated = rs.getString("DateCreated");
				course.Image =rs.getString("Image");
				course.CreatedBy = rs.getString("CreatedBy");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//ConnectMysql.closeConnet();
		return course;
	}

	public boolean insert(Course c) throws SQLException {
		String sql = "INSERT INTO Course(CourseName,Description,Image,CreatedBy) " + "value('" + c.CourseName
				+ "','" + c.Description + "','" + c.Image + "','" + c.CreatedBy + "')";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		//ConnectMysql.closeConnet();
		return false;
	}

	public boolean update(Course c) throws SQLException {
		String sql = "UPDATE Course SET " + "CourseName='" + c.CourseName + "'," + "Description='" + c.Description + "',"
				 + "Image='" + c.Image + "'," + "CreatedBy='" + c.CreatedBy
				+ "' WHERE Id='" + c.Id + "'";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		//ConnectMysql.closeConnet();
		return false;
	}

	public boolean delete(String id) throws SQLException {
		String sql = "DELETE FROM Course WHERE Id='" + id + "'";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		//ConnectMysql.closeConnet();
		return false;
	}

	

}
