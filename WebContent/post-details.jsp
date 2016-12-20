<%@page import="chuongnh.com.utils.PostUtils"%>
<%@page import="chuongnh.com.model.Post"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Bài viết</title>
<jsp:include page="_styles.jsp"></jsp:include>
</head>
<body>
	<%
		session.setAttribute("active", "post");
	%>
	<jsp:include page="_menu.jsp"></jsp:include>
	<div class="container container-content">
		<div class="col-md-9">
			<%
				Post b = new Post();
				String id=request.getParameter("id");
				b=(new PostUtils()).get(id);
			%>
			<h2><%=b.Title %></h2>
			<hr>
			<div>
				<%=b.Content %>
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
	<jsp:include page="_zotachat.jsp"></jsp:include>
</body>
</html>