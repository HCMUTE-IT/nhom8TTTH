<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Đăng nhập</title>
</head>
<body>
	<form action="login" method="POST" class="" role="form" id="form-login">
		<div class="modal fade" id="modal-login">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Đăng ký thành viên</h4>
					</div>
					<div class="modal-body">
						<fieldset class="form-group">
							<label for="username" class="control-label">Tên tài khoản</label>
							<input type="text" name="username"
								id="username" class="form-control" value=""
								required="required">
						</fieldset>
						<fieldset class="form-group">
							<label for="password" class="control-label">Mật
								khẩu</label> <input type="password" name="password"
								id="password" class="form-control" value=""
								required="required">
						</fieldset>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Đăng nhập</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>