<%@page import="chuongnh.com.utils.RoleUtils"%>
<%@page import="chuongnh.com.model.RoleAccount"%>
<%@page import="chuongnh.com.model.UserAccount"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chuongnh.com.utils.AccountUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Danh sách người dùng | Quản trị viên</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
<script src="controllerJs/accountController.js"></script>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				|| !"admin".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "admin-list-account");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-admin.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Quản trị viên <small>Danh sách người dùng</small>
							<div class="pull-right">
								<a href="admin-create-account.jsp" class="btn btn-primary"><span
									class="glyphicon glyphicon-user"></span> Thêm tài khoản</a> <a
									href="admin-send-mail.jsp" class="btn btn-primary"><span
									class="glyphicon glyphicon-send"></span> Gửi tin nhắn</a>
							</div>
						</h1>

						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Ảnh đại diện</th>
										<th>Tên tài khoản</th>
										<th>Mật khẩu</th>
										<th>Họ tên</th>
										<th>Ngày sinh</th>
										<th>Phone</th>
										<th>Giới tính</th>
										<th>Địa chí</th>
										<th>Quyền</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<%
										AccountUtils accountUtils = new AccountUtils();
										ArrayList<UserAccount> ua = accountUtils.getArray();

										ArrayList<RoleAccount> ra = new ArrayList<>();
										ra = (new RoleUtils()).getArray();

										for (int i = 0; i < ua.size(); i++) {
									%>
									<tr id="row-<%=ua.get(i).UserName%>">
										<td><img src="/14110013/upload/user/<%=ua.get(i).Image%>" style="max-height:50px;"></td>
										<td><strong><%=ua.get(i).UserName%></strong></td>
										<td><%=ua.get(i).Password%></td>
										<td><strong><%=ua.get(i).Fullname%></strong></td>
										<td><%=ua.get(i).Birthday%></td>
										<td><%=ua.get(i).PhoneNumber%></td>
										<td><%=ua.get(i).Gender%></td>
										<td><%=ua.get(i).Address%></td>
										<td><div class="form-group">
												<select name="RoleId" class="form-control input-sm">
													<%
														for (int j = 0; j < ra.size(); j++) {
																if (ra.get(j).Id.indexOf(ua.get(i).RoleId) > -1) {
													%>
													<option value="<%=ra.get(j).Id%>" selected><%=ra.get(j).RoleName%></option>
													<%
														} else {
													%>
													<option value="<%=ra.get(j).Id%>"><%=ra.get(j).RoleName%></option>
													<%
														}
															}
													%>
												</select>
											</div></td>

										<td><a
											href="admin-edit-account.jsp?id=<%=ua.get(i).UserName%>"
											class="btn btn-primary"><span
												class="glyphicon glyphicon-edit"></span></a> | <a
											href="/14110013/deleteaccount?UserName=<%=ua.get(i).UserName%>"
											class="btn btn-warning delete-account"
											data-UserName="<%=ua.get(i).UserName%>"><span
												class="glyphicon glyphicon-remove"></span></a> | <a
											href="admin-send-mail.jsp?email=<%=ua.get(i).Email%>"
											class="btn btn-warning"><span
												class="glyphicon glyphicon-send"></span></a></td>
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
</body>
</html>