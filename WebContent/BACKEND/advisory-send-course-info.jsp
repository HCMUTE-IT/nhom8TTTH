<%@page import="chuongnh.com.utils.RegisterUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Gửi thông tin khóa học | Tư vấn viên</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				||!"advisory".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "advisory-send-course-info");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-advisory.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Tư vấn viên <small>Gửi thông tin khóa học</small>
						</h1>
						<form action="/14110013/sendmail" method="POST" role="form" id="form-mail">
							<div class="form-group">
								<label>Gửi đến</label> <input name="recipient" id="recipient" class="form-control"
									placeholder="Địa chỉ mail người nhận" value="<%=(new RegisterUtils()).getListEmail()%>">
							</div>

							<div class="form-group">
								<label>Tiêu đề</label> <input name="subject" class="form-control"
									placeholder="Tiêu đề">
							</div>

							<div class="form-group">
								<label>Thông tin khóa học</label>
								<textarea id="email-content" name="content"
									class="form-control" rows="3"></textarea>
							</div>

							<button type="submit" class="btn btn-primary">Gửi đi</button>
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
			$('#email-content').summernote({
				height : 200, // set editor height
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : true
			// set focus to editable area after initializing summernote
			});
		});
	</script>
	<script src="controllerJs/mailController.js"></script>
</body>
</html>