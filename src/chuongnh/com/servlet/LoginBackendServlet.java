package chuongnh.com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chuongnh.com.utils.LoginUtils;

/**
 * Servlet implementation class LoginBackendServlet
 */
@WebServlet(description = "Nguyen Hoang Chuong", urlPatterns = { "/LoginBackendServlet" })
public class LoginBackendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginBackendServlet() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Create a session object if it is already not created.

		String Password = request.getParameter("password");
		String UserName = request.getParameter("username");
		String role = request.getParameter("role");

		if ("admin".equals(role)) {

			try {
				if ((new LoginUtils()).loginAdmin(UserName, Password) == true) {

					HttpSession session = request.getSession(true);
					session.setAttribute("UserNameLoginBackend", UserName);
					session.setAttribute("RoleLoginBackend", role);
					response.sendRedirect("BACKEND/admin-dashboard.jsp");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("content".equals(role)) {

			try {
				if ((new LoginUtils()).loginContent(UserName, Password) == true) {

					HttpSession session = request.getSession(true);
					session.setAttribute("UserNameLoginBackend", UserName);
					session.setAttribute("RoleLoginBackend", role);
					response.sendRedirect("BACKEND/content-dashboard.jsp");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {

			try {
				if ((new LoginUtils()).loginAdvisory(UserName, Password) == true) {

					HttpSession session = request.getSession(true);
					session.setAttribute("UserNameLoginBackend", UserName);
					session.setAttribute("RoleLoginBackend", role);
					response.sendRedirect("BACKEND/advisory-dashboard.jsp");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
