package chuongnh.com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import chuongnh.com.model.UserAccount;
import chuongnh.com.utils.AccountUtils;
import chuongnh.com.utils.Convertutf8;

/**
 * Servlet implementation class EditAccountServlet
 */
@WebServlet(description = "Nguyen Hoang Chuong", urlPatterns = { "/EditAccountServlet" })
public class EditAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// location to store file uploaded
	private static final String UPLOAD_DIRECTORY = "upload" + File.separator + "user";
	// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditAccountServlet() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		UserAccount a = new UserAccount();
		// checks if the request actually contains upload file
		if (!ServletFileUpload.isMultipartContent(request)) {
			// if not, we stop here
			PrintWriter writer = response.getWriter();
			writer.println("Error: Form must has enctype=multipart/form-data.");
			writer.flush();
			return;
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();
		// sets memory threshold - beyond which files are stored in disk
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// sets temporary location to store files
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// sets maximum size of upload file
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// sets maximum size of request (include file + form data)
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// constructs the directory path to store upload file
		// this path is relative to application's directory
		String uploadPath = getServletContext().getRealPath("") + UPLOAD_DIRECTORY;

		// creates the directory if it does not exist
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		try {
			// parses the request's content to extract file data
			@SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {
				// iterates over form's fields
				for (FileItem item : formItems) {
					// processes only fields that are not form fields
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						String filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);

						// saves the file on disk
						item.write(storeFile);
						a.Image = fileName;// request.getParameter("Image");
						request.setAttribute("message", "Upload has been done successfully!");
					} else {

						a.UserName = formItems.get(0).getString();
						a.Password = formItems.get(1).getString();
						a.Fullname = Convertutf8.convertFromUTF8(formItems.get(2).getString());
						a.Email = formItems.get(3).getString();
						a.Address = Convertutf8.convertFromUTF8(formItems.get(4).getString());
						a.Birthday = formItems.get(5).getString();
						a.PhoneNumber = formItems.get(7).getString();
						a.Gender = Convertutf8.convertFromUTF8(formItems.get(8).getString());
						a.RoleId = formItems.get(9).getString();

					}
				}
			}
		} catch (Exception ex) {
			request.setAttribute("message", "There was an error: " + ex.getMessage());
		}

		try {
			/*
			 * HttpSession session = request.getSession(true); a.CreatedBy =
			 * (String) session.getAttribute("UserNameLoginBackend");
			 */

			(new AccountUtils()).update(a);
			response.sendRedirect("BACKEND/admin-list-account.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*UserAccount a = new UserAccount();
		try {
			a.UserName = request.getParameter("UserName");
			a.Password = request.getParameter("Password");
			a.Fullname = request.getParameter("Fullname");
			a.Gender = request.getParameter("Gender");
			a.Birthday = request.getParameter("Birthday");
			a.Email = request.getParameter("Email");
			a.PhoneNumber = request.getParameter("PhoneNumber");
			a.Address = request.getParameter("Address");
			a.Image = request.getParameter("Image");
			a.RoleId = request.getParameter("RoleId");
			(new AccountUtils()).update(a);
			response.sendRedirect("BACKEND/admin-list-account.jsp");
		} catch (Exception e) {

		}*/
	}

}
