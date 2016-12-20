package chuongnh.com.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import chuongnh.com.model.Blog;
import chuongnh.com.model.Post;

public class PostUtils {
	private ResultSet rs = null;

	public PostUtils() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Post> getArray() throws SQLException {
		ArrayList<Post> posts = new ArrayList<>();
		String sql = "SELECT * FROM Post";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);

			while (rs.next()) {
				Post p = new Post();
				p.Id = rs.getString("Id");
				p.Title = rs.getString("Title");
				p.Content = rs.getString("Content");
				p.DateCreated = rs.getString("DateCreated");
				p.CreatedBy = rs.getString("CreatedBy");
				p.Image = rs.getString("Image");
				p.BlogId = rs.getString("BlogId");

				posts.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return posts;
	}

	public ArrayList<Post> getArray(String BlogId) throws SQLException {
		ArrayList<Post> posts = new ArrayList<>();
		String sql = "SELECT * FROM Post WHERE BlogId='" + BlogId + "'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);

			while (rs.next()) {
				Post p = new Post();
				p.Id = rs.getString("Id");
				p.Title = rs.getString("Title");
				p.Content = rs.getString("Content");
				p.DateCreated = rs.getString("DateCreated");
				p.CreatedBy = rs.getString("CreatedBy");
				p.Image = rs.getString("Image");
				p.BlogId = rs.getString("BlogId");

				posts.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return posts;
	}

	public Post get(String Id) throws SQLException {
		Post p = new Post();
		String sql = "SELECT * FROM Post WHERE Id='" + Id + "'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);

			while (rs.next()) {
				p.Id = rs.getString("Id");
				p.Title = rs.getString("Title");
				p.Content = rs.getString("Content");
				p.DateCreated = rs.getString("DateCreated");
				p.CreatedBy = rs.getString("CreatedBy");
				p.Image = rs.getString("Image");
				p.BlogId = rs.getString("BlogId");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return p;
	}

	public boolean insert(Post p) throws SQLException {

		String sql = "INSERT INTO Post(Title,Content,Image,BlogId,CreatedBy) value('" + p.Title + "','" + p.Content
				+ "','" + p.Image + "','" + p.BlogId + "','" + p.CreatedBy + "')";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		// ConnectMysql.closeConnet();
		return false;
	}

	public boolean update(Post p) throws SQLException {

		String sql = "UPDATE Post set Title = '" + p.Title + "', Content='" + p.Content + "', Image='" + p.Image
				+ "', BlogId='" + p.BlogId + "', CreatedBy='" + p.CreatedBy + "' WHERE Id='" + p.Id + "'";
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

		String sql = "DELETE FROM Post WHERE Id='" + id + "'";
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
