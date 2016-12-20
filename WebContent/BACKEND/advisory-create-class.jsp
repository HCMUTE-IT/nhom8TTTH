<%@page import="chuongnh.com.utils.CourseUtils"%>
<%@page import="chuongnh.com.model.Course"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Tạo lớp học | Tư vấn viên</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				||!"advisory".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "advisory-create-class");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-advisory.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Tư vấn viên <small>Tạo lớp học</small>
						</h1>
						<%
							ArrayList<Course> courses = new ArrayList<>();
							courses = (new CourseUtils()).getArray();
						%>
						<form action="/14110013/createclass" method="post" role="form" enctype="multipart/form-data">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Tên lớp học</label> <input name="ClassName"
											class="form-control" placeholder="Tên lớp học">
									</div>
									<div class="form-group">
										<label>Khóa học</label> <select name="CourseId" class="form-control input-sm">
													<%
														for (int j = 0; j < courses.size(); j++) {
																if (courses.get(j).Id.indexOf(1) > -1) {
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
									</div>
									<div class="form-group">
										<label>Hình ảnh</label> <input name="Image" type="file"
											class="form-control" placeholder="Hình ảnh">
									</div>
									<div class="form-group">
										<label>Học phí</label> <input name="ClassFee" type="text"
											class="form-control" placeholder="Học phí">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Ngày bắt đầu</label> <input name="Startup" type="date"
											class="form-control" placeholder="Ngày bắt đầu" value="2016-01-01">
									</div>
									<div class="form-group">
										<label>Kéo dài</label> <input name="TimeOut" type="text"
											class="form-control" placeholder="Kéo dài">
									</div>

									<div class="form-group">
										<label>Lịch học</label> <input name="Schedule" type="text"
											class="form-control" placeholder="Lịch học">
									</div>

									<div class="form-group">
										<label>Địa điểm</label> <input name="Address" type="text"
											class="form-control" placeholder="Địa điểm">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>Chi tiết khóa học</label>
								<textarea id="class-content" name="Description"
									class="form-control" rows="3"></textarea>
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
	<script>
		$(document).ready(function() {
			$('#class-content').summernote({
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