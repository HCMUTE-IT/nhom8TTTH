<%@page import="chuongnh.com.model.Class"%>
<%@page import="chuongnh.com.utils.ClassUtils"%>
<%@page import="chuongnh.com.utils.CourseUtils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chuongnh.com.model.Course"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>ĐĂNG KÝ | TRUNG TÂM TIN HỌC</title>
<jsp:include page="_styles.jsp"></jsp:include>
</head>
<body>
	<!--NAVBAR MENU-->
	<%
		session.setAttribute("active", "register");
	%>
	<jsp:include page="_menu.jsp"></jsp:include>

	<!--CONTENT-->
	<div class="container container-content">
		<div class="row">
			<div class="col-md-12">
				<legend>ĐIỀN THÔNG TIN ĐĂNG KÝ</legend>
				<li>Bạn vui lòng điền đầy đủ & chính xác thông tin của bạn vào
					phiếu đăng ký online. Chúng tôi sẽ xác nhận ngay lập tức kể từ thời
					điểm hoàn tất đăng ký.</li>
				<li>Cần tư vấn, vui lòng liên hệ Hotline: 0977.565.104 - Email:
					hanoi@t3h.edu.vn</li>
				<form action="/14110013/registerclass" method="POST"
					class="form-horizontal m-t-10" role="form" id="form-register">
					<div class="row">
						<div class="col-md-6">
							<fieldset class="form-group">
								<div class="col-md-12">
									<input type="text" class="form-control" id="Fullname"
										name="Fullname" placeholder="Nhập họ và tên "
										required="required">
								</div>
							</fieldset>

							<fieldset class="form-group">
								<div class="col-md-12">
									<input type="text" class="form-control" name="Email" id="Email"
										placeholder="Nhập địa chỉ email" required="required">
								</div>
							</fieldset>

							<fieldset class="form-group">
								<div class="col-md-12">
									<input type="text" class="form-control" name="Phone" id="Phone"
										placeholder="Nhập số điện thoại" required="required">
								</div>
							</fieldset>
						</div>
						<%
							String CourseId = request.getParameter("CourseId");
							ArrayList<Class> classes = new ArrayList<>();
							classes = (new ClassUtils()).getClassFromCourseID(CourseId);
						%>
						<div class="col-md-6">
							<fieldset class="form-group">
								<div class="col-md-12">
									<select name="ClassId" class="form-control">
										<%
											for (int j = 0; j < classes.size(); j++) {
										%>
										<option value="<%=classes.get(j).Id%>"><%=classes.get(j).ClassName%></option>
										<%
											}
										%>
									</select>
								</div>
							</fieldset>

							<fieldset class="form-group">
								<div class="col-md-12">
									<textarea type="text" class="form-control" rows="4" name="Note"
										id="Note" placeholder="Nhập ghi chú" required="required"></textarea>
								</div>
							</fieldset>
						</div>
					</div>
					<fieldset class="form-group">
						<div class="col-sm-12">
							<button type="submit" class="btn btn-primary">Gửi đăng
								ký</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<!--FOOTER-->
	<jsp:include page="_footer.jsp"></jsp:include>
	<%-- <jsp:include page="_footer.jsp"></jsp:include> --%>
	<%-- <jsp:include page="_register.jsp"></jsp:include>
	<jsp:include page="_login.jsp"></jsp:include>--%>
	<jsp:include page="_scripts.jsp"></jsp:include> 
	<script src="content/js/registerController.js"></script>
</body>
</html>