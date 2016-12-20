package chuongnh.com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chuongnh.com.model.RoleAccount;
import chuongnh.com.model.*;
import chuongnh.com.utils.*;

/**
 * Servlet implementation class InsertRoleServlet
 */
@WebServlet("/InsertRoleServlet")
public class InsertRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertRoleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		RoleAccount role = new RoleAccount();
		try {
			role.RoleName = request.getParameter("rolename");

			HttpSession session = request.getSession(true);
			role.CreatedBy=(String) session.getAttribute("UserNameLoginBackend");
			(new RoleUtils()).insert(role);
			
			response.sendRedirect("BACKEND/admin-list-role.jsp");
		} catch (Exception e) {

		}
		// doGet(request, response);
	}

}
