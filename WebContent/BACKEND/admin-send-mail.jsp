<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Gửi mail | Quản trị viên</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				|| !"admin".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "admin-send-mail");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-admin.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Quản trị viên <small>Gửi mail</small>
						</h1>
						<form action="/14110013/sendmail" method="POST" role="form"
							id="form-mail">

							<div class="form-group">
								<label>Gửi đến</label> <input name="recipient" id="recipient"
									type="email" class="form-control"
									placeholder="Địa chỉ mail người nhận">
							</div>

							<div class="form-group">
								<label>Tiêu đề</label> <input name="subject"
									class="form-control" placeholder="Tiêu đề">
							</div>

							<div class="form-group">
								<label>Nội dung</label>
								<textarea id="email-content" name="content" class="form-control"
									rows="3"></textarea>
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
		// copy
		var getUrlParameter = function getUrlParameter(sParam) {
			var sPageURL = decodeURIComponent(window.location.search
					.substring(1)), sURLVariables = sPageURL.split('&'), sParameterName, i;

			for (i = 0; i < sURLVariables.length; i++) {
				sParameterName = sURLVariables[i].split('=');

				if (sParameterName[0] === sParam) {
					return sParameterName[1] === undefined ? true
							: sParameterName[1];
				}
			}
		};
		$(document).ready(function() {
			var param = getUrlParameter("email");
			$('#recipient').val(param);
			$('#email-content').summernote({
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