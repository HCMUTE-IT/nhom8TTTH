<%@page import="chuongnh.com.utils.CourseUtils"%>
<%@page import="chuongnh.com.model.Course"%>
<%@page import="chuongnh.com.model.Poster"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chuongnh.com.utils.PosterUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Tạo poster | Quản lý nội dung</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				||!"content".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "content-create-poster");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-content.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Quản lý nội dung <small>Tạo poster</small>
						</h1>
						<form action="/14110013/createposter" method="post" role="form" enctype=multipart/form-data>


							<div class="form-group">
								<label>Tiêu đề poster</label> <input name="Title"
									class="form-control" placeholder="Tiêu đề bài viêt">
							</div> 
							<div class="form-group">
								<label>Hình ảnh</label> <input name="Image" type="file" accept="image/*"
									class="form-control" placeholder="">
							</div>
							<div class="form-group">
								<label>Mô tả</label>
								<textarea id="poster-description" name="Content" class="form-control"
									rows="3"></textarea> 
							</div>
							<% 
								ArrayList<Course> courses = new ArrayList<>();
								courses = (new CourseUtils()).getArray();
					     	%>
							<div class="form-group">
								<label>Khóa học</label>
								<select name="CourseId" class="form-control input-sm">
													<%
														for (int j = 0; j < courses.size(); j++) {
																
													%>
													<option value="<%=courses.get(j).Id%>"><%=courses.get(j).CourseName%></option>
													<% 													
													}
													%>
												</select>
							</div>
							<br>
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