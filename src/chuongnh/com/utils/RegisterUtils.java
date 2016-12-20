package chuongnh.com.utils;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;

import chuongnh.com.model.Register;


public class RegisterUtils {
	public RegisterUtils() {
		// TODO Auto-generated constructor stub
	}

	private ResultSet rs = null;

	public ArrayList<Register> getArray() throws SQLException {
		ArrayList<Register> as = new ArrayList<>();

		String sql = "SELECT * FROM Register";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);

			while (rs.next()) {
				Register a = new Register();
				a.Id = rs.getString("Id");
				a.Fullname = rs.getString("Fullname");
				a.Email = rs.getString("Email");
				a.Phone = rs.getString("Phone");
				a.Note = rs.getString("Note");
				a.ClassId = rs.getString("ClassId");
				a.DateReg = rs.getString("DateReg");

				as.add(a);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ConnectMysql.closeConnet();
		return as;
	}
	
	public String getListEmail() throws SQLException {
		String ListMail="";
		String sql = "SELECT EMAIL FROM Register";
		try {
			rs = ConnectMysql.getStatement().executeQuery(sql);

			while (rs.next() && rs != null) {
				//Register a = new Register();
//				a.Id = rs.getString("Id");
//				a.Fullname = rs.getString("Fullname");
				//a.Email = rs.getString("Email");
//				a.Phone = rs.getString("Phone");
//				a.Note = rs.getString("Note");
//				a.ClassId = rs.getString("ClassId");
//				a.DateReg = rs.getString("DateReg");
				ListMail += rs.getString("Email")+",";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(ListMail.length()>3)
		{
			return ListMail.substring(0, ListMail.length()-1);
		}

		// ConnectMysql.closeConnet();
		return ListMail;
	}

	

	public boolean insert(Register a) throws SQLException {

		String sql = "INSERT INTO Register(Fullname,Email,Phone,Note,ClassId)"
				+ " value('" + a.Fullname + "','" + a.Email + "','" + a.Phone + "','" + a.Note + "','"
				+ a.ClassId  +"')";
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
