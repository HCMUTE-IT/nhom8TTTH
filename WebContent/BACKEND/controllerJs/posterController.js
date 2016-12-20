$(function() {
	$('.delete-poster').off('click').on('click', function(e) {
		e.preventDefault();
		var r = confirm("Xóa poster này?");
		if (r == true) {
			var data = $(this).attr("href");

			var Id = $(this).attr("data-Id");
			//console.log(data);
			$.ajax({
				data : data,
				method : "post",
				url : $(this).attr("href"),
				success : function(data) {
					if (data.status == true) {
						$.notify({
							message : "Đã xóa " + data.result + " thành công.",
							//url : location,
							target : "_self"
						}, {
							type : 'success'
						});
						//console.log("#row-" + Id);
						$("#row-" + Id).remove();
					} else {
						$.notify({
							message : "Đã xóa " + data.result + " thất bại.",
							//url : location,
							target : "_self"
						}, {
							type : 'danger'
						});
					}
				}
			})
		} else {
		}
	})
})