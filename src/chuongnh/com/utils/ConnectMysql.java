package chuongnh.com.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectMysql {

	public ConnectMysql() {
		// TODO Auto-generated constructor stub
	}

	private static Connection connect = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	/**
	 * Check Driver connect to MySQL
	 */
	protected static void hasDriver() throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			throw new Exception("Invalid Driver!!Please check this drver....");
		}
	}

	/**
	 * Function used to get the connection to the Database Step 1 - I check my
	 * connection or not!! Step 2 - If not, it will be null and initialization.
	 * Step 3 - Then it return
	 * 
	 * @return Connection
	 */
	public static Connection openConnect() throws Exception {
		if (connect == null) {
			hasDriver();
			String url = "jdbc:mysql://node179294-chuongnh.jelastic.servint.net/14110013db?useUnicode=true&characterEncoding=UTF-8";
			//jdbc:mysql://node179294-chuongnh.jelastic.servint.net
			// url_sql = "....";
			try {
				connect = DriverManager.getConnection(url, "root", "RQTmdi04686");//RQTmdi04686
			} catch (SQLException e) {
				throw new Exception(e.getMessage() + "Connect failed to database .... ");
			}
		}
		return connect;
	}

	/**
	 * Make a Statement to execute the SQL statement
	 * 
	 * @return Statement
	 */
	public static Statement getStatement() throws SQLException, Exception {
		if (stmt == null) {
			stmt = openConnect().createStatement();
		}
		return stmt;
	}

	/**
	 * A method to close the connection.
	 * 
	 * @throws SQLException
	 */
	public static void closeConnet() throws SQLException {
		if (rs != null && !rs.isClosed())
			rs.close();
		if (stmt != null)
			stmt.close();
		if (connect != null)
			connect.close();
	}
}
