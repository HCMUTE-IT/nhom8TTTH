$(function() {
	$(".delete-class").off("click").on("click", function(e) {
		e.preventDefault();
		var url = $(this).attr("href");
		var Id = $(this).attr("data-id");
		var result = confirm("Bạn có chắc chắn muốn xóa lớp học này ?");
		if (result == true) {
			$.ajax({
				method : "POST",
				url : url,

				success : function(data) {
					if (data.status == true) {
						$.notify({
							message : "Đã xóa lớp học thành công"

						}, {
							type : 'success'
						}), $("#row-" + Id).remove();
					} else {
						$.notify({
							message : "Xóa thất bại"
						}, {
							type : 'danger'
						})
					}

				},
				error : function(data) {
					$.notify({
						message : "Xóa thất bại",

					}, {
						type : 'danger'
					})
				}
			})
		}
	})
})