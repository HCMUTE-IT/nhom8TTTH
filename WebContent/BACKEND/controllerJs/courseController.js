$(function(){
	$('.delete-course').off('click').on('click',function(e){
		e.preventDefault();
		var url=$(this).attr('href');		
		var id=$(this).attr('data-id');
		
		var result=confirm('Bạn có muốn xóa khóa học này không?');
		if(result==true){
			$.ajax({
				url:url,
				method:'POST',
				success:function(data){
					if(data.status==true){
						$.notify({
							message:'Bạn đã xóa khóa học thành công'
						},{
							type:'success'
						}),
						$('#row-'+id).remove()
					}else{
						$.notify({
							message:'Xóa khóa học thất bại'
						},{
							type:'danger'
						})
					}
				},
				error:function(data){
					$.notify({
						message:'Xóa khóa học thất bại'
					},{
						type:'danger'
					})
				}
			})
		}
			
	})
})