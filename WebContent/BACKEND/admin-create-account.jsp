<%@page import="chuongnh.com.utils.RoleUtils"%>
<%@page import="chuongnh.com.model.RoleAccount"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Tạo người dung | Quản trị viên</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				|| !"admin".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "admin-create-account");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-admin.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Quản trị viên <small>Tạo người dùng</small>
						</h1>
						<form action="/14110013/createaccount" method="post" role="form"
							enctype="multipart/form-data">
							<div class="row">
								<div class="col-md-6">

									<div class="form-group">
										<label>Tên tài khoản</label> <input type="text"
											name="UserName" class="form-control"
											placeholder="Tên tài khoản">
									</div>

									<div class="form-group">
										<label>Mật khẩu</label> <input type="password" name="Password"
											class="form-control" placeholder="Mật khẩu">
									</div>
									<div class="form-group">
										<label>Họ tên</label> <input type="text" name="Fullname"
											class="form-control" placeholder="Họ tên">
									</div>
									<div class="form-group">
										<label>Địa chỉ mail</label> <input name="Email" type="email"
											class="form-control" placeholder="Địa chỉ mail">
									</div>
									<div class="form-group">
										<label>Địa chỉ</label> <input name="Address" type="text"
											class="form-control" placeholder="Địa chỉ">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Ngày sinh</label> <input name="Birthday" type="date"
											class="form-control" placeholder="Ngày sinh">
									</div>

									<div class="form-group">
										<label>Ảnh đại diện</label> <input name="Image" type="file"
											class="form-control" placeholder="Ảnh đại diện">
									</div>

									<div class="form-group">
										<label>Điện thoại</label> <input name="PhoneNumber"
											type="text" class="form-control" placeholder="Điện thoại">
									</div>

									<div class="form-group">
										<label>Giới tính</label> <select name="Gender"
											class="form-control">
											<option value="Nam">Nam</option>
											<option value="Nữ">Nữ</option>
											<option value="Khác">Khác</option>
										</select>
									</div>
									<%
										ArrayList<RoleAccount> ra = new ArrayList<>();
										ra = (new RoleUtils()).getArray();
									%>
									<div class="form-group">
										<label>Quyền</label> <select name="RoleId"
											class="form-control">
											<%
												for (int j = 0; j < ra.size(); j++) {
											%>
											<option value="<%=ra.get(j).Id%>" selected><%=ra.get(j).RoleName%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
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
</body>
</html>