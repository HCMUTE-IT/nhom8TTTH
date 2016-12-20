$(function() {
	$('#logout').on('click', function(e) {
		e.preventDefault();
	})
	$.ajax({
		url : 'logout',
		method : 'post',
		success : function(data) {
			console.log(data);
			if (data.status == true) {
				console.log('logout true');
				$(location).attr('href','index.jsp');
			} else {
				//alert('Dang xuat that bai');
				console.log('logout false');
			}
		},
		error : function(err) {

		}
	})
})