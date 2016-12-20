package chuongnh.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import chuongnh.com.utils.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(description = "Nguyen Hoang Chuong", urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		response.getWriter().append("LoginServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("application/json");

		PrintWriter out = response.getWriter();
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			System.out.println("---->" + username);
			System.out.println("---->" + password);
			if ((new LoginUtils().login(username, password))) {

				// Create a session object if it is already not created.
				HttpSession session = request.getSession(true);
				session.setAttribute("UserName", username);

				JSONObject json = new JSONObject();
				json.put("status", true);
				json.put("username", username);
				response.getWriter().write(json.toString());
			}
		} catch (Exception e) {

			JSONObject json = new JSONObject();
			json.put("status", true);
			response.getWriter().write(json.toString());

			e.printStackTrace();
		}
	}

}
