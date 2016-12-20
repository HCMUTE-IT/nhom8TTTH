<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Tạo khóa học | Tư vấn viên</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				||!"advisory".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "advisory-create-course");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-advisory.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Tư vấn viên <small>Tạo khóa học</small>
						</h1>
						<form action="/14110013/createcourse" method="post" role="form" enctype="multipart/form-data">
							<div class="form-group">
								<label>Tên khóa học</label> <input name="CourseName"
									class="form-control" placeholder="Tên khóa học">
							</div>
							<div class="form-group">
								<label>Hình ảnh</label> <input name="Image" type="file"
									class="form-control" placeholder="Hình ảnh">
							</div>

							<div class="form-group">
								<label>Chi tiết khóa học</label>
								<textarea id="course-content" name="Description"
									class="form-control" rows="3"></textarea>
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
			$('#course-content').summernote({
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