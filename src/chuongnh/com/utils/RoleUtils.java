package chuongnh.com.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import chuongnh.com.model.RoleAccount;

public class RoleUtils {

	private ResultSet rs = null;

	public RoleUtils() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<RoleAccount> getArray() throws SQLException {
		ArrayList<RoleAccount> rl = new ArrayList<>();

		String sql = "SELECT * FROM RoleAccount";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);
			while (rs.next()) {
				RoleAccount r = new RoleAccount();
				r.Id = rs.getString("Id");
				r.RoleName = rs.getString("RoleName");
				r.DateCreated = rs.getDate("DateCreated");
				r.CreatedBy = rs.getString("CreatedBy");
				rl.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return rl;
	}

	public boolean insert(RoleAccount r) throws SQLException {

		String sql = "INSERT INTO RoleAccount (RoleName) value('" + r.RoleName + "')";
		try {
			return ConnectMysql.getStatement().execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		ConnectMysql.closeConnet();
		return false;
	}

	public boolean update(RoleAccount r) throws SQLException {

		String sql = "UPDATE RoleAccount SET RoleName='" + r.RoleName + "' WHERE Id= '" + r.Id + "'";
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

		String sql = "DELETE FROM RoleAccount WHERE Id='" + id + "'";
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
