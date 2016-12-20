package chuongnh.com.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import chuongnh.com.model.Class;

public class ClassUtils {
	private ResultSet rs = null;

	public ClassUtils() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Class> getArray() throws SQLException {
		ArrayList<Class> classes = new ArrayList<>();
		/* HOA CODE */
		String sql = "SELECT * FROM Class";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				Class cs = new Class();
				cs.Id = rs.getString("Id");
				cs.ClassName = rs.getString("ClassName");
				cs.ClassFee = rs.getString("ClassFee");
				cs.Description = rs.getString("Description");
				cs.DateCreated = rs.getString("DateCreated");
				cs.Image = rs.getString("Image");
				cs.Address = rs.getString("Address");
				cs.Startup = rs.getString("Startup");
				cs.TimeOut = rs.getString("TimeOut");
				cs.Schedule = rs.getString("Schedule");
				cs.CourseId = rs.getString("CourseId");
				classes.add(cs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return classes;
	}

	public Class get(String Id) throws SQLException {
		Class cs = new Class();
		/* HOA CODE */
		String sql = "SELECT * FROM Class WHERE Id='" + Id + "'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				cs.Id = rs.getString("Id");
				cs.ClassName = rs.getString("ClassName");
				cs.ClassFee = rs.getString("ClassFee");
				cs.Description = rs.getString("Description");
				cs.DateCreated = rs.getString("DateCreated");
				cs.Image = rs.getString("Image");
				cs.Address = rs.getString("Address");
				cs.Startup = rs.getString("Startup");
				cs.TimeOut = rs.getString("TimeOut");
				cs.Schedule = rs.getString("Schedule");
				cs.CourseId = rs.getString("CourseId");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return cs;
	}

	/* HOA CODE */
	public ArrayList<Class> getClassFromCourseID(String CourseId) throws SQLException {
		ArrayList<Class> classes = new ArrayList<>();
		/* HOA CODE */
		String sql = "SELECT * FROM Class WHERE CourseId='" + CourseId + "'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				Class cs = new Class();
				cs.Id = rs.getString("Id");
				cs.ClassName = rs.getString("ClassName");
				cs.ClassFee = rs.getString("ClassFee");
				cs.Description = rs.getString("Description");
				cs.DateCreated = rs.getString("DateCreated");
				cs.Image = rs.getString("Image");
				cs.Address = rs.getString("Address");
				cs.Startup = rs.getString("Startup");
				cs.TimeOut = rs.getString("TimeOut");
				cs.Schedule = rs.getString("Schedule");
				cs.CourseId = rs.getString("CourseId");
				classes.add(cs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return classes;
	}

	public boolean insert(Class c) throws SQLException {
		String sql = "INSERT INTO Class(ClassName,ClassFee,Description,"
				+ "Image,Address,Startup,TimeOut,Schedule,CourseId) " + "value('" + c.ClassName + "','" + c.ClassFee
				+ "','" + c.Description + "','" + c.Image + "','" + c.Address + "','" + c.Startup + "','" + c.TimeOut
				+ "','" + c.Schedule + "','" + c.CourseId + "')";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		// ConnectMysql.closeConnet();
		return false;
	}

	public boolean update(Class c) throws SQLException {
		String sql = "UPDATE Class set ClassName = '" + c.ClassName + "',ClassFee='" + c.ClassFee + "',Description='"
				+ c.Description + "',Image='" + c.Image + "',Address='" + c.Address + "',Startup='"
				+ c.Startup + "',TimeOut='" + c.TimeOut + "',Schedule='" + c.Schedule + "',CourseId='" + c.CourseId
				+ "' WHERE Id ='" + c.Id + "'";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		// ConnectMysql.closeConnet();
		return false;
	}

	public boolean delete(String id) throws SQLException {
		String sql = "DELETE FROM Class WHERE Id='" + id + "'";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		// ConnectMysql.closeConnet();
		return false;
	}

}
