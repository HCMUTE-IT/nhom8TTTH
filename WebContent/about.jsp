<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Giới thiệu</title>
<jsp:include page="_styles.jsp"></jsp:include>
</head>
<body>
	<%session.setAttribute("active", "about"); %>
	<jsp:include page="_menu.jsp"></jsp:include>
	<div class="container container-content">
		<!--CONTENT-->
	<div class="container">
		<div class="row">
			<div class="col-md-12"><legend>GIỚI THIỆU</legend></div>
			<div class="col-md-5">
				<img src="content/image/ttthImage.jpg" class="img img-responsive" alt="Image">
			</div>
			<div class="col-md-7">
				<legend>TRUNG TÂM TIN HỌC</legend>
				<p>Giảng viên giàu kinh nghiệm, phần lớn từ khoa Công nghệ thông tin</p>
				<p>Giảng dạy tận tâm, nhiệt tình, chu đáo</p>
				<p>Chương trình thường xuyên cập nhật đáp ứng yêu cầu xã hội.</p>
				
			</div>
		</div>
		<div class="row m-t-10">
			<div class="col-md-12"><legend>ĐỘI NGŨ GIẢNG VIÊN</legend></div>
			
			
			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="content/image/person.png" src="content/image/person.png" alt="">
					<div class="caption">
						<h3>Nguyễn Văn A</h3>
						<p>
							Giảng viên chuyên môn về...
						</p>
						<p class="text-center">
							<a href="#"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span></a>
							<a href="#"><span class="glyphicon glyphicon-phone" aria-hidden="true"></a>
						</p>
					</div>
				</div>
			</div>
		
	
			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="content/image/person.png" src="content/image/person.png" alt="">
					<div class="caption">
						<h3>Nguyễn Văn B</h3>
						<p>
							Giảng viên chuyên môn về...
						</p>
						<p class="text-center">
							<a href="#"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span></a>
							<a href="#"><span class="glyphicon glyphicon-phone" aria-hidden="true"></a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="content/image/person.png" src="content/image/person.png" alt="">
					<div class="caption">
						<h3>Nguyễn Văn C</h3>
						<p>
							Giảng viên chuyên môn về...
						</p>
						<p class="text-center">
							<a href="#"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span></a>
							<a href="#"><span class="glyphicon glyphicon-phone" aria-hidden="true"></a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="content/image/person.png" src="content/image/person.png"  alt="">
					<div class="caption">
						<h3>Nguyễn Văn D</h3>
						<p>
							Giảng viên chuyên môn về...
						</p>
						<p class="text-center">
							<a href="#"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span></a>
							<a href="#"><span class="glyphicon glyphicon-phone" aria-hidden="true"></a>
						</p>
					</div>
				</div>
			</div>
			
		</div>
	</div>
		
		
		
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
	<jsp:include page="_register.jsp"></jsp:include>
	<jsp:include page="_login.jsp"></jsp:include>
	<jsp:include page="_scripts.jsp"></jsp:include>
	<jsp:include page="_zotachat.jsp"></jsp:include>
</body>
</html>