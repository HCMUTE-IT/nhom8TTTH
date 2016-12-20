$(function() {
	$('.delete-account').off('click').on('click', function(e) {
		e.preventDefault();
		var r = confirm("Xóa người dùng này?");
		
		if (r == true) {
			//var data = $(this).attr("href");

			var UserName = $(this).attr("data-UserName");
			
			//console.log(data);
			$.ajax({
				//data : data,
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
						//console.log("#row-" + UserName);
						
						$("#row-" + UserName).remove();
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