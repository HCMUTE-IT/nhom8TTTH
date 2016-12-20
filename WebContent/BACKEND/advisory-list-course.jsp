<%@page import="chuongnh.com.utils.CourseUtils"%>
<%@page import="chuongnh.com.model.Course"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Danh sách khóa học | Tư vấn viên</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				|| !"advisory".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "advisory-list-course");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-advisory.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Tư vấn viên <small>Danh sách khóa học</small>
							<div class="pull-right">
								<a href="advisory-create-course.jsp" class="btn btn-primary">Thêm
									mới</a>
							</div>
						</h1>
						<!-- HOA CODE -->
						<%
							ArrayList<Course> courses = new ArrayList<>();
							CourseUtils courseUtils = new CourseUtils();
							courses = courseUtils.getArray();
						%>
						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Hình ảnh</th>
										<th>Tên khóa học</th>
										<th>Chi tiết</th>
										<th>Ngày cập nhật</th>
										<th>Người cập nhật</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (int i = 0; i < courses.size(); i++) {
									%>
									<tr id="row-<%=courses.get(i).Id %>">
										<td><img src="/14110013/upload/course/<%=courses.get(i).Image%>" style="max-height:50px;"></td>
										<td><strong><%=courses.get(i).CourseName%></strong></td>
										<td><%=courses.get(i).Description%></td>
										<td><%=courses.get(i).DateCreated%></td>
										<td><strong><%=courses.get(i).CreatedBy%></strong></td>
										<td><a
											href="advisory-edit-course.jsp?Id=<%=courses.get(i).Id%>
											"
											class="btn btn-primary"><span
												class="glyphicon glyphicon-edit"></span></a> | <a
											href="/14110013/deletecourse?Id=<%=courses.get(i).Id%>"
											class="btn btn-warning delete-course" data-id="<%=courses.get(i).Id%>"><span
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
	<script src="controllerJs/courseController.js"></script>
</body>
</html>