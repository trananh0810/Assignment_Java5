// JavaScript Document
$(document).ready(function(){
	//sự kiện nút đăng xuất
	$('#btn-logout').click(function () {
		var contextPath = $(this).attr('data-contextPath');

		$.ajax({
			url:contextPath + "/ajax/xuLyDangXuat",
			type:'POST',
			success: function (value) {
				if (value == "success") {
					var urlNow = window.location.href;

					window.location = urlNow;
				}
			}
		})
	});
});



















