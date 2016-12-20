package chuongnh.com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chuongnh.com.model.*;

import chuongnh.com.utils.*;

/**
 * Servlet implementation class EditRoleServlet
 */
@WebServlet(description = "Nguyen Hoang Chuong", urlPatterns = { "/EditRoleServlet" })
public class EditRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditRoleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		RoleAccount r = new RoleAccount();
		try {

			r.Id = request.getParameter("RoleId");
			r.RoleName = request.getParameter("RoleName");

			HttpSession session = request.getSession(true);
			r.CreatedBy = (String) session.getAttribute("UserNameLoginBackend");
			(new RoleUtils()).update(r);
			response.sendRedirect("BACKEND/admin-list-role.jsp");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
