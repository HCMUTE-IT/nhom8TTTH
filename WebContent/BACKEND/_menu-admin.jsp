<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Menu</title>
</head>
<body>
	<nav class="navbar-inverse" role="navigation"> <!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand visible-xs" href="#">14110013</a>
	</div>
	<%
		String active = session.getAttribute("active").toString();
	%> <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<%
				if (active == "dashboard") {
			%>
			<li class="active"><a href="admin-dashboard.jsp"><i
					class="fa fa-fw fa-dashboard"></i> Bảng điều khiển</a></li>
			<%
				} else {
			%>
			<li><a href="admin-dashboard.jsp"><i
					class="fa fa-fw fa-dashboard"></i> Bảng điều khiển</a></li>
			<%
				}
			%>

			<%
				if (active == "admin-list-role") {
			%>
			<li class="active"><a href="admin-list-role.jsp">Danh sách
					quyền</a></li>
			<%
				} else {
			%>
			<li><a href="admin-list-role.jsp">Danh sách quyền</a></li>
			<%
				}
			%>

			<%
				if (active == "admin-list-account") {
			%>
			<li class="active"><a href="admin-list-account.jsp">Quản lý
					người dùng</a></li>
			<%
				} else {
			%>
			<li><a href="admin-list-account.jsp">Quản lý người dùng</a></li>
			<%
				}
			%>

			<%
				if (active == "admin-create-account") {
			%>
			<li class="active"><a href="admin-create-account.jsp">Tạo
					người dùng mới</a></li>
			<%
				} else {
			%>
			<li><a href="admin-create-account.jsp">Tạo người dùng mới</a></li>
			<%
				}
			%>

			<%
				if (active == "admin-send-mail") {
			%>
			<li class="active"><a href="admin-send-mail.jsp"><i
					class="fa fa-fw fa-inbox"></i> Gửi thư điện tử</a></li>
			<%
				} else {
			%>
			<li><a href="admin-send-mail.jsp"><i
					class="fa fa-fw fa-inbox"></i> Gửi thư điện tử</a></li>
			<%
				}
			%>
			<li><a href="/14110013/logoutbackend"><i
					class="fa fa-fw fa-home"></i> Đăng xuất <i
					class="fa fa-long-arrow-left pull-right" aria-hidden="true"></i></a></li>
					
			<li><a href="/14110013/index.jsp" target="_blank"><i
					class="fa fa-fw fa-home"></i> Đi tới trang chủ <i
					class="fa fa-long-arrow-right pull-right" aria-hidden="true"></i></a></li>
		</ul>
	</div>
	</nav>
</body>
</html>