<%@page import="java.util.ArrayList"%>
<%@page import="chuongnh.com.utils.PosterUtils"%>
<%@page import="chuongnh.com.model.Poster"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Danh sách bài đăng | Quản lý nội dung</title>
<jsp:include page="_Styles.jsp"></jsp:include>
<jsp:include page="_Scripts.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("UserNameLoginBackend") == null
				||!"content".equals(session.getAttribute("RoleLoginBackend"))) {
			response.sendRedirect("login-backend.jsp");
		}
		session.setAttribute("active", "content-list-poster");
	%>
	<div class="wrapper">
		<jsp:include page="_menu-content.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Quản lý nội dung <small>Danh sách Poster</small>
							<div class="pull-right">
								<a href="content-create-poster.jsp" class="btn btn-primary">Thêm
									mới</a>
							</div>
						</h1>

						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr> 
									    <th>Mã</th>
										<th>Tiêu đề</th>
										<th>Mô tả</th>
										<th>Khóa học</th>
										<th>Hình ảnh</th>
										<th>Ngày cập nhật</th>
										<th>Người cập nhật</th> 
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<%
										ArrayList<Poster> ps = new ArrayList();
										PosterUtils uls = new PosterUtils();
										ps = uls.getArray(); 

										for (int i = 0; i < ps.size(); i++) {
											System.out.print("title: "+ps.get(i).Title);
									%>
									<tr id="row-<%=ps.get(i).Id%>">
										<td><strong><%=ps.get(i).Id%></strong></td>
										<td><strong><%=ps.get(i).Title%></strong></td>
										<td><%=ps.get(i).Description%></td>
										<td><%=ps.get(i).CourseId%></td>  
										<td><img src="../upload/poster/<%=ps.get(i).Image%>" style= "max-height:50px;"></td>
										 <td><strong><%=ps.get(i).DateCreated%></strong></td>
										 <td><strong><%=ps.get(i).CreatedBy%></strong></td>
										<td><a
											href="content-edit-poster.jsp?Id=<%=ps.get(i).Id%>"
											class="btn btn-primary"><span
												class="glyphicon glyphicon-edit"></span></a> | <a
											href="/14110013/deleteposter?Id=<%=ps.get(i).Id%>"
											class="btn btn-warning delete-poster"
											data-Id="<%=ps.get(i).Id%>"><span
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
	<script src = "controllerJs/posterController.js">
	
	</script>
</body>
</html>