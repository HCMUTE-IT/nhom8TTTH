$(function() {
	$('.delete-post').off('click').on('click', function(e) {
		e.preventDefault();

		var url = $(this).attr('href');
		var id = $(this).attr('data-id');
		console.log(url);
		var r = confirm('Bạn muốn xóa?');
		if (r == true) {
			$.ajax({
				url : url,
				method : 'post',
				data : url,
				success : function(data) {
					if (data.status == true) {
						$.notify({
							message : 'Đã xóa ' + id + ' thành công.'
						})
						$('#row-' + id).remove();
					} else {
						message: 'Đã xóa' + id + ' thất bái.'
					}
				}

			})
		}
	})
})