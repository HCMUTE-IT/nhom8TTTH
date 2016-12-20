<%@page import="chuongnh.com.utils.CourseUtils"%>
<%@page import="chuongnh.com.model.Course"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Menu</title>
</head>
<body>
	<%
		String active = session.getAttribute("active").toString();
	%>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp"><span
				class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<%
					/* HOA CODE */
					ArrayList<Course> courses = new ArrayList<>();
					CourseUtils courseUtils = new CourseUtils();
					courses = courseUtils.getArray();
				%>
				<%
					if (active == "index") {
				%>
				<li class="active"><a href="index.jsp">Trang chủ</a></li>
				<%
					} else {
				%>
				<li class=""><a href="index.jsp">Trang chủ</a></li>
				<%
					}
				%>

			<%-- 	<%
					if (active == "open") {
				%>
				<li class="active"><a href="open.jsp">Lịch khai giảng</a></li>
				<%
					} else {
				%>
				<li><a href="open.jsp">Lịch khai giảng</a></li>
				<%
					}
				%> --%>
				<%
					if (active == "course") {
				%>

				<li class="dropdown active"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Khóa học <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<%
							for (int i = 0; i < courses.size(); i++) {
						%>
						<li><a href="course.jsp?Id=<%=courses.get(i).Id%>"><%=courses.get(i).CourseName%></a></li>	
						<%
							}
						%>
					</ul></li>
				<%
					} else {
				%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Khóa học <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<%
							for (int i = 0; i < courses.size(); i++) {
						%>
						<li><a href="course.jsp?Id=<%=courses.get(i).Id%>"><%=courses.get(i).CourseName%></a></li>
						<%
							}
						%>
					</ul></li>
				<%
					}
				%>
				<%
					if (active == "about") {
				%>
				<li class="active"><a href="about.jsp">Giới thiệu</a></li>
				<%
					} else {
				%>
				<li><a href="about.jsp">Giới thiệu</a></li>
				<%
					}
				%>


				<%
					if (active == "contact") {
				%>
				<li class="active"><a href="contact.jsp">Liên hệ</a></li>
				<%
					} else {
				%>
				<li><a href="contact.jsp">Liên hệ</a></li>
				<%
					}
				%>

			</ul>

			<%-- <ul class="nav navbar-nav navbar-right">

				<%
					if (session.getAttribute("UserName") != null) {
				%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" style=""><span
						class="glyphicon glyphicon-user"></span>Hello, Nguyen Hoang Chuong
						<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Sửa Nguyen Hoang Chuong</a></li>
						<li><a href="#">Something else here</a></li>
						<li><a href="logout" id="logout">Đăng xuất</a></li>
					</ul></li>
				<%
					} else {
				%>
				<li><a href="#modal-login" data-toggle="modal"><span
						class="glyphicon glyphicon-export"></span> Đăng nhập</a></li>
				<%
					}
				%>
			</ul> --%>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>
</body>
</html>