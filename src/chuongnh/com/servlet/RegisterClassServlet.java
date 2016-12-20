package chuongnh.com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import chuongnh.com.model.Register;
import chuongnh.com.utils.RegisterUtils;

/**
 * Servlet implementation class RegisterClassServlet
 */
@WebServlet(description = "Chau Minh Hoa", urlPatterns = { "/RegisterClassServlet" })
public class RegisterClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");*/
		
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
		Register register = new Register();
		register.Fullname = request.getParameter("Fullname");
		register.Email = request.getParameter("Email");
		register.Phone = request.getParameter("Phone");
		register.Note = request.getParameter("Note");
		register.ClassId = request.getParameter("ClassId");
		//register.DateReg = request.getParameter("DateReg");
		try {
			(new RegisterUtils()).insert(register);
			json.put("status", true);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			json.put("status", false);
		}
		//response.sendRedirect("register.jsp");

		response.getWriter().write(json.toString());
	}

}
