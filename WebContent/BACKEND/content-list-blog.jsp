<%@page import="java.util.ArrayList"%>
<%@page import="chuongnh.com.model.Blog"%>
<%@page import="chuongnh.com.utils.BlogUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Danh sách chuyên mục | Quản lý nội dung</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				|| !"content".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "content-list-blog");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-content.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Quản lý nội dung <small>Danh sách chuyên mục</small>
							<div class="pull-right">
								<a href="content-create-blog.jsp" class="btn btn-primary">Thêm
									mới</a>
							</div>
						</h1>

						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Hình ảnh</th>
										<th>Tiêu đề</th>
										<th>Ngày cập nhật</th>
										<th>Người cập nhật</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<%
										ArrayList<Blog> bs = new ArrayList();
										BlogUtils uls = new BlogUtils();
										bs = uls.getArray();
										for (int i = 0; i < bs.size(); i++) {
									%>
									<tr id="row-<%=bs.get(i).Id%>">
										<td><img src="/14110013/upload/blog/<%=bs.get(i).Image%>" style="max-height: 50px;"></td>
										<td><strong><%=bs.get(i).Title%></strong></td>
										<td><%=bs.get(i).DateCreated%></td>
										<td><strong><%=bs.get(i).CreatedBy%></strong></td>

										<td><a href="content-edit-blog.jsp?id=<%=bs.get(i).Id%>"
											class="btn btn-primary"><span
												class="glyphicon glyphicon-edit"></span></a> | <a
											href="/14110013/deleteblog?id=<%=bs.get(i).Id%>"
											class="btn btn-warning delete-blog"
											data-id="<%=bs.get(i).Id%>"><span
												class="glyphicon glyphicon-remove"></span></a></td>
									</tr>

									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<script src="controllerJs/blogController.js"></script>
</body>
</html>