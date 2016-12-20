<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Đăng nhập hệ thống</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<!-- Navigation -->
		<div class="row" style="padding-top: 10%">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Đăng nhập hệ thống</h3>
					</div>
					<div class="panel-body">
						<form action="/14110013/loginbackend" method="POST"
							class="form-horizontal" role="form">
							<fieldset class="form-group">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-4">
											<div class="radio">
												<label> <input type="radio" name="role" id="admin"
													value="admin" checked="checked"> Quản trị viên
												</label>
											</div>
										</div>
										<div class="col-md-4">
											<div class="radio">
												<label> <input type="radio" name="role"
													id="content" value="content"> Quản trị nội dung
												</label>
											</div>
										</div>
										<div class="col-md-4">
											<div class="radio">
												<label> <input type="radio" name="role"
													id="advisory" value="advisory"> Tư vấn viên
												</label>
											</div>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label for="username" class="col-md-12">Tên tài khoản</label>
								<div class="col-md-12">
									<input type="text" name="username" id="username"
										class="form-control" value="" required="required">
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label for="password" class="col-md-12">Mật khẩu</label>
								<div class="col-md-12">
									<input type="password" name="password" id="password"
										class="form-control" value="" required="required">
								</div>
							</fieldset>
							<fieldset class="form-group">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-primary">Đăng
										nhập</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /#wrapper -->
</body>
</html>