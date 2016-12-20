$(function() {
	$('#form-register').submit(function(e) {
		e.preventDefault();
		var action = $(this).attr('action');
		var method = $(this).attr('method');
		var data = $(this).serialize();

		var url = $(location);
		console.log(url);
		$.ajax({
			url : action,
			method : method,
			data : data,

			success : function(data) {
				if (data.status == true) {
					$.notify({
						message : 'Đăng ký khóa học thành công'
					}, {
						type : 'success'
					})
					// $(location).attr(location);
				} else {
					$.notify({
						message : 'Đăng ký khóa học thất bại'
					}, {
						type : 'danger'
					})
				}
			},
			error : function(err) {

			}
		})
	})
})