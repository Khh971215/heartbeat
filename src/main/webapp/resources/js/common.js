//common.js
$(function(){
	uploadFileName();
});


function uploadFileName(){
	$('#file').on('change',function(){
		var fileName = $('#file').val().split('/').pop().split('\\').pop();
		$('.fileName i').html(fileName);
	});
}