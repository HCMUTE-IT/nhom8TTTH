package chuongnh.com.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import chuongnh.com.model.UserAccount;

public class AccountUtils {

	public AccountUtils() {
		// TODO Auto-generated constructor stub
	}

	private ResultSet rs = null;

	public ArrayList<UserAccount> getArray() throws SQLException {
		ArrayList<UserAccount> as = new ArrayList<>();

		String sql = "SELECT * FROM UserAccount";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);

			while (rs.next()) {
				UserAccount a = new UserAccount();
				a.UserName = rs.getString("Username");
				a.Password = rs.getString("Password");
				a.Fullname = rs.getString("Fullname");
				a.Gender = rs.getString("Gender");
				a.Birthday = rs.getString("Birthday");
				a.Email = rs.getString("Email");
				a.PhoneNumber = rs.getString("PhoneNumber");
				a.RoleId = rs.getString("RoleId");
				a.Address = rs.getString("Address");
				a.Image = rs.getString("Image");
				// a.DateCreated = rs.getString("DateCreated");

				as.add(a);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return as;
	}

	public UserAccount get(String UserName) throws SQLException {
		UserAccount a = new UserAccount();

		String sql = "SELECT * FROM UserAccount WHERE UserName='" + UserName + "'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);

			while (rs.next()) {
				a.UserName = rs.getString("Username");
				a.Password = rs.getString("Password");
				a.Fullname = rs.getString("Fullname");
				a.Gender = rs.getString("Gender");
				a.Birthday = rs.getString("Birthday");
				a.Email = rs.getString("Email");
				a.PhoneNumber = rs.getString("PhoneNumber");
				a.RoleId = rs.getString("RoleId");
				a.Address = rs.getString("Address");
				a.Image = rs.getString("Image");
				// a.DateCreated = rs.getString("DateCreated");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return a;
	}

	public boolean insert(UserAccount a) throws SQLException {

		String sql = "INSERT INTO UserAccount(UserName,Password,Fullname,Gender,Birthday,Email,PhoneNumber,Address,Image,RoleId)"
				+ " value('" + a.UserName + "','" + a.Password + "','" + a.Fullname + "','" + a.Gender + "','"
				+ a.Birthday + "','" + a.Email + "','" + a.PhoneNumber + "','" + a.Address + "','" + a.Image + "','"
				+ a.RoleId + "')";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		//ConnectMysql.closeConnet();
		return false;
	}

	public boolean update(UserAccount a) throws SQLException {

//		HOA CODE
		String sql = "UPDATE UserAccount SET Password ='"+a.Password+"'"
										+ ", Fullname ='"+a.Fullname+"'"
										+ ", Gender ='"+a.Gender+"'"
										+ ", Birthday ='"+a.Birthday+"'"
										+ ", Email ='"+a.Email+"'"
										+ ", PhoneNumber ='"+a.PhoneNumber+"'"
										+ ", Address ='"+a.Address+"'"
										+ ", Image ='"+a.Image+"'"
										+ ", RoleId ='"+a.RoleId+"'"
										+ " WHERE UserName ='"+a.UserName+"'";
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

		String sql = "DELETE FROM UserAccount WHERE Username ='" + id + "'";
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
