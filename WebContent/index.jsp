
<%@page import="chuongnh.com.model.Class"%>
<%@page import="chuongnh.com.utils.ClassUtils"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Trang chủ</title>
<jsp:include page="_styles.jsp"></jsp:include>
</head>
<body>
	<%
		session.setAttribute("active", "index");
	%>
	<jsp:include page="_menu.jsp"></jsp:include>

	<div class="container container-content">
		<div class="col-md-9">
			<jsp:include page="_carousel.jsp"></jsp:include>
			<hr>
			<div class="panel panel-primary">
				<div class="panel-heading">
					LỊCH KHAI GIẢNG
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Mã lớp</th>
									<th>Tên lớp</th>
									<th>Học phí</th>
									<th>Ngày khai giảng</th>
									<th>Thời gian</th>
									<th>Lịch học</th>
									<th>Đăng ký</th>
								</tr>
							</thead>
							<tbody>
								<%
									ArrayList<Class> classes = new ArrayList<>();
									classes = (new ClassUtils()).getArray();
									for (int i = 0; i < classes.size(); i++) {
								%>
								<tr>
									<td><%=classes.get(i).Id%></td>
									<td><%=classes.get(i).ClassName%></td>
									<td><%=classes.get(i).ClassFee%></td>
									<td><%=classes.get(i).Startup%></td>
									<td><%=classes.get(i).TimeOut%></td>
									<td><%=classes.get(i).Schedule%></td>
									<td><a class="btn-theme"
										href="register.jsp?CourseId=<%=classes.get(i).CourseId%>">Đăng
											ký</a></td>
								</tr>

								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
		<div class="col-md-3">
			<jsp:include page="_left-menu.jsp"></jsp:include>
		</div>
	</div>

	<jsp:include page="_footer.jsp"></jsp:include>
	<jsp:include page="_register.jsp"></jsp:include>
	<jsp:include page="_login.jsp"></jsp:include>
	<jsp:include page="_scripts.jsp"></jsp:include>
	<jsp:include page="_zotachat.jsp"></jsp:include>
</body>
</html>