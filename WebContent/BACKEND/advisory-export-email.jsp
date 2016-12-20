<%@page import="chuongnh.com.utils.RegisterUtils"%>
<%@page import="chuongnh.com.model.Register"%>
<%@page import="chuongnh.com.utils.ClassUtils"%>
<%@page import="chuongnh.com.model.Class"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Xuất danh sách học viên | Tư vấn viên</title>

<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
<link
	href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.dataTables.min.css"
	rel="stylesheet" type="text/css">
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				|| !"advisory".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "advisory-export-email");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-advisory.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Tư vấn viên <small>Xuất danh sách email</small>
							<%
								ArrayList<Class> cls = new ArrayList<>();
								cls = (new ClassUtils()).getArray();
							%>
							<div class="pull-right">
								<small>
									<form action="/14110013/exportemail" method="POST" role="form"
										id="select-email-export">
										<select name="RoleId" class="form-control">
											<%
												for (int i = 0; i < cls.size(); i++) {
											%>
											<option value="<%=cls.get(i).Id%>"><%=cls.get(i).ClassName%></option>
											<%
												}
											%>
										</select>

									</form>
								</small>
							</div>
						</h1>

						<div class="table-responsive">
							<table id="email-export" cellspacing="0" width="100%"
								class="table table-bordered table-hover display">
								<thead>
									<tr>
										<th>Tên</th>
										<th>Email</th>
										<th>Điện thoại</th>
									</tr>
								</thead>
								<tbody>
									<%
										ArrayList<Register> ra = new ArrayList<>();
										ra = (new RegisterUtils()).getArray();

										for (int i = 0; i < ra.size(); i++) {
									%>
									<tr id="row-<%=ra.get(i).Id%>">
										<td><strong><%=ra.get(i).Fullname%></strong></td>
										<td><strong><%=ra.get(i).Email%></strong></td>
										<td><strong><%=ra.get(i).Phone%></strong></td>
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
	<script
		src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.2.4/js/dataTables.buttons.min.js"></script>
	<script
		src="//cdn.datatables.net/buttons/1.2.4/js/buttons.flash.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
	<script
		src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
	<script
		src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
	<script
		src="//cdn.datatables.net/buttons/1.2.4/js/buttons.html5.min.js"></script>
	<script
		src="//cdn.datatables.net/buttons/1.2.4/js/buttons.print.min.js"></script>

	<script>
		$(document).ready(function() {
			$('#email-export').DataTable({
				dom : 'Bfrtip',
				buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]
			});
		});
	</script>
</body>
</html>