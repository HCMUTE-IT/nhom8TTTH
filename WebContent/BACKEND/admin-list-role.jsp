<%@page import="chuongnh.com.model.RoleAccount"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chuongnh.com.utils.RoleUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Danh sách quyền | Quản trị viến</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
<script src="controllerJs/roleController.js"></script>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				||!"admin".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "admin-list-role");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-admin.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Quản trị viên <small>Danh sách quyền</small>
							<div class="pull-right">
								<a href="#modal-role" class="btn btn-primary"
									data-toggle="modal"><span
									class="glyphicon glyphicon-export"></span> Thêm quyền</a>
							</div>
						</h1>

						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Tên quyền</th>
										<th>Ngày cập nhật</th>
										<th>Người cập nhật</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<%
										RoleUtils roleUtils = new RoleUtils();
										ArrayList<RoleAccount> rls = roleUtils.getArray();
										//rls=roleUtils.getArray();
										for (int i = 0; i < rls.size(); i++) {
									%>
									<tr id="row-<%=rls.get(i).Id%>">
										<td><strong><%=rls.get(i).RoleName%></strong></td>
										<td><%=rls.get(i).DateCreated.toString()%></td>
										<td><strong><%=rls.get(i).CreatedBy%></strong></td>

										<td><a href="#modal-edit-role" class="btn btn-primary"
											data-toggle="modal" data-roleid="<%=rls.get(i).Id%>"
											data-name="<%=rls.get(i).RoleName%>"><span
												class="glyphicon glyphicon-edit"></span></a> | <a
											href="/14110013/deleterole?id=<%=rls.get(i).Id%>"
											class="btn btn-warning delete-role"
											data-Id="<%=rls.get(i).Id%>"><span
												class="glyphicon glyphicon-remove"></span></a></td>
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

	<form action="/14110013/insertrole" method="POST" class="" role="form"
		id="form-role">
		<div class="modal fade" id="modal-role">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Thêm quyền</h4>
					</div>
					<div class="modal-body">
						<fieldset class="form-group">
							<label for="rolename" class="control-label">Tên quyền</label> <input
								type="text" name="rolename" id="rolename" class="form-control"
								value="" required="required">
						</fieldset>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Tạo</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<form action="/14110013/editrole" method="POST" class="" role="form"
		id="form-role">
		<div class="modal fade" id="modal-edit-role">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Thêm quyền</h4>
					</div>
					<div class="modal-body">
						<fieldset class="form-group">
							<label for="rolename" class="control-label">Tên quyền</label> <input
								type="text" name="RoleName" id="rolename" class="form-control"
								value="" required="required">
						</fieldset>
						<input type="text" name="RoleId" id="roleid" class="form-control"
							value="" required="required" style="visibility: hidden">
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Sửa</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		$('#modal-edit-role').on('show.bs.modal', function(event) {
			var a = $(event.relatedTarget) // Button that triggered the modal
			var roleid = a.data('roleid') // Extract info from data-* attributes
			var name = a.data('name') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this);
			modal.find('#roleid').val(roleid);
			modal.find('#rolename').val(name);
		})
	</script>
</body>
</html>