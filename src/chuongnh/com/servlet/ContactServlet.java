package chuongnh.com.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import chuongnh.com.utils.MailUtils;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet(description = "Nguyen Hoang Chuong", urlPatterns = { "/ContactServlet" })
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactServlet() {
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
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
		response.setCharacterEncoding("utf-8");
		
		String recipient = request.getParameter("from");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		String resultMessage = "";

		try {
			MailUtils.sendEmail(host, port, user, pass, "tttinhoc2017@gmail.com", subject, "Yêu cầu từ: "+recipient+"<br/>"+content);
			resultMessage = "The e-mail was sent successfully";
			json.put("status", true);
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex.getMessage();
			
			json.put("status", false);
		} finally {
			request.setAttribute("Message", resultMessage);
			
			json.put("recipient", recipient);
			json.put("result", resultMessage);
			response.getWriter().write(json.toString());
			
			//getServletContext().getRequestDispatcher("/BACKEND/ResultMail.jsp").forward(request, response);
		}
	}

}
