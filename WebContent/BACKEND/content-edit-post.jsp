<%@page import="chuongnh.com.utils.PostUtils"%>
<%@page import="chuongnh.com.model.Post"%>
<%@page import="chuongnh.com.model.Blog"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chuongnh.com.utils.BlogUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Tạo bài viết | Quản lý nội dung</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				||!"content".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "content-create-post");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-content.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Quản lý nội dung <small>Tạo bài viết</small>
						</h1>
						<form action="/14110013/editpost" method="post" role="form" enctype="multipart/form-data">

							<%
								ArrayList<Blog> bs = new ArrayList();
								BlogUtils buls = new BlogUtils();
								bs = buls.getArray();

								Post p = new Post();
								PostUtils uls = new PostUtils();
								String Id = request.getParameter("id");
								p = uls.get(Id);
							%>
							<div class="form-group">
								<label>Mã</label> <input name="Id" class="form-control"
									placeholder="Tiêu đề bài viêt" value="<%=p.Id%>" read-only>
							</div>

							<div class="form-group">
								<label>Tiêu đề bài viêt</label> <input name="Title"
									class="form-control" placeholder="Tiêu đề bài viêt"
									value="<%=p.Title%>">
							</div>
							<div class="form-group">

								<label>Chuyên mục</label> <select name="BlogId" id="BlogId"
									class="form-control input-sm">
									<%
										for (int j = 0; j < bs.size(); j++) {
											if (bs.get(j).Id.indexOf(p.BlogId) > -1) {
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
							</div>
							<div class="form-group">
								<label>Hình ảnh</label> <input name="Image" type="file"
									class="form-control" placeholder="" value="<%=p.Image%>">
							</div>

							<div class="form-group">
								<label>Nội dung</label>
								<textarea id="post-content" name="Content" class="form-control"
									rows="3"><%=p.Content%></textarea>
							</div>

							<button type="submit" class="btn btn-primary">Tạo mới</button>
							<button type="reset" class="btn btn-default">Hủy</button>

						</form>
					</div>

				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<script>
		$(document).ready(function() {
			$('#post-content').summernote({
				height : 200, // set editor height
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : true
			// set focus to editable area after initializing summernote
			});
		});
	</script>
</body>
</html>