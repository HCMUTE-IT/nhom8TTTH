<%@page import="chuongnh.com.utils.CourseUtils"%>
<%@page import="chuongnh.com.model.Course"%>
<%@page import="chuongnh.com.model.Class"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chuongnh.com.utils.ClassUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Danh sách lớp học | Tư vấn viên</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				|| !"advisory".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "advisory-list-class");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-advisory.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Tư vấn viên <small>Danh sách lớp học</small>
							<div class="pull-right">
								<a href="advisory-create-class.jsp" class="btn btn-primary">Thêm
									mới</a>
							</div>
						</h1>
						<!--HOA CODE-->
						<%
							ClassUtils classUtils = new ClassUtils();
							ArrayList<Class> classes = new ArrayList<>();
							classes = classUtils.getArray();

							ArrayList<Course> courses = new ArrayList<>();
							courses = (new CourseUtils()).getArray();
						%>
						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<!-- HOA CODE -->
										<th>Hình ảnh</th>
										<th>Tên lớp học</th>
										<th>Học phí</th>
										<th>Chi tiết</th>
										<th>Bắt đầu</th>
										<th>Lịch học</th>
										<th>Kéo dài</th>
										<th>Ngày cập nhật</th>
										<th>Khóa học</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (int i = 0; i < classes.size(); i++) {
									%>
									<tr id="row-<%=classes.get(i).Id%>">
										<td><img src="/14110013/upload/class/<%=classes.get(i).Image%>" style="max-height:50px;"></td>
										<td><strong><%=classes.get(i).ClassName%></strong></td>
										<td><%=classes.get(i).ClassFee%></td>
										<td><%=classes.get(i).Description%></td>
										<td><%=classes.get(i).Startup%></td>
										<td><%=classes.get(i).Schedule%></td>
										<td><%=classes.get(i).TimeOut%></td>
										<td><%=classes.get(i).DateCreated%></td>
										<td><div class="form-group">
												<select name="CourseId" class="form-control input-sm">
													<%
														for (int j = 0; j < courses.size(); j++) {
																if (courses.get(j).Id.indexOf(classes.get(i).CourseId) > -1) {
													%>
													<option selected value="<%=courses.get(j).Id%>"><%=courses.get(j).CourseName%></option>
													<%
														} else {
													%>
													<option value="<%=courses.get(j).Id%>"><%=courses.get(j).CourseName%></option>
													<%
														}
															}
													%>
												</select>
											</div></td>
										<td><a
											href="advisory-edit-class.jsp?Id=<%=classes.get(i).Id%>"
											class="btn btn-primary"><span
												class="glyphicon glyphicon-edit"></span></a> | <a
											href="/14110013/deleteclass?Id=<%=classes.get(i).Id%>"
											class="btn btn-warning delete-class" data-id="<%=classes.get(i).Id%>"><span
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
	<script src="controllerJs/classController.js">
		
	</script>
</body>
</html>