// JavaScript Document
$(document).ready(function(){
	//Scroll
	$(window).scroll(function(){
		var indexScroll = $('html').scrollTop();
		if(indexScroll > 150){
			$('#divToTop').animate({opacity:1},3);
		} else {
			$('#divToTop').animate({opacity:0},3);
		}
	});
	
	$('#divToTop').click(function(){
		$('html').animate({scrollTop:0},300);
	});
	
	//Load trang
	$('.divLoadTrang').css({'opacity':'0','visibility':'hidden'});

	//Sự kiện bấm vào xem nhanh sản phẩm
	$('.divIconXemNhanh').click(function () {
		var idProduct = $(this).attr('data-idProduct');
		var contextPath = $(this).attr('data-contexPath');
		var url = contextPath + "/quickViewProduct?id=" + idProduct;

		$('#modal-xemNhanhSP').load(url, function () {
			$('#modal-xemNhanhSP').modal('toggle');
		});
	});

	//sự kiện bấm nút đăng ký
	$('#btn-form-signup').click(function(){
		var errEmail 		= $('#small-signup-err-email');
		var errPhone 		= $('#small-signup-err-phone');

		if (checkInfoRegis()){
			var contextPath = $(this).attr('data-contextPath');

			$.ajax({
				url:contextPath + "/ajax/xuLyDangKy",
				type:'POST',
				data: $('#form-regis').serialize(),
				success: function (value) {
					if (value == "success") {
						var urlNow = window.location.href;

						window.location = urlNow;
					} else if (value == "phone_exist") {
						errPhone.text("Số điện thoại đã được sử dụng để đăng ký tài khoản!")
						errEmail.text("");
					} else if (value == "email_exist"){
						errPhone.text("")
						errEmail.text("Email đã được sử dụng để đăng ký tài khoản");
					}
				}
			})
		}
	});

	//sự kiện bấm nút đăng nhập
	$('#btn-form-login').click(function(){
        var err_pass = $('#small-login-err-password');
        var err_email = $('#small-login-err-email');
        
		if (checkInfoLogin()){
			var contextPath = $(this).attr('data-contexPath');

			$.ajax({
				url:contextPath + "/ajax/xuLyDangNhap",
				type:'POST',
				data: $('#form-login').serialize(),
				success: function (value) {
					if (value == "success") {
                        var urlNow = window.location.href;

                        window.location = urlNow;
                    } else if (value == "password_wrong") {
                        err_pass.text("Mật khẩu không đúng!")
                        err_email.text("");
                    } else if (value == "email_not_exist"){
                        err_pass.text("")
                        err_email.text("Email không tồn tại!");
                    }
				}
			})
		}
	});

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

	//sự kiện bấm nút thêm vào giỏ hàng
	$('.divIconMuaHang').click(function () {
		var contextPath = $(this).attr('data-contextPath');
		var idProduct = $(this).attr('data-idProduct');

		$.ajax({
			url:contextPath + "/ajax/themGioHang",
			type:'POST',
			data: {
				idProduct : idProduct
			},
			success: function (value) {
				$('.divSoLuong>p').text(value);
				Swal.fire({
					position: 'top-end',
					type: 'success',
					title: 'Đã thêm vào giỏ hàng',
					showConfirmButton: false,
					timer: 1500
				})
			}
		})
	});
});

//show Xem nhanh sản phẩm
function showXemNhanhSP(){
	$('#modal-xemNhanhSP').modal('toggle');
}

//show form đăng ký
function showSignup(){
	$('#modal-login').modal('hide');
	$('#modal-signup').modal('toggle');
}

//show form đăng nhập
function showLogin(){
	$('#modal-signup').modal('hide');
	$('#modal-login').modal('toggle');
}

//check thông tin đăng ký
function checkInfoRegis(){
	var name 	= $('#txt-signup-name').val();
	var email 		= $('#txt-signup-email').val();
	var pass 		= $('#txt-signup-password').val();
	var repass 		= $('#txt-signup-repassword').val();
	var phone	 	= $('#txt-signup-phone').val();

	var errFirstName 	= $('#small-signup-err-name');
	var errEmail 		= $('#small-signup-err-email');
	var errPass 		= $('#small-signup-err-password');
	var errRepass 		= $('#small-signup-err-repassword');
	var errPhone 		= $('#small-signup-err-phone');

	if(name.length === 0){
		errFirstName.text('Vui lòng nhập họ và tên của bạn!');
		$('#txt-signup-name').focus();
		return false;
	} else {
		errFirstName.text('');
	}

	if(!/^(0|\+84){1}(9|3|7|8|5){1}\d{8}$/.test(phone)){
		errPhone.text('Số điện thoại không hợp lệ!');
		$('#txt-signup-phone').focus();
		return false;
	} else {
		errPhone.text('');
	}

	if(/^([\w\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{1})+$/.test(email) === false){
		errEmail.text('Địa chỉ email không hợp lệ!');
		$('#txt-signup-email').focus();
		return false;
	} else {
		errEmail.text('');
	}

	if(pass.length <= 5){
		errPass.text('Mật khẩu phải có ít nhất 6 kí tự!');
		$('#txt-signup-password').focus();
        return false;
	} else {
		errPass.text('');
	}

	if(pass !== repass){
		errRepass.text('Mật khẩu và nhập lại mật khẩu không khớp!');
		$('#txt-signup-repassword').focus();
        return false;
	} else {
		errRepass.text('');
	}

	return true;
}

//check info đăng nhập
function checkInfoLogin(){
	var pass	= $('#txt-login-password').val();
	var email	= $('#txt-login-email').val();

	var err_pass = $('#small-login-err-password');
	var err_email = $('#small-login-err-email');

	if(/^([\w\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{1})+$/.test(email) === false){
		err_email.text('Địa chỉ email không hợp lệ!');
        return false;
    } else {
		err_email.text('');
	}

    if(pass.length === 0){
        err_pass.text('Vui lòng nhập mật khẩu!');
        return false;
    } else {
        err_pass.text('');
    }

	return true;
}




















