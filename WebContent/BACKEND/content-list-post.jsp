<%@page import="chuongnh.com.utils.BlogUtils"%>
<%@page import="chuongnh.com.model.Blog"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chuongnh.com.utils.PostUtils"%>
<%@page import="chuongnh.com.model.Post"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Danh sách bài đăng | Quản lý nội dung</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				|| !"content".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "content-list-post");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-content.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Quản lý nội dung <small>Danh sách bài đăng</small>
							<div class="pull-right">
								<a href="content-create-post.jsp" class="btn btn-primary">Thêm
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
										<th>Chuyên mục</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<%
										ArrayList<Post> ps = new ArrayList<>();
										PostUtils uls = new PostUtils();
										ps = uls.getArray();

										ArrayList<Blog> bs = new ArrayList<>();
										BlogUtils buls = new BlogUtils();
										bs = buls.getArray();

										for (int i = 0; i < ps.size(); i++) {
									%>
									<tr id="row-<%=ps.get(i).Id%>">
										<td><img src="/14110013/upload/post/<%=ps.get(i).Image%>" style="max-height:50px"></td>
										<td><strong><%=ps.get(i).Title%></strong></td>
										<td><%=ps.get(i).DateCreated%></td>
										<td><strong><%=ps.get(i).CreatedBy%></strong></td>
										<td><div class="form-group">
												<select name="BlogId" id="BlogId"
													class="form-control input-sm">
													<%
														for (int j = 0; j < bs.size(); j++) {
																if (bs.get(j).Id.indexOf(ps.get(i).BlogId) > -1) {
													%>
													<option value="<%=bs.get(j).Id%>" selected><%=bs.get(j).Title%></option>
													<%
														} else {
													%>
													<option value="<%=bs.get(j).Id%>"><%=bs.get(j).Title%></option>
													<%
														}
															}
													%>
												</select>
											</div></td>
										<td><a href="content-edit-post.jsp?id=<%=ps.get(i).Id%>"
											class="btn btn-primary"><span
												class="glyphicon glyphicon-edit"></span></a> | <a
											href="/14110013/deletepost?id=<%=ps.get(i).Id%>"
											class="btn btn-warning delete-post"
											data-id="<%=ps.get(i).Id%>"><span
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

	<script src="controllerJs/postController.js"></script>
</body>
</html>