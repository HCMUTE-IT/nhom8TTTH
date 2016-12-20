<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Liên hệ</title>
<jsp:include page="_styles.jsp"></jsp:include>
</head>
<body>
	<%
		session.setAttribute("active", "contact");
	%>
	<jsp:include page="_menu.jsp"></jsp:include>
	<div class="container container-content">
		<div class="col-md-12">
			<h2>Biểu mẫu liên hệ</h2>
			<hr>
			<form action="/14110013/contact" method="POST" role="form"
				id="form-contact">

				<div class="form-group">
					<label>Địa chỉ mail của bạn</label> <input name="from" type="email"
						class="form-control" placeholder="Địa chỉ mail của bạn">
				</div>

				<div class="form-group">
					<label>Tiêu đề</label> <input name="subject" class="form-control"
						placeholder="Tiêu đề">
				</div>

				<div class="form-group">
					<label>Nội dung</label>
					<textarea id="email-content" name="content" class="form-control"
						rows="7"></textarea>
				</div>

				<button type="submit" class="btn btn-primary">Gửi đi</button>

			</form>
		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
	<jsp:include page="_register.jsp"></jsp:include>
	<jsp:include page="_login.jsp"></jsp:include>
	<jsp:include page="_scripts.jsp"></jsp:include>
	<jsp:include page="_zotachat.jsp"></jsp:include>
	<script src="content/js/contactController.js"></script>
</body>
</html>