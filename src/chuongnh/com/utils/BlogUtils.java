package chuongnh.com.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import chuongnh.com.model.*;

public class BlogUtils {
	private ResultSet rs = null;

	public BlogUtils() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Blog> getArray() throws SQLException {
		ArrayList<Blog> blogs = new ArrayList<>();
		String sql = "SELECT * FROM Blog";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				Blog b = new Blog();
				b.Id = rs.getString("Id");
				b.Title = rs.getString("Title");
				b.Image = rs.getString("Image");
				b.Content = rs.getString("Content");
				b.DateCreated = rs.getString("DateCreated");
				b.CreatedBy = rs.getString("CreatedBy");
				blogs.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return blogs;
	}

	public Blog get(String Id) throws SQLException {
		Blog b = new Blog();
		String sql = "SELECT * FROM Blog WHERE Id='" + Id + "'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				b.Id = rs.getString("Id");
				b.Title = rs.getString("Title");
				b.Image = rs.getString("Image");
				b.Content = rs.getString("Content");
				b.DateCreated = rs.getString("DateCreated");
				b.CreatedBy = rs.getString("CreatedBy");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return b;
	}

	public boolean insert(Blog b) throws SQLException {

		String sql = "INSERT INTO Blog(Title,Content,Image,CreatedBy) value('" + b.Title + "','" + b.Content + "','"
				+ b.Image + "','" + b.CreatedBy + "')";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		// ConnectMysql.closeConnet();
		return false;
	}

	public boolean update(Blog b) throws SQLException {

		String sql = "UPDATE Blog set Title='" + b.Title + "', Content='" + b.Content + "', Image='" + b.Image
				+ "', CreatedBy='"+b.CreatedBy+"' WHERE Id='" + b.Id + "'";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		ConnectMysql.closeConnet();
		return false;
	}

	public boolean delete(String id) throws SQLException {

		String sql = "DELETE FROM Blog WHERE Id='" + id + "'";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		ConnectMysql.closeConnet();
		return false;
	}
}
