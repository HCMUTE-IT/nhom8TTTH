<%@page import="chuongnh.com.utils.BlogUtils"%>
<%@page import="chuongnh.com.model.Blog"%>
<%@page import="chuongnh.com.utils.PostUtils"%>
<%@page import="chuongnh.com.model.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Left menu</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<strong>Tìm kiếm</strong>
			</h3>
		</div>
		<div class="panel-body">
			<form action="" method="POST" class="form-horizontal" role="form">
				<input type="text" name="search" id="search" class="form-control"
					value="" required="required" pattern="" title=""
					placeholder="Nhập từ khóa....">
			</form>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<strong>Chuyên mục</strong>
			</h3>
		</div>
		<div class="panel-body">
			<%
				ArrayList<Blog> bs = new ArrayList<>();
				bs = (new BlogUtils()).getArray();
				for (int i = 0; i < bs.size(); i++) {
			%><div>
				<a href="blog-details.jsp?id=<%=bs.get(i).Id%>"><%=bs.get(i).Title%></a>
				<span class="badge pull-right">new</span>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<strong>Thông báo</strong>
			</h3>
		</div>
		<div class="panel-body">
			<%
				ArrayList<Post> ps = new ArrayList<>();
				ps = (new PostUtils()).getArray();
				for (int i = 0; i < ps.size(); i++) {
			%><div>
				<a href="post-details.jsp?id=<%=ps.get(i).Id%>"><%=ps.get(i).Title%></a>
				<span class="badge pull-right">new</span>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>