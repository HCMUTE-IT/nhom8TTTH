<%@page import="chuongnh.com.utils.CourseUtils"%>
<%@page import="chuongnh.com.model.Course"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Khóa học</title>
<jsp:include page="_styles.jsp"></jsp:include>
</head>
<body>
	<%
		session.setAttribute("active", "course");
		String Id = request.getParameter("Id");
		Course course = new Course();
		course = (new CourseUtils()).get(Id);
	%>
	<jsp:include page="_menu.jsp"></jsp:include>
	<div class="container container-content">
		<div class="col-md-9">
			<h1>
				<strong><%=course.CourseName%></strong>
			</h1>

			<hr>

			<div class="panel panel-primary">
				<%=course.Description%>
			</div>

			<div>
				<p>
					<a href="register.jsp?CourseId=<%=course.Id%>"
						class="btn btn-info btn-block" target="_blank"> ĐĂNG KÝ KHÓA
						HỌC </a>
				</p>
			</div>
		</div>

		<div class="col-md-3">
			<jsp:include page="_left-menu.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
	<jsp:include page="_register.jsp"></jsp:include>
	<jsp:include page="_login.jsp"></jsp:include>
	<jsp:include page="_scripts.jsp"></jsp:include>
</body>
</html>