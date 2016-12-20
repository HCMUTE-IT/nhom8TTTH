package chuongnh.com.utils;

import java.sql.ResultSet;

import chuongnh.com.model.UserAccount;
import chuongnh.com.utils.ConnectMysql;

public class LoginUtils {

	private ResultSet rs = null;

	public LoginUtils() {
		// TODO Auto-generated constructor stub
	}

	public boolean login(String UserName, String Password) throws Exception {

		String sql = "SELECT * FROM UserAccount WHERE UserName = '" + UserName + "'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		ConnectMysql.closeConnet();
		return false;
	}

	public boolean loginAdmin(String UserName, String Password) throws Exception {

		String sql = "SELECT * FROM UserAccount WHERE UserName = '" + UserName + "' && Password='" + Password
				+ "' && RoleId='1'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		ConnectMysql.closeConnet();
		return false;
	}

	public boolean loginContent(String UserName, String Password) throws Exception {

		String sql = "SELECT * FROM UserAccount WHERE UserName = '" + UserName + "' && Password='" + Password
				+ "' && RoleId='2'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		ConnectMysql.closeConnet();
		return false;
	}

	public boolean loginAdvisory(String UserName, String Password) throws Exception {

		String sql = "SELECT * FROM UserAccount WHERE UserName = '" + UserName + "' && Password='" + Password
				+ "' && RoleId='3'";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		ConnectMysql.closeConnet();
		return false;
	}

}
