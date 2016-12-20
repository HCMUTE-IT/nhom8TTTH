<%@page import="java.util.ArrayList"%>
<%@page import="chuongnh.com.utils.PostUtils"%>
<%@page import="chuongnh.com.model.Post"%>
<%@page import="chuongnh.com.utils.BlogUtils"%>
<%@page import="chuongnh.com.model.Blog"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Chuyên mục</title>
<jsp:include page="_styles.jsp"></jsp:include>
</head>
<body>
	<%
		session.setAttribute("active", "blog");
	%>
	<jsp:include page="_menu.jsp"></jsp:include>
	<div class="container container-content">
		<div class="col-md-9">
			<%
				Blog b = new Blog();
				String id = request.getParameter("id");
				b = (new BlogUtils()).get(id);
			%>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<strong><%=b.Title%></strong>
					</h3>
				</div>
				<div class="panel-body">
					<%
						ArrayList<Post> ps = new ArrayList<>();
						String pid = request.getParameter("id");
						ps = (new PostUtils()).getArray(pid);
					%>
					<%
						for (int i = 0; i < ps.size(); i++) {
					%>
					<div class="media">
						<div class="media-left">
							<a href="post-details.jsp?id=<%=ps.get(i).Id%>"> <img
								class="media-object" src="/14110013/upload/post/<%=ps.get(i).Image%>" style="max-height:60px" alt="">
							</a>
						</div>
						<div class="media-body">
							<h4 class="media-heading"><a href="post-details.jsp?id=<%=ps.get(i).Id%>"><%=ps.get(i).Title%></a></h4>
							<%=ps.get(i).DateCreated%>
						</div>
					</div>
					<%
						}
					%>
				</div>
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