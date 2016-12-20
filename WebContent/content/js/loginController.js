
$(function() {
	$('#form-login').submit(function(e) {
		e.preventDefault();
		var action = $(this).attr('action');
		var method = $(this).attr('method');
		var data = $(this).serialize();

		var url = $(location);
		// console.log(url);
		$.ajax({
			url : action,
			method : method,
			data : data,

			success : function(data) {
				console.log(data);
				if (data.status == true) {
					//alert(data.username + ' dang nhap thanh cong');
					$(location).attr(location);
				} else {
					alert('Dang nhap that bai');
				}
			},
			error : function(err) {

			}
		})
	})
})
