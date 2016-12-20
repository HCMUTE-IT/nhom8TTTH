package chuongnh.com.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import chuongnh.com.model.Class;
import chuongnh.com.model.Poster;

public class PosterUtils {

	private ResultSet rs = null;

	public PosterUtils() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Poster> getArray() throws SQLException {
		ArrayList<Poster> posters = new ArrayList<>();
		/* HOA CODE */
		String sql = "SELECT * FROM Poster";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				Poster p = new Poster();
				p.Id = rs.getString("Id");
				p.Title = rs.getString("title");
				p.CreatedBy = rs.getString("CreatedBy");
				p.DateCreated = rs.getString("DateCreated");
				p.Description = rs.getString("Description");
				p.Image = rs.getString("Image");
				p.CourseId = rs.getString("CourseId");
				posters.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return posters;
	}

	public Poster get(String Id) throws SQLException {
		/* HOA CODE */
		Poster p = new Poster();
		String sql = "SELECT * FROM Poster WHERE Id= '" + Id + "'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				p.Id = rs.getString("Id");
				p.Title = rs.getString("Title");
				p.CreatedBy = rs.getString("CreatedBy");
				p.DateCreated = rs.getString("DateCreated");
				p.Description = rs.getString("Description");
				p.Image = rs.getString("Image");
				p.CourseId = rs.getString("CourseId");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return p;
	}

	public boolean insert(Poster p) throws SQLException {
		String sql = "INSERT INTO Poster(Title,Description," + "Image, CourseId) " + "value('" + p.Title + "','"
				+ p.Description + "','" + p.Image + "','" + p.CourseId + "')";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		// ConnectMysql.closeConnet();
		return false;
	}

	public boolean update(Poster p) throws SQLException {
		String sql = "UPDATE Poster SET Title = '" + p.Title + "', Description ='" + p.Description + "', Image='"
				+ p.Image + "', CreatedBy='" + p.CreatedBy + "', CourseId = '" + p.CourseId + "' WHERE Id='" + p.Id
				+ "'";
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
		String sql = "DELETE FROM Poster WHERE Id='" + id + "'";
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
