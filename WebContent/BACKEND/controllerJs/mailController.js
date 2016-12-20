$(function() {
	$('#form-mail').submit(
			function(e) {
				e.preventDefault();
				
				var action = $(this).attr('action');
				var method = $(this).attr('method');
				var data = $(this).serialize();

				$.notify({
					message : "Đang gửi mail. Vui lòng đợi trong giây lát",
					//url : location,
					target : "_self"
				});

				//var url = $(location);
				// console.log(url);
				$.ajax({
					url : action,
					method : method,
					data : data,

					success : function(data) {
						//console.log(data);
						if (data.status == true) {
							// alert(data.username + ' dang nhap
							// thanh cong');
							// $(location).attr(location);
							$.notify({
								message : "Email đã được chuyển tới "
										+ data.recipient + " thành công.",
								url : location,
								target : "_self"
							}, {
								type : 'success'
							});
						} else {
							$.notify({
								message : "Email đã được chuyển tới "
										+ data.recipient + " thất bại.",
								url : location,
								target : "_self"
							}, {
								type : 'danger'
							});
						}
					},
					error : function(err) {

					}
				})
			})
})